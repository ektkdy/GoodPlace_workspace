package com.kh.goodplace.room.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kh.goodplace.common.model.vo.PageInfo;
import com.kh.goodplace.common.template.Pagination;
import com.kh.goodplace.room.model.service.RoomService;
import com.kh.goodplace.room.model.vo.Room;

@Controller
public class RoomController {
	
	@Autowired // DI
	private RoomService rService;
	
	@RequestMapping("list.ro")
	public String selectRoomsList(int currentPage, Model model) {
		
		int listCount = rService.selectListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		
		ArrayList<Room> list = rService.selectRoomsList(pi);
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
		return "partner/partnerRoomListView";
	}
	
	@RequestMapping("insert.ro")
	public String insertRoom(Room r, @RequestParam(name="thumb", required=false) MultipartFile file,
							 @RequestParam(name="file", required=false) MultipartFile[] filelist,
							 HttpServletRequest request) {
		System.out.println(r);
			//현재 넘어온 파일이 있을 경우 서버에 업로드 후 원본명, 수정명 뽑아서 r 주섬주섬 담기
			if(!file.getOriginalFilename().equals("")) {//넘어온 파일명이  빈 문자열이 아닐경우
			
				//서버에 파일 업로드 --> 공통모듈로써 메소드 따로 빼서 정의할 것 savaFile  --> 
				String changeName = saveFile(file, request);
				
				r.setOriginName(file.getOriginalFilename());
				r.setChangeName(changeName);
			
			}
			return "";
					
//			int result = rService.insertRoom(r);
//			
//			if(result > 0) { //숙소 등록 성공 --> 갱신된 리스트가 보여지는 게시글 리스트 페이지 보여지도록 해야함
//				
//				return "redirect:list.ro?currentPage=1";
//			}else { //게시글 작성 실패
//				
//				//메세지
//				return "common/errorPage";
//			}	
		
	}
	
	// 공유해서 쓸 수 있게끔 따로 정의해 놓은 메소드 
		// 전달받은 파일을 서버에 업로드시킨 후 수정명을 리턴하는 메소드
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
			String changeName = currentTime + ext;
			
			try {
				file.transferTo(new File(savePath + changeName));
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			} //
			// transferTo : 어떤 폴더에 어떤 이름으로 저장할지 지정하는 메소드
			
			return changeName;
			
		}
	
	
	
	
	
	
	
// ------------- Power 관리 시작 --------------------------------------------------
	
    @RequestMapping("aPowerList.po")
    public String selectList(Model model)
    {
        
        ArrayList<Room> list = rService.selectPowerList();
        
        model.addAttribute("list", list);
        
        return "admin/a_power";
    }
	
	// ------------- Power 관리 끝 --------------------------------------------------
	
	

}
