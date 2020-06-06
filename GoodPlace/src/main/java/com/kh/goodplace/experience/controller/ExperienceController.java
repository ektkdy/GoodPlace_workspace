package com.kh.goodplace.experience.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.goodplace.common.model.vo.Attachment;
import com.kh.goodplace.common.model.vo.PageInfo;
import com.kh.goodplace.common.template.Pagination;
import com.kh.goodplace.experience.model.service.ExperienceService;
import com.kh.goodplace.experience.model.vo.Experience;
import com.kh.goodplace.member.model.vo.Member;

@Controller
public class ExperienceController {
	
	@Autowired // DI
	private ExperienceService expService;
	
	/* 전달받은 파일을 서버에 업로드시킨 후 수정명을 리턴하는 메소드 */
	public String saveFile(MultipartFile file, HttpServletRequest request) {
		
		// 파일을 업로드 시킬 폴더 경로(String savePath)
		String resources = request.getSession().getServletContext().getRealPath("resources");
		//웹컨테이너의 resources의 물리적인 경로 알아내는 것		

		String savePath = resources + "\\uploadFiles\\";
		
		// 원본명(aaa.jpg)
		String originName = file.getOriginalFilename();
		
		// 수정명(20200522202011.jpg 년월일시분초.기존의원본의확장자)
		// 년월일시분초 (String currentTime)
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		
		// 확장자(String ext)
		String ext = originName.substring(originName.lastIndexOf(".")); // ".jpg"
				//lastIndexOf : 원본명이름중에 . 이후 ~ 마지막 까지 선택
		String changeName = currentTime + (int)(Math.random()*1000)+1 + ext ;
		
		try {
			file.transferTo(new File(savePath + changeName));
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		// transferTo : 어떤 폴더에 어떤 이름으로 저장할지 지정하는 메소드
		
		return changeName;
		
	}
	
	/* 1. 체험관리- 전체 체험목록 조회용 서비스 */
	@RequestMapping("list.exp")
	public String selectExpList(int currentPage, Model model, Member m, HttpSession session) {
		
		Member loginUser  = (Member)session.getAttribute("loginUser");
		int usNo = loginUser.getUsNo();
		
		int listCount = expService.selectExpListCount(usNo);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		
		ArrayList<Experience> list = expService.selectExpList(pi, usNo);
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
		return "partner/partnerExpList";
	}
	
	/* 2_1. 체험등록 폼1 요청 */
	@RequestMapping("expEnrollForm1.exp")
	public String expForm() {
		return "partner/partnerExpEnrollForm1";
	}
	
	/* 2_2. 체험등록 폼2 요청 */
	@RequestMapping("expEnrollForm2.exp")
	public ModelAndView expForm2(Experience e, ModelAndView mv) {
		//System.out.println(e);
		mv.addObject("e", e);
		mv.setViewName("partner/partnerExpEnrollForm2");
		return mv;
	}
	
	/* 2_3. 체험등록용 서비스 */
	@RequestMapping("insert.exp")
	public String insertExp(Experience e, @RequestParam(name="thumb", required=true) MultipartFile file,
			 @RequestParam(name="file", required=false) MultipartFile[] filelist,
			HttpServletRequest request/* , Attachment[] at */) {
		
		
		if(!file.getOriginalFilename().equals("")) {
			
			String changeName = saveFile(file, request);
			e.setOriginName(file.getOriginalFilename());
			e.setChangeName(changeName);
			e.setFilePath(request.getSession().getServletContext().getRealPath("resources") + "\\uploadFiles\\" + changeName);
		}
		
		int result1 = expService.insertExp(e);
		
		System.out.println(e);
		System.out.println(result1);
		
		int result = 1;
		
		// 상세사진 전용 비어있는 리스트를 생성한 뒤
		ArrayList<Attachment> list = new ArrayList<>();
		
		// filelist로 넘어온 파일들을 하나씩 attachment객체로 생성한다
		for(int i=0; i<filelist.length; i++) {
			
			// 파일은 무조건 1개는 넘어오며, 비어있는 객체는 제외되도록 조건처리
			if(!filelist[i].getOriginalFilename().isEmpty()) { 	
				
				String changeName = saveFile(filelist[i], request);
				
				// attachment객체를 생성해서 담는다(테이블에 한 행이 추가되는 것)
				Attachment at = new Attachment();
				
				at.setOriginName(filelist[i].getOriginalFilename());
				at.setChangeName(changeName);
				at.setFilePath(request.getSession().getServletContext().getRealPath("resources") + "\\uploadFiles\\" + changeName);
				
				// 잘 추가되었다면 1이 리턴
				int result2 = expService.insertAttachment(at);
				result = result1*result2;
				
				System.out.println(result2);
				System.out.println(at);
			}
		}
		System.out.println(list);
		System.out.println(result);
		
		
		if(result>0) {
			return "redirect:list.exp?currentPage=1";
		}else {
			return "common/errorPage";
		}
	}
	
	
	
	
	/* 8. 정산관리- expPay union roomsPay 리스트 조회용 */
	@RequestMapping("partnerIncome.me")
	public String selectIncomeList(int currentPage, Model model, int usNo) {
		int listCount = expService.selectExpListCount(usNo);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		
		return "partner/partnerIncome";
	}

}
