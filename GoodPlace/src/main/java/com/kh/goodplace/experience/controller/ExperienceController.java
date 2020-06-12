package com.kh.goodplace.experience.controller;

import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.kh.goodplace.common.model.vo.Attachment;
import com.kh.goodplace.common.model.vo.PageInfo;
import com.kh.goodplace.common.template.Pagination;
import com.kh.goodplace.experience.model.service.ExperienceService;
import com.kh.goodplace.experience.model.vo.Experience;
import com.kh.goodplace.member.model.vo.Member;
import com.kh.goodplace.room.model.vo.Room;

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
	
	// 전달받은 파일명을 가지고 서버로부터 삭제하는 메소드 
	public void deleteFile(String fileName, HttpServletRequest request) {
		String resources = request.getSession().getServletContext().getRealPath("resources");
		String savePath = resources +"\\uploadFiles\\";
		
		File deleteFile = new File(savePath + fileName);
		deleteFile.delete();
	};
		

	//-----------------------------------------------------------------------------------------------------
	
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
			HttpServletRequest request/* , Attachment at */) {
		
		if(!file.getOriginalFilename().equals("")) {
			String changeName = saveFile(file, request);
			e.setOriginName(file.getOriginalFilename());
			e.setChangeName(changeName);
			e.setFilePath(request.getSession().getServletContext().getRealPath("resources") + "\\uploadFiles\\" + changeName);
		}
		int result1 = expService.insertExp(e);
		
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
			}
		}
		
		if(result>0) {
			return "redirect:list.exp?currentPage=1";
		}else {
			return "common/errorPage";
		}
	}
	
	/* 3. 체험 상세보기용 서비스 */
	@RequestMapping("expDetail.exp")
	public ModelAndView selectExp(int exNo, ModelAndView mv) {
		// Experience테이블과 Attachment테이블 join하여 데이터 가져옴
		ArrayList<Experience> list = expService.selectExp(exNo);
		
		if(list != null) {
			mv.addObject("list", list);
			mv.setViewName("partner/partnerExpDetail");
		}else {
			mv.addObject("msg", "상세보기 실패");
			mv.setViewName("partner/partnerExpList");
		}
		return mv;
	}
	
	/* 4_1. 체험수정폼 요청용 서비스 */
	@RequestMapping("updateExpForm.exp")
	public String updateExpForm(int exNo,  Model model) {
		// exNo보내서 해당하는 e객체와 list불러와서 폼 내부에 뿌려주기
		Experience e = expService.selectExpOne(exNo);
		ArrayList<Attachment> list = expService.selectAt(exNo);
		
		model.addAttribute("e", e);
		model.addAttribute("list", list);
		
		return "partner/partnerExpUpdateForm";
	}
	
	/* 4_2. 체험 업데이트 */
	@RequestMapping("updateExp.exp")
	public String updateExp(Experience e, @RequestParam(name="thumb", required=true) MultipartFile file,
			 @RequestParam(name="file", required=false) MultipartFile[] filelist,
			HttpServletRequest request) {

		if(!file.getOriginalFilename().equals("")) {
			if(e.getChangeName() != null) {
				deleteFile(e.getChangeName(), request);
			}
			String changeName = saveFile(file, request);
			e.setOriginName(file.getOriginalFilename());
			e.setChangeName(changeName);
			e.setFilePath(request.getSession().getServletContext().getRealPath("resources") + "\\uploadFiles\\" + changeName);
		}
		int result1 = expService.updateExp(e);	// 객체 정보와 썸네일 넘어감
		
		int result = 1;
		
		// 상세사진 전용 비어있는 리스트를 생성한 뒤 ---------------------- 이 이후로는 상세사진 쪽 ---
		ArrayList<Attachment> list = new ArrayList<>();
		
		// filelist로 넘어온 파일들을 하나씩 attachment객체로 생성한다
		for(int i=0; i<filelist.length; i++) {
			
			// 파일은 무조건 1개는 넘어오며, 비어있는 객체는 제외되도록 조건처리
			if(!filelist[i].getOriginalFilename().isEmpty()) { 	
				
				String changeName = saveFile(filelist[i], request);
				
				// attachment객체를 생성해서 담는다(테이블에 한 행이 추가되는 것)
				Attachment at = new Attachment();
				
				at.setExNo(e.getExNo());
				at.setOriginName(filelist[i].getOriginalFilename());
				at.setChangeName(changeName);
				at.setFilePath(request.getSession().getServletContext().getRealPath("resources") + "\\uploadFiles\\" + changeName);
				
				// 잘 추가되었다면 1이 리턴
				int result2 = expService.updateAt(at);
				result = result1*result2;
			}
		}
		
		if(result>0) {
			return "redirect:list.exp?currentPage=1";
		}else {
			return "common/errorPage";
		}
	}
	
	
	/* 5_1. 거절사유가 담긴 체험수정폼 요청용 서비스 */
	@RequestMapping("updateReExpForm.exp")
	public String updateReExpForm(int exNo,  Model model) {
		// exNo보내서 해당하는 e객체와 l${ ist불러와서 폼 내부에 뿌려주기
		Experience e = expService.selectExpOne(exNo);
		ArrayList<Attachment> list = expService.selectAt(exNo);
		
		model.addAttribute("e", e);
		model.addAttribute("list", list);
		
		return "partner/partnerExpEnrollReturn";
	}
	
	
	/* 5_2. 거절사유 확인후 수정하고 재심사요청 */
	@RequestMapping("updateReExp.exp")
	public String updateReExp(Experience e, @RequestParam(name="thumb", required=true) MultipartFile file,
			 @RequestParam(name="file", required=false) MultipartFile[] filelist,
			HttpServletRequest request) {
		
		if(!file.getOriginalFilename().equals("")) {
			if(e.getChangeName() != null) {
				deleteFile(e.getChangeName(), request);
			}
			String changeName = saveFile(file, request);
			e.setOriginName(file.getOriginalFilename());
			e.setChangeName(changeName);
			e.setFilePath(request.getSession().getServletContext().getRealPath("resources") + "\\uploadFiles\\" + changeName);
		}
		int result1 = expService.updateReExp(e);
		
		int result = 1;
		
		// 상세사진 전용 비어있는 리스트를 생성한 뒤
		ArrayList<Attachment> list = new ArrayList<>();
		
		// filelist로 넘어온 파일들을 하나씩 attachment객체로 생성한다
		for(int i=0; i<filelist.length; i++) {
			
			// 파일은 무조건 1개는 넘어오며, 비어있는 객체는 제외되도록 조건처리
			if(!filelist[i].getOriginalFilename().isEmpty()) { 	
				
				if(filelist[i].getName() != null) {
					deleteFile(e.getChangeName(), request);
				}
				
				String changeName = saveFile(filelist[i], request);
				
				// attachment객체를 생성해서 담는다(테이블에 한 행이 추가되는 것)
				Attachment at = new Attachment();
				
				at.setOriginName(filelist[i].getOriginalFilename());
				at.setChangeName(changeName);
				at.setFilePath(request.getSession().getServletContext().getRealPath("resources") + "\\uploadFiles\\" + changeName);
				
				// 잘 추가되었다면 1이 리턴
				int result2 = expService.insertAttachment(at);
				result = result1*result2;
			}
		}
		
		if(result>0) {
			return "redirect:list.exp?currentPage=1";
		}else {
			return "common/errorPage";
		}
		
	}
	
	
	@RequestMapping("rest.exp")
	public String restExp(int exNo) {
		int result = expService.restExp(exNo);
		
		if(result>0) {
			return "redirect:list.exp?currentPage=1";
		} else {
			return "common/errorPage";
		}
	}
	
	@RequestMapping("delete.exp")
	public String deleteExp(int exNo) {
		int result = expService.deleteExp(exNo);
		
		if(result>0) {
			return "redirect:list.exp?currentPage=1";
		} else {
			return "common/errorPage";
		}
	}
	
	@RequestMapping("endRest.exp")
	public String endRestExp(int exNo) {
		int result = expService.endRestExp(exNo);
		
		if(result>0) {
			return "redirect:list.exp?currentPage=1";
		} else {
			return "common/errorPage";
		}
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	//------------[체험관리]------------
	@RequestMapping("aExpWaitList.ex")
	public String selectExpWaitList(int currentPage, Model model) {
		
		int listCount = expService.selectListExpWaitCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		
		ArrayList<Experience> list = expService.selectExpWaitList(pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
		return "admin/adminExpWaitList";
	}
	
	@RequestMapping("aExpOkayList.ex")
	public String selectExpOkayList(int currentPage, Model model) {
		
		int listCount = expService.selectListExpOkayCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		
		ArrayList<Experience> list = expService.selectExpOkayList(pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
		return "admin/adminExpOkeyList";
	}
	
	
	// ------------------------------ 파트너 예약관리 시작 ----------------------------------
	
			
			@RequestMapping("rvExpList.rv")
			public String rvExpList(Model model,  int currentPage, HttpSession session) {
				
				Member loginUser = (Member)session.getAttribute("loginUser");
				int usNo = loginUser.getUsNo();
				
				int listCount = expService.selectRvExpListCount(usNo);
			    
			    PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 20);
			    
			    ArrayList<Experience> list = expService.selectRvExpList(pi, usNo);
			    
			    
			    model.addAttribute("pi", pi);
			    model.addAttribute("list", list);
			    
				
			    return "partner/partnerExpReservationListView";
			}
	
			//예약 확정
			@ResponseBody
			@RequestMapping(value="rvExpListIng.rv", produces="application/json; charset=utf-8")
			public String rvRoomListIng(int currentPage, HttpSession session) {
				
				Member loginUser = (Member)session.getAttribute("loginUser");
				int usNo = loginUser.getUsNo();
				
				int listCount = expService.selectRvExpListCount(usNo);
			    
			    PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 20);
			    
			    ArrayList<Experience> list = expService.selectRvExpList(pi, usNo);
			    
			    
			    HashMap<String, Object> map = new HashMap<String, Object>();
			    JsonObject jsonObject = new JsonObject();

			    // Gson 객체 생성
			    Gson gson = new Gson();

			    // JSON Object를 맵으로 바꿈
			    gson.fromJson(jsonObject, new HashMap<String, Object>().getClass());  
			     
			    // key-value 형태로 맵에 저장
			    map.put("pi", pi); // 받아온 쿼리 리스트를 hashmap에 담는다.
			    map.put("list", list); // 받아온 문자열을 hashmap에 담는다.


			    // 맵을 JSON Object 문자열로 바꿈
			    String jsonString = gson.toJson(map);

						
			    return jsonString;
			}
			
			//예약 확정
			@ResponseBody
			@RequestMapping(value="rvExpListConfirm.rv", produces="application/json; charset=utf-8")
			public String rvRoomListConfirm(int currentPage, HttpSession session) {
				
				Member loginUser = (Member)session.getAttribute("loginUser");
				int usNo = loginUser.getUsNo();
				
				int listCount = expService.selectRvExpConfirmListCount(usNo);
			    
			    PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 20);
			    
			    ArrayList<Experience> list = expService.selectRvExpConfirmList(pi, usNo);


			    HashMap<String, Object> map = new HashMap<String, Object>();
			    JsonObject jsonObject = new JsonObject();

			    // Gson 객체 생성
			    Gson gson = new Gson();

			    // JSON Object를 맵으로 바꿈
			    gson.fromJson(jsonObject, new HashMap<String, Object>().getClass());  
			     
			    // key-value 형태로 맵에 저장
			    map.put("pi", pi); // 받아온 쿼리 리스트를 hashmap에 담는다.
			    map.put("list", list); // 받아온 문자열을 hashmap에 담는다.


			    // 맵을 JSON Object 문자열로 바꿈
			    String jsonString = gson.toJson(map);

						
			    return jsonString;
			}

			//예약취소
			@ResponseBody
			@RequestMapping(value="rvExpListCancel.rv", produces="application/json; charset=utf-8")
			public String rvRoomListCancel(int currentPage, HttpSession session) {
				
				Member loginUser = (Member)session.getAttribute("loginUser");
				int usNo = loginUser.getUsNo();
				
				int listCount = expService.selectRvExpCancelListCount(usNo);
			    
			    PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 20);
			    
			    ArrayList<Experience> list = expService.selectRvExpCancelList(pi, usNo);


			    HashMap<String, Object> map = new HashMap<String, Object>();
			    JsonObject jsonObject = new JsonObject();

			    // Gson 객체 생성
			    Gson gson = new Gson();

			    // JSON Object를 맵으로 바꿈
			    gson.fromJson(jsonObject, new HashMap<String, Object>().getClass());  
			     
			    // key-value 형태로 맵에 저장
			    map.put("pi", pi); // 받아온 쿼리 리스트를 hashmap에 담는다.
			    map.put("list", list); // 받아온 문자열을 hashmap에 담는다.

			    System.out.println(pi);
			    System.out.println(list);
			    // 맵을 JSON Object 문자열로 바꿈
			    String jsonString = gson.toJson(map);

						
			    return jsonString;
			}
    @RequestMapping("expOkSearch.ex")
    public String expSearchList(int currentPage, Experience e, Model model) {
    	
        int listCount = expService.expSearchCount(e); 
        PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
        
        ArrayList<Experience> list = expService.expSearchList(pi, e);
        
        model.addAttribute("list", list);
        model.addAttribute("e", e);
        model.addAttribute("pi", pi);
        
        return "admin/adminExpOkeyList";
        
    }
	
	//------- 체험조회 시작 ---------------------------------------------------
	// 메인페이지에서 조건 3가지 (위치, 체크인날짜, 체크아웃날짜, 인원) 입력받은 후  숙소검색 페이지로 이동
	@RequestMapping("showExp.exp")
	public ModelAndView showExp(String expCategoryString, String expDateString, String expTitle, Experience exp, ModelAndView mv) {
		//System.out.println("expCategory : " + expCategory + ", " + "expDate : " + expDate + ", " + "expTitle : " + expTitle);
		
		// expCategory 필드 설정
		int expCategory = 0;
		if(expCategoryString.equals("라이프 및 스타일")) {
			expCategory = 1;
		}else if(expCategoryString.equals("문화와 역사")){
			expCategory = 2;
		}else if(expCategoryString.equals("학술과 디자인")){
			expCategory = 3;
		}else if(expCategoryString.equals("스포츠&피트니스")){
			expCategory = 4;
		}else if(expCategoryString.equals("야외활동")){
			expCategory = 5;
		}
		
		// 넘겨받은 여행조건들 exp객체에 set
		exp.setExpCategory(expCategory);
		exp.setExpDateString(expDateString);
		exp.setExpTitle(expTitle);

		// 검색한 조건에 해당하는 exp리스트 조회
		ArrayList<Experience> expList = expService.selectExpListUser(exp);
		
		return mv;
	}
	
	//예약상세
	@RequestMapping("reservationExpDetailView.rv")
	public String reservationDetailView(int epNo, Model model) {
			
		Experience e = expService.reservationExpDetailView(epNo);
		
		model.addAttribute("e", e);
		return "partner/partnerReservationDetailView";
	}

			
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
