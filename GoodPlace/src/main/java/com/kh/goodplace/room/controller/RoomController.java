package com.kh.goodplace.room.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
import com.google.gson.JsonIOException;
import com.google.gson.JsonObject;
import com.kh.goodplace.board.model.service.BoardService;
import com.kh.goodplace.board.model.vo.Board;
import com.kh.goodplace.common.model.vo.Attachment;
import com.kh.goodplace.common.model.vo.PageInfo;
import com.kh.goodplace.common.template.Pagination;
import com.kh.goodplace.member.model.vo.Member;
import com.kh.goodplace.room.model.service.RoomService;
import com.kh.goodplace.room.model.vo.Room;
import com.kh.goodplace.room.model.vo.RoomPay;

@Controller
public class RoomController {
	
	@Autowired // DI
	private RoomService rService;
	
    @Autowired // DI
    private BoardService bService;
    
    
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
		String changeName = currentTime + (int)(Math.random()*1000)+1 + ext ;
		
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
	
	// 전달받은 파일명을 가지고 서버로부터 삭제하는 메소드 
	public void deleteFile(String fileName, HttpServletRequest request) {
		String resources = request.getSession().getServletContext().getRealPath("resources");
		String savePath = resources +"\\uploadFiles\\";
		
		File deleteFile = new File(savePath + fileName);
		deleteFile.delete();
	};
	// 마이페이지 예약내역페이지 이동
	@RequestMapping("ReserveForm.ro")
	public String selectReserve(HttpSession session, Model model) {
		Member m = (Member)session.getAttribute("loginUser");
		ArrayList<RoomPay> rPayList = rService.selectRoomPayList(m);
		
		model.addAttribute("rPayList",rPayList);
		return "user/reserve";
	}
	
	@RequestMapping("myReserveDetail.ro")
	public String myReserveDetail(RoomPay rp, Model model) {
		System.out.println(rp);
		
		model.addAttribute("rp", rp);
		return "user/myReserveDetail";
	}

	//-----------------------------------------------------------------------------------------------------
		
		
		
	
	 @RequestMapping("list.ro")
	 public String selectRoomsList(int currentPage, Model model, 
	       HttpSession session) {
	   
	    Member m = (Member)session.getAttribute("loginUser");
	    
	    int userNo = m.getUsNo();
	    
	    int listCount = rService.selectListCount(userNo);
	    
	    PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 5);
	    
	    ArrayList<Room> list = rService.selectRoomsList(pi, userNo);
	    
	    model.addAttribute("pi", pi);
	    model.addAttribute("list", list);
	    
	    return "partner/partnerRoomListView";
	 }
	
	@RequestMapping("insertRoomForm.ro")
	public String insertRoomForm(){
		
		return "partner/partnerRoomEnrollForm";
	}
	
	@RequestMapping("insert.ro")
	public String insertRoom(Room r, @RequestParam(name="thumb", required=false) MultipartFile file,
							 @RequestParam(name="file", required=false) MultipartFile[] filelist,
							 HttpServletRequest request, Attachment at) {
		
		//현재 넘어온 파일이 있을 경우 서버에 업로드 후 원본명, 수정명 뽑아서 r 주섬주섬 담기
		if(!file.getOriginalFilename().equals("")) {//넘어온 파일명이  빈 문자열이 아닐경우
		
			//서버에 파일 업로드 --> 공통모듈로써 메소드 따로 빼서 정의할 것 savaFile  --> 
			String changeName = saveFile(file, request);
			
			r.setOriginName(file.getOriginalFilename());
			r.setChangeName(changeName);
			r.setFilePath(request.getSession().getServletContext().getRealPath("resources") + "\\uploadFiles\\" + changeName);
		
		}
		
		int result = rService.insertRoom(r);
		
		int rono = rService.selectRono();
		int result1 = 1;
		for(int i=0; i<filelist.length; i++) {
			   if(!filelist[i].getOriginalFilename().equals("")){
			      String changeName = saveFile(filelist[i], request);
			      at.setOriginName(filelist[i].getOriginalFilename());
			      at.setChangeName(changeName);
			      at.setFilePath(request.getSession().getServletContext().getRealPath("resources") + "\\uploadFiles\\" + changeName);
			      at.setRoNo(rono);
			      int result2 = rService.insertAttachment(at);
			      result1 = result1 * result2;
			   }
			}
		
		
		
		if(result*result1 > 0) {
			return "redirect:list.ro?currentPage=1";
		}else {
			return "common/errorPage";
		}
	}
	
	@RequestMapping("roomDetailView.ro")
	public String roomDetailView(int rno, Model model ) {
		
		 Room r = rService.selectRoom(rno);
		
		model.addAttribute("r", r);
		
		return "partner/partnerRoomDetailView";
	}
	
		
	@RequestMapping("updateRoomForm.ro")
	public String updateRoomForm(int roNo, Model model) {
		Room r = rService.selectRoom(roNo);
		ArrayList<Attachment> list = rService.selectAt(roNo);
		
		model.addAttribute("r", r);
		model.addAttribute("list", list);
		
		return "partner/partnerRoomUpdateForm";
		
	}

	@RequestMapping("updateReRoomForm.ro")
	public String updateReRoomForm(int roNo, Model model) {
		Room r = rService.selectRoom(roNo);
		ArrayList<Attachment> list = rService.selectAt(roNo);
		
		model.addAttribute("r", r);
		model.addAttribute("list", list);
		
		return "partner/partnerRoomEnrollReturn";
		
	}
	
	@RequestMapping("delete.ro")
	public String deleteRoom(int roNo) {
		
		int result = rService.deleteRoom(roNo);
		
		if(result>0) {
			return "redirect:list.ro?currentPage=1"; 
		}else {
			return "common/errorPage";
		}
		
	}
	
	@RequestMapping("rest.ro")
	public String restRoom(int roNo) {
		
		int result = rService.restRoom(roNo);
		
		if(result>0) {
			return "redirect:list.ro?currentPage=1"; 
		}else {
			return "common/errorPage";
		}
		
	}
	
	@RequestMapping("endRest.ro")
	public String endRestRoom(int roNo) {
		
		int result = rService.endRestRoom(roNo);
		
		if(result>0) {
			return "redirect:list.ro?currentPage=1"; 
		}else {
			return "common/errorPage";
		}
		
	}
	
	
	@RequestMapping("updateRoom.ro")
	public String updateRoom(Room r, String[] deList, String count ,@RequestParam(name="thumb", required=true) MultipartFile file,
			 @RequestParam(name="file", required=false) MultipartFile[] filelist,
			HttpServletRequest request) {
		
		//System.out.println(count); 	
		int count1 = Integer.parseInt(count);
	
		// x를 누른 수만큼, x에 해당하는 changeName 을 삭제한다 (서버+디비)
		for(int i= 0 ; i<count1 ; i++) {
			//System.out.println(deList[i]);
			String savePath = request.getSession().getServletContext().getRealPath("resources") +"\\uploadFiles\\";
		
			File deleteFile = new File(savePath + deList[i]); 
			deleteFile.delete();
			
			int result1 = rService.deleteAt(deList[i]); 
		}
	
		// 객체+썸네일 부분
		// 썸네일 변경시 기존파일 삭제하고 재업로드
		if(!file.getOriginalFilename().equals("")) {
			if(r.getChangeName() != null) {
				deleteFile(r.getChangeName(), request);
			}
			String changeName = saveFile(file, request);
			r.setOriginName(file.getOriginalFilename());
			r.setChangeName(changeName);
			r.setFilePath(request.getSession().getServletContext().getRealPath("resources") + "\\uploadFiles\\" + changeName);
		}
		int result2 = rService.updateRoom(r);
		
		int result = 1;
		
		// 새롭게 넣고자하는 상세사진을 insert한다
		// 상세사진 전용 비어있는 리스트를 생성한 뒤 
		ArrayList<Attachment> list = new ArrayList<>();
		
		// filelist로 넘어온 파일들을 하나씩 attachment객체로 생성한다
		for(int i=0; i<filelist.length; i++) {
			
			// 파일은 무조건 1개는 넘어오며, 비어있는 객체는 제외되도록 조건처리
			if(!filelist[i].getOriginalFilename().isEmpty()) { 	
				
				String changeName = saveFile(filelist[i], request);
				
				// attachment객체를 생성해서 담는다(테이블에 한 행이 추가되는 것)
				Attachment at = new Attachment();
				
				at.setExNo(r.getRoNo());
				at.setOriginName(filelist[i].getOriginalFilename());
				at.setChangeName(changeName);
				at.setFilePath(request.getSession().getServletContext().getRealPath("resources") + "\\uploadFiles\\" + changeName);
				
				// 잘 추가되었다면 1이 리턴
				int result3 = rService.updateAt(at);
				result = result2*result3;
			}
		}
		
		
		if(result>0) {
			return "redirect:list.ro?currentPage=1"; 
		}else {
			return "common/errorPage";
		}
		
	}
	
	
	
		
		
	@RequestMapping("selectPower.ro")
	public String selectPowerList(int currentPage, HttpSession session, Model model) {
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		int usNo = loginUser.getUsNo();
		
		int listCount = rService.selectRoomOkeyListCount(usNo);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5,5);
		
		ArrayList<Room> list = rService.selectRoomOkeyList(pi, usNo);
		ArrayList<Room> plist = rService.selectPowerList();
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		model.addAttribute("plist", plist);
		
		return "partner/partnerSelectPower";
	}
	
	@RequestMapping("payPower.ro")
	public String payPower(int roNo, int poNo, Model model) {
		Room r = rService.selectRoom(roNo);
		Room p = rService.selectPower(poNo);
		
		model.addAttribute("r", r);
		model.addAttribute("p", p);
		return "partner/payPower";
	}
	
	@RequestMapping("updateRoomPower.ro")
	public String updateRoomPower(Room r, Model model) {
		int result = rService.updateRoomPower(r);
		
		if(result > 0) {
			model.addAttribute("msg", "파워신청이 완료되었습니다.");
			return "redirect:list.ro?currentPage=1";
		}else {
			model.addAttribute("msg", "이미 등록된 파워숙소가 있습니다.");
			return "common/errorPage";
		}
	}
	
	
	@RequestMapping("updateReRoom.ro")
	public String updateReRoom(Room r, String[] deList, String count ,@RequestParam(name="thumb", required=true) MultipartFile file,
			 @RequestParam(name="file", required=false) MultipartFile[] filelist,
			HttpServletRequest request) {
		
		//System.out.println(count); 	
		int count1 = Integer.parseInt(count);
	
		// x를 누른 수만큼, x에 해당하는 changeName 을 삭제한다 (서버+디비)
		for(int i= 0 ; i<count1 ; i++) {
			//System.out.println(deList[i]);
			String savePath = request.getSession().getServletContext().getRealPath("resources") +"\\uploadFiles\\";
		
			File deleteFile = new File(savePath + deList[i]); 
			deleteFile.delete();
			
			int result1 = rService.deleteAt(deList[i]); 
		}
	
		// 객체+썸네일 부분
		// 썸네일 변경시 기존파일 삭제하고 재업로드
		if(!file.getOriginalFilename().equals("")) {
			if(r.getChangeName() != null) {
				deleteFile(r.getChangeName(), request);
			}
			String changeName = saveFile(file, request);
			r.setOriginName(file.getOriginalFilename());
			r.setChangeName(changeName);
			r.setFilePath(request.getSession().getServletContext().getRealPath("resources") + "\\uploadFiles\\" + changeName);
		}
		int result2 = rService.updateReRoom(r);
		
		int result = 1;
		
		// 새롭게 넣고자하는 상세사진을 insert한다
		// 상세사진 전용 비어있는 리스트를 생성한 뒤 
		ArrayList<Attachment> list = new ArrayList<>();
		
		// filelist로 넘어온 파일들을 하나씩 attachment객체로 생성한다
		for(int i=0; i<filelist.length; i++) {
			
			// 파일은 무조건 1개는 넘어오며, 비어있는 객체는 제외되도록 조건처리
			if(!filelist[i].getOriginalFilename().isEmpty()) { 	
				
				String changeName = saveFile(filelist[i], request);
				
				// attachment객체를 생성해서 담는다(테이블에 한 행이 추가되는 것)
				Attachment at = new Attachment();
				
				at.setExNo(r.getRoNo());
				at.setOriginName(filelist[i].getOriginalFilename());
				at.setChangeName(changeName);
				at.setFilePath(request.getSession().getServletContext().getRealPath("resources") + "\\uploadFiles\\" + changeName);
				
				// 잘 추가되었다면 1이 리턴
				int result3 = rService.updateAt(at);
				result = result2*result3;
			}
		}
		
		
		if(result>0) {
			return "redirect:list.ro?currentPage=1"; 
		}else {
			return "common/errorPage";
		}
		
	}
		
		


// ------------- Power 관리 시작 --------------------------------------------------
	
    @RequestMapping("aPowerList.po")
    public String selectList(Model model)
    {
        
        ArrayList<Room> list = rService.selectPowerList();
        
        model.addAttribute("list", list);
        
        return "admin/a_power";
    }
	
    
    @RequestMapping("powerEnrollForm.po")
    public String powerEnrollForm()
    {
        return "admin/a_powerInsert";
    }
	
    @RequestMapping("powerInsert.po")
    public String insertFaq(Room r, Model model, HttpServletRequest request) {
    	
    	int result = rService.insertPower(r);
    	
        if(result > 0)
        { // 게시글 작성 성공 --> 갱신된 리스트가 보여지는 게시글 리스트 페이지
            return "redirect:aPowerList.po";
        }
        else
        { // 게시글 작성 실패
            model.addAttribute("msg", "게시글 등록 실패!!");
            return "common/errorPage";
        }
    	
    }
    
    @RequestMapping("powerUpdateForm.po")
    public ModelAndView faqUpdateForm(int pno, ModelAndView mv)
    {	
    	
    	Room r = rService.selectPower(pno);
    	
        if(r != null)
        { // 게시글 상세조회 성공
            
            mv.addObject("r", r);
            mv.setViewName("admin/a_powerUpdate");
        }
        else
        { // 게시글 상세조회 실패
            mv.addObject("msg", "게시글 상세조회 실패!");
            mv.setViewName("common/errorPage");
        }
        
        return mv;
    	
    }
    
    @RequestMapping("powerUpdate.po")
    public String faqUpdate(Room r, Model model, HttpServletRequest request) {
    	
        int result = rService.updatePower(r);
        
        if(result > 0)
        {
            return "redirect:aPowerList.po";
        }
        else
        {
            model.addAttribute("msg", "게시글 수정 실패!!");
            return "common/errorPage";
        }
    	
    	
    }
    
    @RequestMapping("powerOkayList.po")
    public String selectPowerRoomList(int currentPage, Model model)
    {
     
        int listCount = rService.aSelectPowerListCount(); 
        PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 5);
    	
        ArrayList<Room> list = rService.selectPowerRoomList(pi);
        
        model.addAttribute("list", list);
        model.addAttribute("pi", pi);
        
        return "admin/a_powerList";
    }
    
    
	// ------------- Power 관리 끝 --------------------------------------------------
    // ------------- 숙소 관리 시작 --------------------------------------------------
	@RequestMapping("aRoomsWaitList.ro")
	public String selectRoomsWaitList(int currentPage, Model model) {
		
		int listCount = rService.selectListRoomsWaitCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 5);
		
		ArrayList<Room> list = rService.selectRoomsWaitList(pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
		return "admin/adminRoomsWaitList";
	}
	
	@RequestMapping("aRoomsOkeyList.ro")
	public String selectRoomsOkayList(int currentPage, Model model) {
		
		int listCount = rService.selectListRoomsOkayCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 5);
		
		ArrayList<Room> list = rService.selectRoomsOkayList(pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
		return "admin/adminRoomsOkeyList";
	}
		
    @RequestMapping("aRoomDetail.ro")
    public ModelAndView selectRoomWaitDetail(int rno, ModelAndView mv)
    {	
    	
    	Room r = rService.selectRoomWaitDetail(rno);
    	ArrayList<Attachment> list = rService.selectAt(rno);
        if(r != null)
        { // 게시글 상세조회 성공
            
            mv.addObject("r", r);
            mv.addObject("list", list);
            mv.setViewName("admin/adminRoomsListDetail");
        }
        else
        { // 게시글 상세조회 실패
            mv.addObject("msg", "게시글 상세조회 실패!");
            mv.setViewName("common/errorPage");
        }
        
        return mv;
    	
    }
    
    
    @RequestMapping("aRoomOkay.ro")
    public String updateOkay(int rno, Model model, HttpServletRequest request) {
    	
        int result = rService.updateOkay(rno);
        
        if(result > 0)
        {
            return "redirect:aRoomsOkeyList.ro?currentPage=1";
        }
        else
        {
            model.addAttribute("msg", "승인 실패!!");
            return "common/errorPage";
        }
    	
    	
    }
    
    @RequestMapping("aRoomReject.ro")
    public String updateReject(Room r, Model model, HttpServletRequest request) {
    	
        int result = rService.updateReject(r);
        
        if(result > 0)
        {
            return "redirect:aRoomsWaitList.ro?currentPage=1";
        }
        else
        {
            model.addAttribute("msg", "거절 실패!!");
            return "common/errorPage";
        }
    	
    	
    }
    
    @RequestMapping("roomOkSearch.ro")
    public String roomSearchList(int currentPage, Room r, Model model) {
    	
        int listCount = rService.roomSearchCount(r); 
        PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 5);
        
        ArrayList<Room> list = rService.roomSearchList(pi, r);
        
        model.addAttribute("list", list);
        model.addAttribute("r", r);
        model.addAttribute("pi", pi);
        
        return "admin/adminRoomsOkeyList";
        
    }
    
	@ResponseBody
    @RequestMapping(value="selectRoomList.ro", produces="application/json; charset=utf-8")
    public String selectRoomList() {
    	ArrayList<Room> powerAllList = rService.selectRoomList();

    	Collections.shuffle(powerAllList);
    	
    	ArrayList<Room> powerList = new ArrayList<>();
    	
    	if(powerAllList.size() >= 4) {
    		for(int i=0 ; i<4 ; i++) {
    			powerList.add(powerAllList.get(i));
    		}
    	} else {
    		for(int i=0 ; i<powerAllList.size() ; i++) {
    			powerList.add(powerAllList.get(i));
    		}
    	}
    	
    	
    	return new Gson().toJson(powerList);
    }
	
	@ResponseBody
    @RequestMapping(value="selectPopList.ro", produces="application/json; charset=utf-8")
    public String selectPopList() {
    	ArrayList<Room> popAllList = rService.selectPopList();
    	
    	//System.out.println(popAllList);
    	
    	Collections.shuffle(popAllList);
    	
    	ArrayList<Room> popList = new ArrayList<>();
    	
    	if(popAllList.size() >= 4) {
    		for(int i=0 ; i<4 ; i++) {
    			popList.add(popAllList.get(i));
    		}
    	} else {
    		for(int i=0 ; i<popAllList.size() ; i++) {
    			popList.add(popAllList.get(i));
    		}
    	}
    	
    	
    	return new Gson().toJson(popList);
    }
	
	
	
    // ------------- 숙소 관리 끝 --------------------------------------------------
	
	// ------------- 사용자 시작 --------------------------------------------------
    // 메인페이지에서 조건 4가지 (위치, 체크인날짜, 체크아웃날짜, 인원) 입력받은 후  숙소검색 페이지로 이동
	@RequestMapping("searchRo.ro")
   	public ModelAndView searchRoom(String tripArea, String tripStartDate, String tripEndDate, int tripPeople, Room room, Board board, ModelAndView mv ) {

		// 넘겨받은 여행조건들 room객체에 set
		room.setAddBasic(tripArea);
		room.setStartDays(tripStartDate);
		room.setEndDays(tripEndDate);
		room.setPeople(tripPeople);
		
		// 검색한 조건에 해당하는 Rooms리스트 조회
    	ArrayList<Room> roomList = rService.searchRoom(room);
   		System.out.println(" roomList 조회 : " + roomList);
    	System.out.println("roomList 의 크기 : " + roomList.size());
    	
    	//roomList(n) 의 후기조회, 후기개수 조회 -> Room vo객체의 reviewCount필드에 세팅 하자
    	ArrayList<Board> reivew = null;
    	
    	for(int i=0; i<roomList.size(); i++) {
    		roomList.get(i).setReviewCount(bService.reviewListCount(roomList.get(i).getRoNo()));
        	System.out.println("roomList "+ i + "번지 리뷰 개수" + roomList.get(i).getReviewCount());
    	}

        if(!roomList.isEmpty()){
        	mv.addObject("tripArea", tripArea);
        	mv.addObject("tripStartDate", tripStartDate);
        	mv.addObject("tripEndDate", tripEndDate);
        	mv.addObject("tripPeople", tripPeople);
        	
        	mv.addObject("roomList", roomList);
        	mv.setViewName("user/searchRooms");
        }
        else{
            mv.addObject("msg", "숙소검색 실패!!");
            mv.setViewName("common/errorPage");
        }
        return mv;
   	}
	
	// 숙소검색페이지에서 조건 4가지 (위치, 체크인날짜, 체크아웃날짜, 인원)와 필터에 해당하는 숙소리스트 반환
	@RequestMapping("searchRoWithFilter.ro")
   	public ModelAndView searchRoWithFilter(String tripArea, String tripStartDate, String tripEndDate, int tripPeople, String filterValue, Room room, Board board, ModelAndView mv ) {

		mv = searchRoom(tripArea, tripStartDate, tripEndDate, tripPeople, room, board, mv);
		String facilityFull = "다리미,주방,식기류,인덕션,옷걸이,세탁기,침구,케이블 TV,드라이기,조리도구(냄비 등),냉장고,전자레인지,에어컨,공용PC,커피포트,아기욕조,아기침대,여분의 침구,온수 및 난방,주차가능";
		String serviceFull = "샴푸,화장지,바디워시,비누,짐보관서비스,수건,Free wifi";
		
		String facility = "";
		String service = "";
		
		String compareFacility = "";
		String compareService = "";
		
		ArrayList<Room> roomList2 = null;
		
		ArrayList<Room> roomListWithFilter = new ArrayList<>();
		
		int count = 0;
		
		if(!filterValue.equals("")) {
			String[] filter = filterValue.split(",");
			for(int i=0; i<filter.length; i++) {
				if(facilityFull.contains(filter[i])) {
					facility += (filter[i] + ",");
				}
				if(serviceFull.contains(filter[i])) {
					service += (filter[i] + ",");
				}
			}
			
			String[] facilityList =  facility.split(",");
			String[] serviceList =  service.split(",");
			//System.out.println("facility split : " + facilityList[0] + ", " + facilityList[1]);
			//System.out.println("service split : " + serviceList[0]);
			roomList2 = (ArrayList)mv.getModel().get("roomList");
			
			
			
			for(Room compareRoom : roomList2) {
				compareFacility = compareRoom.getFacility();
				compareService = compareRoom.getService();
				//System.out.println("compareFacility : " + compareFacility);
				//System.out.println("compareService : " + compareService);
				compareRoom.setFilterStatus("Y");
				// 해당 compareRoom이 필터 조건에 만족하는지 for문 돌릴 것
				for(int i=0; i<facilityList.length; i++) {
					if(!compareFacility.contains(facilityList[i])) {
						compareRoom.setFilterStatus("N");
					}
				}
				for(int i=0; i<serviceList.length; i++) {
					if(!compareService.contains(serviceList[i])) {
						compareRoom.setFilterStatus("N");
					}
				}
				if(!compareRoom.getFilterStatus().equals("N")) {
					//System.out.println("compareRoom : " + compareRoom);
					//System.out.println("roomListWithFilter : " + roomListWithFilter);
					roomListWithFilter.add(compareRoom);

					count++;
				}
			}
			
			// 필터 조건 자국 남겨주기 위해 set
			//System.out.println("filterValue : " + filterValue);
			mv.addObject("filterValue", filterValue);
			// 필터 조건에 해당하는 숙소만 set // ????????? ModelAndView에 키값 똑같은 걸로 입력하면 중복 오류 안 나요?
			mv.addObject("roomList", roomListWithFilter);
			
			// 예약시작일자, 예약끝일자, 인원수 set
			mv.addObject("startDays", tripStartDate);
			mv.addObject("endDays", tripEndDate);
			mv.addObject("tripPeople", tripPeople);
			
		}

		return mv;
   	}
	
	// 숙소리스트 중에서 특정 숙소 클릭시 해당 숙소 상세페이지로 이동
    @RequestMapping("roomDe.ro")
    public ModelAndView roomDetail(int roNo, String tripStartDate, String tripEndDate, int tripPeople, ModelAndView mv, Room room) {
    	//System.out.println("roNo : " + roNo);
    	room  = rService.roomDetail(roNo);
    	ArrayList<Attachment> at = rService.getDetailImages(roNo);
    	
    	// room 객체에 검색 조건 set
    	room.setStartDays(tripStartDate);
    	room.setEndDays(tripEndDate);
    	room.setPeople(tripPeople);
    	
    	// room객체에 숙소태그, 포함사항의 표시형식 보완
    	room.setRoomsTag("#" + room.getRoomsTag().replace(",", " #"));
    	room.setMeal(room.getMeal().replace(",", ", "));
    	
    	// room객체에 숙소시설, 제공서비스 표시형식 보완
    	room.setFacility(room.getFacility().replace(",", ", "));
    	room.setService(room.getService().replace(",", ", "));
    	
    	// room객체에 지역 표시 set
    	//System.out.println("공백의 인덱스 : " + room.getAddBasic().indexOf(" ",(room.getAddBasic().indexOf(" ") + 1)));
    	int addLastIndex = room.getAddBasic().indexOf(" ",(room.getAddBasic().indexOf(" ") + 1));
    	String region = room.getAddBasic().substring(0, addLastIndex);
    	//System.out.println("region : " + region);
    	room.setRegion(region);
    	
    	// room 객체에 파트너정보 set
    	room.setPaPofile(rService.getPartner(room.getUserNo()).getChangeName());
    	room.setPartnerIntro(rService.getPartner(room.getUserNo()).getPartnerIntro());
    	room.setPaName(rService.getPartner(room.getUserNo()).getUserName());
    	room.setPaAccountName(rService.getPartner(room.getUserNo()).getAccountName());
    	room.setPaAccountNum(rService.getPartner(room.getUserNo()).getAccountNum());
    	
    	// room 객체에 리뷰정보 set
    	room.setReviewList(rService.getReview(roNo));
    	//System.out.println("reviewList : " + rService.getReview(roNo));
    	
    	//System.out.println(room);
    	
    	
    	if(room != null) {
    		
    		mv.addObject("at", at);
    		mv.addObject("room", room);
    		mv.setViewName("user/roomDetails");
    	}else {
    		mv.addObject("msg", "숙소상세 조회 실패!!");
            mv.setViewName("common/errorPage");
    	}
    	
    	return mv;
    	
    }
    
    // 메인페이지에서 특정 파워숙소 클릭시 해당 숙소 상세페이지로 이동
    @RequestMapping("powerRoomDe.ro")
    public ModelAndView roomDetail(int roNo, ModelAndView mv, Room room) {
    	//System.out.println("roNo : " + roNo);
    	room  = rService.roomDetail(roNo);
    	ArrayList<Attachment> at = rService.getDetailImages(roNo);
    	
    	// room객체에 숙소태그, 포함사항의 표시형식 보완
    	room.setRoomsTag("#" + room.getRoomsTag().replace(",", " #"));
    	room.setMeal(room.getMeal().replace(",", ", "));
    	
    	// room객체에 숙소시설, 제공서비스 표시형식 보완
    	room.setFacility(room.getFacility().replace(",", ", "));
    	room.setService(room.getService().replace(",", ", "));
    	
    	// room객체에 지역 표시 set
    	//System.out.println("공백의 인덱스 : " + room.getAddBasic().indexOf(" ",(room.getAddBasic().indexOf(" ") + 1)));
    	int addLastIndex = room.getAddBasic().indexOf(" ",(room.getAddBasic().indexOf(" ") + 1));
    	String region = room.getAddBasic().substring(0, addLastIndex);
    	//System.out.println("region : " + region);
    	room.setRegion(region);
    	
    	// room 객체에 파트너정보 set
    	room.setPaPofile(rService.getPartner(room.getUserNo()).getChangeName());
    	room.setPartnerIntro(rService.getPartner(room.getUserNo()).getPartnerIntro());
    	room.setPaName(rService.getPartner(room.getUserNo()).getUserName());
    	room.setPaAccountName(rService.getPartner(room.getUserNo()).getAccountName());
    	room.setPaAccountNum(rService.getPartner(room.getUserNo()).getAccountNum());
    	
    	// room 객체에 리뷰정보 set
    	room.setReviewList(rService.getReview(roNo));
    	//System.out.println("reviewList : " + rService.getReview(roNo));
    	
    	//System.out.println(room);
    	
    	
    	if(room != null) {
    		
    		mv.addObject("at", at);
    		mv.addObject("room", room);
    		mv.setViewName("user/roomDetails");
    	}else {
    		mv.addObject("msg", "숙소상세 조회 실패!!");
            mv.setViewName("common/errorPage");
    	}
    	
    	return mv;
    	
    }
    
 	// ------------- 사용자 끝 --------------------------------------------------
	
	
	// ------------------------------ 파트너 예약관리 시작 ----------------------------------
	
	
	
		//예약관리 첫페이지
	
		@RequestMapping("reservationView.rv")
		public String rvRoomList(Model model) {
			return "partner/partnerReservationView";
		}

		
		@RequestMapping("rvRoomList.rv")
		public String rvRoomList(Model model,  int currentPage, HttpSession session) {
			
			Member loginUser = (Member)session.getAttribute("loginUser");
			int usNo = loginUser.getUsNo();
			
			int listCount = rService.selectRvRoomListCount(usNo);
		    
		    PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5,5);
		    
		    ArrayList<Room> list = rService.selectRvRoomList(pi, usNo);
		    
		    
		    model.addAttribute("pi", pi);
		    model.addAttribute("list", list);
		    
			
		    return "partner/partnerReservationListView";
		}
		
		//예약 진행
		@ResponseBody
		@RequestMapping(value="rvRoomListIng.rv", produces="application/json; charset=utf-8")
		public String rvRoomListIng(int currentPage, HttpSession session) {
			
			Member loginUser = (Member)session.getAttribute("loginUser");
			int usNo = loginUser.getUsNo();
			
			int listCount = rService.selectRvRoomListCount(usNo);
		    
		    PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5,5);
		    
		    ArrayList<Room> list = rService.selectRvRoomList(pi, usNo);
		    
		    
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
		@RequestMapping(value="rvRoomListConfirm.rv", produces="application/json; charset=utf-8")
		public String rvRoomListConfirm(int currentPage, HttpSession session) {
			
			Member loginUser = (Member)session.getAttribute("loginUser");
			int usNo = loginUser.getUsNo();
			
			int listCount = rService.selectRvRoomConfirmListCount(usNo);
		    
		    PageInfo pi = Pagination.getPageInfo(listCount, currentPage,5,5);
		    
		    ArrayList<Room> list = rService.selectRvRoomConfirmList(pi, usNo);


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
		@RequestMapping(value="rvRoomListCancel.rv", produces="application/json; charset=utf-8")
		public String rvRoomListCancel(int currentPage, HttpSession session) {
			
			Member loginUser = (Member)session.getAttribute("loginUser");
			int usNo = loginUser.getUsNo();
			
			int listCount = rService.selectRvRoomCancelListCount(usNo);
		    
		    PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5,5);
		    
		    ArrayList<Room> list = rService.selectRvRoomCancelList(pi, usNo);


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
		
		//디테일
		@RequestMapping("reservationRoomDetailView.rv")
		public String reservationRoomDetailView(int rpNo, Model model) {
			
			Room r = rService.reservationRoomDetailView(rpNo);
			
			model.addAttribute("r", r);
			
			return "partner/partnerReservationRoomDetailView";
			
		}
		
		//예약확정하기
		@RequestMapping("roomConfirm.rv")
		public String roomConfirm(int rpNo, Model model) {
			System.out.println(rpNo);
			int result = rService.roomConfirm(rpNo);
			
			if(result>0) {
				return "redirect:rvRoomList.rv?currentPage=1";
			}else {
				return "common/errorPage";
			}
			
		}
		
		//예약취소하기
		@RequestMapping("roomCancel.rv")
		public String roomCancel(int rpNo, Model model) {
			int result = rService.roomCancel(rpNo);
			
			if(result>0) {
				return "redirect:rvRoomList.rv?currentPage=1";
			}else {
				return "common/errorPage";
			}
			
		}
	// ------------------------------ 파트너 일정관리 시작 ----------------------------------
		
		@RequestMapping("calendarView.ca")
		public String calendarView(Model model, HttpSession session) {
			Member loginUser = (Member)session.getAttribute("loginUser");
			int usNo = loginUser.getUsNo();
			
			ArrayList<Room> list = rService.roomReservation(usNo);
			
			model.addAttribute("list", list);
			return "partner/partnerCalender";
		}
		
		
	// ------------------------------대쉬보드
				
			//예약 진행
			@ResponseBody
			@RequestMapping(value="dashboardRoomList.rv", produces="application/json; charset=utf-8")
			public String dashboardRoomList(int currentPage, HttpSession session) {
				
				Member loginUser = (Member)session.getAttribute("loginUser");
				int usNo = loginUser.getUsNo();
				
				int listCount = rService.selectRvRoomListCount(usNo);
			    
			    PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5,5);
			    
			    ArrayList<Room> list = rService.selectRvRoomList(pi, usNo);
			    
			    
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
			
			//예약 진행
			@ResponseBody
			@RequestMapping(value="dashboardRoomCount.rv", produces="application/json; charset=utf-8")
			public void dashboardRoomCount(int currentPage, HttpSession session, HttpServletResponse response) throws JsonIOException, IOException {      
				
				Member loginUser = (Member)session.getAttribute("loginUser");
				int usNo = loginUser.getUsNo();
				
				int listCount = rService.selectRvRoomListCount(usNo);
			    new Gson().toJson(listCount, response.getWriter());   

			}
			
			

			
			
}
