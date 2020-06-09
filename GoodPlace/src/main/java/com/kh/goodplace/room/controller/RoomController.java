package com.kh.goodplace.room.controller;

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

import com.kh.goodplace.board.model.service.BoardService;
import com.kh.goodplace.board.model.vo.Board;
import com.kh.goodplace.common.model.vo.Attachment;
import com.kh.goodplace.common.model.vo.PageInfo;
import com.kh.goodplace.common.template.Pagination;
import com.kh.goodplace.member.model.vo.Member;
import com.kh.goodplace.room.model.service.RoomService;
import com.kh.goodplace.room.model.vo.Room;

@Controller
public class RoomController {
	
	@Autowired // DI
	private RoomService rService;
	
    @Autowired // DI
    private BoardService bService;
	
	 @RequestMapping("list.ro")
	 public String selectRoomsList(int currentPage, Model model, 
	       HttpSession session) {
	   
	    Member m = (Member)session.getAttribute("loginUser");
	    
	    int userNo = m.getUsNo();
	    
	    int listCount = rService.selectListCount(userNo);
	    
	    PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
	    
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
	
		@RequestMapping("roomDetailView.ro")
		public String roomDetailView(int rno, Model model ) {
			
			 Room r = rService.selectRoom(rno);
			
			model.addAttribute("r", r);
			
			return "partner/partnerRoomDetailView";
		}
		
		@RequestMapping("updateRoomForm.ro")
		public String updateRoomForm(int roNo, Model model) {
			
			Room r = rService.selectRoom(roNo);
			
			model.addAttribute("r", r);
			
			return "partner/partnerRoomUpdateForm";
		}
		
		@RequestMapping("updateRoom.ro")
		public String updateRoom() {
			
			return "";
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
		
// ------------------------------ 파트너 예약관리 시작 ----------------------------------
		
		@RequestMapping("reservationList.rv")
		public String reservationList(int currentPage, Model model, 
	       HttpSession session) {
	   
	    Member m = (Member)session.getAttribute("loginUser");
	    
	    int userNo = m.getUsNo();
	    
	    int listCount = rService.selectReservationListCount(userNo);
	    
	    PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
	    
	    ArrayList<Room> list = rService.selectRoomsList(pi, userNo);
	    
	    model.addAttribute("pi", pi);
	    model.addAttribute("list", list);
	    
	    return "partner/partnerReservationListView";
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
        PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
    	
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
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		
		ArrayList<Room> list = rService.selectRoomsWaitList(pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
		return "admin/adminRoomsWaitList";
	}
	
	@RequestMapping("aRoomsOkeyList.ro")
	public String selectRoomsOkayList(int currentPage, Model model) {
		
		int listCount = rService.selectListRoomsOkayCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		
		ArrayList<Room> list = rService.selectRoomsOkayList(pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
		return "admin/adminRoomsOkeyList";
	}
		
    @RequestMapping("aRoomDetail.ro")
    public ModelAndView selectRoomWaitDetail(int rno, ModelAndView mv)
    {	
    	
    	Room r = rService.selectRoomWaitDetail(rno);
    	
        if(r != null)
        { // 게시글 상세조회 성공
            
            mv.addObject("r", r);
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
	
    // ------------- 숙소 관리 끝 --------------------------------------------------
	
	// ------------- 사용자 시작 --------------------------------------------------
    // 메인페이지에서 조건 4가지 (위치, 체크인날짜, 체크아웃날짜, 인원) 입력받은 후  숙소검색 페이지로 이동
	@RequestMapping("searchRo.ro")
   	public ModelAndView searchRoom(String tripArea, String tripStartDate, String tripEndDate, String tripPeople, String filterValue, Room room, Board board, ModelAndView mv ) {
//		System.out.println("tripArea : " + tripArea);
//		System.out.println("tripStartDate : " + tripStartDate);
//		System.out.println("tripEndDate : " + tripEndDate);
//		System.out.println("tripPeople : " + tripPeople);
//		System.out.println("filterValue : " + filterValue);

		// 넘겨받은 여행조건들 room객체에 set
		room.setAddBasic(tripArea);
		room.setStartDays(tripStartDate);
		room.setEndDays(tripEndDate);
		room.setPeople(Integer.parseInt((tripPeople)));
		
		// 검색한 조건에 해당하는 Rooms리스트 조회
    	ArrayList<Room> roomList = rService.searchRoom(room);
   		System.out.println(" roomList 조회 : " + roomList);
    	System.out.println("roomList 의 크기 : " + roomList.size());
    	
    	// roomList(n) 의 후기조회, 후기개수 조회 -> Room vo객체의 reviewCount필드에 set
    	ArrayList<Board> reivew = null;
    	
    	for(int i=0; i<roomList.size(); i++) {
    		roomList.get(i).setReviewCount(bService.reviewListCount(roomList.get(i).getRoNo()));
    		//roomList.get(i).getFacility().contains(s)
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
        System.out.println("ㅇㅇㅇㅇ");
        return mv;
   	}
	
	
	@SuppressWarnings("null")
	@RequestMapping("searchRoWithFilter.ro")
   	public ModelAndView searchRoWithFilter(String tripArea, String tripStartDate, String tripEndDate, String tripPeople, String filterValue, Room room, Board board, ModelAndView mv ) {

		mv = searchRoom(tripArea, tripStartDate, tripEndDate, tripPeople, filterValue, room, board, mv);
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
			System.out.println("facility split : " + facilityList[0] + ", " + facilityList[1]);
			System.out.println("service split : " + serviceList[0]);
			roomList2 = (ArrayList)mv.getModel().get("roomList");
			
			
			
			for(Room compareRoom : roomList2) {
				compareFacility = compareRoom.getFacility();
				compareService = compareRoom.getService();
				System.out.println("compareFacility : " + compareFacility);
				System.out.println("compareService : " + compareService);
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
					System.out.println("compareRoom : " + compareRoom);
					System.out.println("roomListWithFilter : " + roomListWithFilter);
					roomListWithFilter.add(compareRoom);

					count++;
				}
			}
			
			// 필터 조건에 해당하는 숙소만 set // ????????? ModelAndView에 키값 똑같은 걸로 입력하면 중복 오류 안 나요?
			mv.addObject("roomList", roomListWithFilter);
		}

		return mv;
   	}
	
    
	// ------------- 사용자 끝 --------------------------------------------------
    

}
