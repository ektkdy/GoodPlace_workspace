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
	public String updateExp(Experience e, String[] deList, String count , @RequestParam(name="thumb", required=true) MultipartFile file,
			 @RequestParam(name="file", required=false) MultipartFile[] filelist,
			HttpServletRequest request, Model model) {
			
		//System.out.println("count : " + count);
		
		if(!count.equals("0")) {
			//System.out.println(count); 	
			int count1 = Integer.parseInt(count);
			
			// x를 누른 수만큼, x에 해당하는 changeName 을 삭제한다 (서버+디비)
			for(int i= 0 ; i<count1 ; i++) {
				//System.out.println(deList[i]);
				String savePath = request.getSession().getServletContext().getRealPath("resources") +"\\uploadFiles\\";
			
				File deleteFile = new File(savePath + deList[i]); 
				deleteFile.delete();
				
				int result1 = expService.deleteAt(deList[i]); 
			}
		}
		
		// 객체+썸네일 부분
		// 썸네일 변경시 기존파일 삭제하고 재업로드
		if(!file.getOriginalFilename().equals("")) {
			if(e.getChangeName() != null) {
				deleteFile(e.getChangeName(), request);
			}
			String changeName = saveFile(file, request);
			e.setOriginName(file.getOriginalFilename());
			e.setChangeName(changeName);
			e.setFilePath(request.getSession().getServletContext().getRealPath("resources") + "\\uploadFiles\\" + changeName);
		}
		int result2 = expService.updateExp(e);
		
		
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
				
				at.setExNo(e.getExNo());
				at.setOriginName(filelist[i].getOriginalFilename());
				at.setChangeName(changeName);
				at.setFilePath(request.getSession().getServletContext().getRealPath("resources") + "\\uploadFiles\\" + changeName);
				
				// 잘 추가되었다면 1이 리턴
				int result3 = expService.updateAt(at);
				result = result2*result3;
			}
		}
		
		if(result>0) {
			model.addAttribute("msg", "체험정보가 수정되었습니다.");
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
	public String updateReExp(Experience e, String[] deList, String count , @RequestParam(name="thumb", required=true) MultipartFile file,
			 @RequestParam(name="file", required=false) MultipartFile[] filelist,
			HttpServletRequest request, Model model) {
		
		//System.out.println(count); 	
			int count1 = Integer.parseInt(count);
		
		// x를 누른 수만큼, x에 해당하는 changeName 을 삭제한다 (서버+디비)
		for(int i= 0 ; i<count1 ; i++) {
			//System.out.println(deList[i]);
			String savePath = request.getSession().getServletContext().getRealPath("resources") +"\\uploadFiles\\";
		
			File deleteFile = new File(savePath + deList[i]); 
			deleteFile.delete();
			
			int result1 = expService.deleteAt(deList[i]); 
		}
		
		// 객체+썸네일 부분
		// 썸네일 변경시 기존파일 삭제하고 재업로드
		if(!file.getOriginalFilename().equals("")) {
			if(e.getChangeName() != null) {
				deleteFile(e.getChangeName(), request);
			}
			String changeName = saveFile(file, request);
			e.setOriginName(file.getOriginalFilename());
			e.setChangeName(changeName);
			e.setFilePath(request.getSession().getServletContext().getRealPath("resources") + "\\uploadFiles\\" + changeName);
		}
		int result2 = expService.updateReExp(e);
		
		
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
				
				at.setExNo(e.getExNo());
				at.setOriginName(filelist[i].getOriginalFilename());
				at.setChangeName(changeName);
				at.setFilePath(request.getSession().getServletContext().getRealPath("resources") + "\\uploadFiles\\" + changeName);
				
				// 잘 추가되었다면 1이 리턴
				int result3 = expService.updateAt(at);
				result = result2*result3;
			}
		}
		
		if(result>0) {
			model.addAttribute("msg", "재심사신청이 완료되었습니다.");
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
	
    @RequestMapping("aExpDetail.ex")
    public ModelAndView selectExpmWaitDetail(int eno, ModelAndView mv)
    {	
    	
    	Experience e = expService.selectExpmWaitDetail(eno);
    	ArrayList<Experience> list = expService.selectExp(eno);
        if(e != null)
        { // 게시글 상세조회 성공
            
            mv.addObject("e", e);
            mv.addObject("list", list);
            mv.setViewName("admin/adminExpListDetail");
        }
        else
        { // 게시글 상세조회 실패
            mv.addObject("msg", "게시글 상세조회 실패!");
            mv.setViewName("common/errorPage");
        }
        
        return mv;
    	
    }
	
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

			    // 맵을 JSON Object 문자열로 바꿈
			    String jsonString = gson.toJson(map);

						
			    return jsonString;
			}
			
			
			//디테일
			@RequestMapping("reservationExpDetailView.rv")
			public String reservationExpDetailView(int epNo, Model model) {
				
				Experience e = expService.reservationExpDetailView(epNo);
				
				model.addAttribute("e", e);
				
				return "partner/partnerReservationExpDetailView";
				
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
    
	// 메인페이지에서 조건 3가지 (태그, 체험날짜, 검색키워드) 입력받은 후  체험메인 페이지로 이동
	@RequestMapping("showExpList.exp")
	public ModelAndView showExpList(String expCategoryString, String expDateString, String expTitle, ModelAndView mv) {
		System.out.println("expCategoryString : " + expCategoryString + ", " + "expDateString : " + expDateString + ", " + "expTitle : " + expTitle);
		System.out.println("지점1");
		 
		// 카테고리별 체험 등록 개수 set
		Experience exp = new Experience();
		exp.setExpCountPerCategory(expService.selectExpCountUser());
		
		// 카테고리명 set
		ArrayList<String> expCategoryList = new ArrayList<>();
		expCategoryList.add("라이프 및 스타일");
		expCategoryList.add("문화와 역사");
		expCategoryList.add("미술과 디자인");
		expCategoryList.add("스포츠&피트니스");
		expCategoryList.add("야외활동");
		exp.setExpCategoryList(expCategoryList);
		
		// expCategory 필드 설정
		int expCategory = 0;
		if(expCategoryString.equals("라이프 및 스타일")) {
			expCategory = 1;
		}else if(expCategoryString.equals("문화와 역사")){
			expCategory = 2;
		}else if(expCategoryString.equals("미술과 디자인")){
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
		
		// 조회된 expCategory에 해당하는 카테고리명 set
		for(int i=0; i<expList.size(); i++) {
			switch(expList.get(i).getExpCategory()) {
			case 1: expList.get(i).setExpCategoryString("라이프 및 스타일"); break;
			case 2: expList.get(i).setExpCategoryString("문화와 역사"); break;
			case 3: expList.get(i).setExpCategoryString("미술과 디자인"); break;
			case 4: expList.get(i).setExpCategoryString("스포츠&피트니스"); break;
			case 5: expList.get(i).setExpCategoryString("야외활동"); break;
			}
			
	    	// expList객체 체험태그의 표시형식 보완
			expList.get(i).setExpTag("#" + (expList.get(i).getExpTag().replace(",", " #")));
			expList.get(i).setExpDateString(expDateString);
		}
		

		
		if(expList != null) {
			mv.addObject("exp", exp);
			mv.addObject("expList", expList);
			mv.setViewName("user/exp");
		}else {
			mv.addObject("msg", "체험리스트 조회 실패!!");
			mv.setViewName("common/errorPage");
		}	
		
		System.out.println(" expCountPerCategory : " + exp.getExpCountPerCategory().get(0));
		System.out.println(" expList : " + expList);
		
		return mv;
	}
	
	// 체험 상세페이지로 이동
	@RequestMapping("showExp.exp")
	public ModelAndView showExp(int exNo, String expDateString, ModelAndView mv) {
		System.out.println("지점 2: exNo : " + exNo);
		
		Experience exp = expService.selectExpUser(exNo);
		
		
		
		// expList객체 체험태그의 표시형식 보완
		exp.setExpTag("#" + (exp.getExpTag().replace(",", " #")));
		
		System.out.println(exp);
		
		// 수업교시 계산 후 set
		int startTimeFirstLetterFlag = 0; // 운영시작시간의 첫글자 에 따라 값이 변하는 상태 변수 -> 경우1_첫 글자가 "0" : 0 / 경우2_첫 글자가 "1" 혹은 "2" : 1 
		
		if(!exp.getStartTime().substring(0, 1).equals("0")) { // 경우2
			startTimeFirstLetterFlag = 1;
		}else {													// 경우1 
			startTimeFirstLetterFlag = 0;
		}
		
		int startHour = 0;
		if(startTimeFirstLetterFlag == 0) {
			startHour = Integer.parseInt(exp.getStartTime().substring(1, 2)); 
		}else {
			startHour = Integer.parseInt(exp.getStartTime().substring(0, 2)); 
		}
		
		int startMinute = Integer.parseInt(exp.getStartTime().substring(3, 4));
		int intervalMinute = Integer.parseInt(exp.getIntervalTime());
		int useTime = Integer.parseInt(exp.getUseTime());
		
		double startMinuteDouble = 0.0;
		double intervalMinuteDouble = 0.0;
		
		// 조건들이 파트너딴과 안 맞으면 에러 난다!!!!!!!
		switch(startMinute) {
		case 3: startMinuteDouble = 0.5; break;
		}
		
		switch(intervalMinute) {
		case 30: intervalMinuteDouble = 0.5; break;
		case 60: intervalMinuteDouble = 1.0; break;
		case 120: intervalMinuteDouble = 2.0; break;
		case 180: intervalMinuteDouble = 3.0; break;
		default: break;
		}
		
		double startTimeCal = startHour + startMinuteDouble;
		double nextClass = startTimeCal + useTime + intervalMinuteDouble;
		
		ArrayList<String> expClass = new ArrayList<>();
		for(int i=0; i<exp.getExpClassCount(); i++) {

			if(i == 0) {
				if(startTimeFirstLetterFlag == 0) {
					if((startTimeCal + useTime) < 10.0) {
						if(String.valueOf(startTimeCal).substring(2).equals("0")) {
							expClass.add(("0" + ((String.valueOf(startTimeCal)).substring(0, 1)) + ":00 ~ ") + ("0" + (String.valueOf(startTimeCal + useTime)).substring(0,1) + ":00"));
						}else if(String.valueOf(startTimeCal).substring(2).equals("5")) {
							expClass.add(("0" + ((String.valueOf(startTimeCal)).substring(0, 1)) + ":30 ~ ") + ("0" + (String.valueOf(startTimeCal + useTime)).substring(0,1) + ":30"));
						}
					}else {
						if(String.valueOf(startTimeCal).substring(2).equals("0")) {
							expClass.add(("0" + ((String.valueOf(startTimeCal)).substring(0, 1)) + ":00 ~ ") + ((String.valueOf(startTimeCal + useTime)).substring(0,2) + ":00"));
						}else if(String.valueOf(startTimeCal).substring(2).equals("5")) {
							expClass.add(("0" + ((String.valueOf(startTimeCal)).substring(0, 1)) + ":30 ~ ") + ((String.valueOf(startTimeCal + useTime)).substring(0,2) + ":30"));
						}
					}
				}else {
					if(String.valueOf(startTimeCal).substring(3).equals("0")) {
						expClass.add(((String.valueOf(startTimeCal)).substring(0, 2) + ":00 ~ ") + ((String.valueOf(startTimeCal + 1.0)).substring(0,2) + ":00"));
					}else if(String.valueOf(startTimeCal).substring(3).equals("5")) {
						expClass.add(((String.valueOf(startTimeCal)).substring(0, 2) + ":30 ~ ") + ((String.valueOf(startTimeCal + 1.0)).substring(0,2) + ":30"));
					}
				}
				System.out.println(i + "번지까지 왔음, expClass[" + i + "] : " +  expClass.get(i));
			}else if(i >= 1) {
				switch(intervalMinute) {
				case 30: if(Double.parseDouble(expClass.get(i-1).substring(11)) == 30.0){ startTimeCal = (0.5 + 0.5) + Double.parseDouble(expClass.get(i-1).substring(8, 10)); }else { startTimeCal = 0.5 + Double.parseDouble(expClass.get(i-1).substring(8, 10)); } break;
				case 60: if(Double.parseDouble(expClass.get(i-1).substring(11)) == 30.0){ startTimeCal = (0.5 + 1.0) + Double.parseDouble(expClass.get(i-1).substring(8, 10)); }else { startTimeCal = 1.0 + Double.parseDouble(expClass.get(i-1).substring(8, 10)); } break;
				case 120: if(Double.parseDouble(expClass.get(i-1).substring(11)) == 30.0){ startTimeCal = (0.5 + 2.0) + Double.parseDouble(expClass.get(i-1).substring(8, 10)); }else { startTimeCal = 2.0 + Double.parseDouble(expClass.get(i-1).substring(8, 10)); } break;
				case 180: if(Double.parseDouble(expClass.get(i-1).substring(11)) == 30.0){ startTimeCal = (0.5 + 3.0) + Double.parseDouble(expClass.get(i-1).substring(8, 10)); }else { startTimeCal = 3.0 + Double.parseDouble(expClass.get(i-1).substring(8, 10)); } break;
				default: break;
				}
				if(String.valueOf(startTimeCal).substring(3).equals("0")) {
					expClass.add(((String.valueOf(startTimeCal)).substring(0, 2) + ":00 ~ ") + ((String.valueOf(startTimeCal + useTime)).substring(0,2) + ":00"));
				}else if(String.valueOf(startTimeCal).substring(3).equals("5")) {
					expClass.add(((String.valueOf(startTimeCal)).substring(0, 2) + ":30 ~ ") + ((String.valueOf(startTimeCal + useTime)).substring(0,2) + ":30"));
				}
			}
		}

		exp.setExpClass(expClass);
		
		System.out.println("startHour : " + startHour + ", startMinute : " + startMinute + ", intervalMinute : " + intervalMinute +", useTime : " + useTime);
		System.out.println("startMinuteDouble : " + startMinuteDouble + ", intervalMinuteDouble : " + intervalMinuteDouble);
		System.out.println("startTimeCal : " + startTimeCal + ", nextClass : " + nextClass);
		System.out.println("스트링으로 변환 -> " + "startTimeCal : " + String.valueOf(startTimeCal) + ", nextClass : " + String.valueOf(nextClass));
		System.out.println("expClass : " + expClass);
	
		// 접수된 인원 계산후 set
		ArrayList<Integer> acceptedPeopleList = new ArrayList<>();
		
		for(int i=0; i<exp.getExpClassCount(); i++) {
			int peopleTotalPerClass = 0;
			ArrayList<Experience> exppayListPerClassNo = expService.getAcceptedPeople(exp.getExNo(), (i+1));
			for(int y=0; y<exppayListPerClassNo.size(); y++) {
				peopleTotalPerClass += exppayListPerClassNo.get(y).getPeople();
			}
			acceptedPeopleList.add(peopleTotalPerClass);
		}
		
		exp.setAcceptedPeople(acceptedPeopleList);
		
		System.out.println("acceptedPeople : " + acceptedPeopleList);
		
    	// exp 객체에 파트너정보 set
    	exp.setPaPofile(expService.getPartner(exp.getUsNo()).getChangeName());
    	exp.setPartnerIntro(expService.getPartner(exp.getUsNo()).getPartnerIntro());
    	exp.setPaName(expService.getPartner(exp.getUsNo()).getUserName());
    	exp.setPaAccountName(expService.getPartner(exp.getUsNo()).getAccountName());
    	exp.setPaAccountNum(expService.getPartner(exp.getUsNo()).getAccountNum());

		// 체험 상세 이미지 get
		ArrayList<Attachment> at = expService.getDetailImages(exp.getExNo());
		
    	// 체험 상세 이미지 set
    	if(at != null) {
    		//System.out.println("숙소의 상세이미지들 조회 됨~!");
    		exp.setDetailImg1(at.get(0).getChangeName());
    		exp.setDetailImg2(at.get(1).getChangeName());
    		exp.setDetailImg3(at.get(2).getChangeName());
    		exp.setDetailImg4(at.get(3).getChangeName());
    		exp.setDetailImg5(at.get(4).getChangeName());
    	}
    	
    	// 메뉴바에서 조건 검색한 날자 set
    	exp.setExpDateString(expDateString);
    	
    	System.out.println("expDetails.jsp 로 보내기전 : " + exp);
		if(exp != null) {
			mv.addObject("exp", exp);
			mv.setViewName("user/expDetails");
		}else {
			mv.addObject("msg", "체험상세 페이지 조회 실패!!");
			mv.setViewName("common/errorPage");
		}
		
		return mv;
		
	}
	
	// 체험 결제페이지로 이동
	@RequestMapping("payExp.exp")
	public String payExp(int exNo, int usNo, int amount, String expDateString, int people, int expClassNo) {
		
		System.out.println("exNo : " + exNo + ", usNo : " + usNo + ", amount : " + amount + ", expDateString : " + expDateString + ", people : " + people + ", expClassNo : " + expClassNo);		
		
		return "";
	}
	//------- 체험조회 끝 ---------------------------------------------------
	
			
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
