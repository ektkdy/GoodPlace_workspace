package com.kh.goodplace.board.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonObject;
import com.kh.goodplace.board.model.service.BoardService;
import com.kh.goodplace.board.model.vo.Board;
import com.kh.goodplace.common.model.vo.PageInfo;
import com.kh.goodplace.common.model.vo.WishList;
import com.kh.goodplace.common.template.Pagination;
import com.kh.goodplace.experience.model.service.ExperienceService;
import com.kh.goodplace.experience.model.vo.ExpPay;
import com.kh.goodplace.member.model.vo.Member;
import com.kh.goodplace.room.model.service.RoomService;
import com.kh.goodplace.room.model.vo.RoomPay;

@Controller
public class BoardController {

    @Autowired
    private BoardService bService;
    
	@Autowired // DI
	private RoomService rService;
	
	@Autowired // DI
	private ExperienceService expService;
    
    // 관리자 FAQ 시작
    @RequestMapping("aFaqList.bo")
    public String aSelectFaqList(int currentPage, Model model) {
    	
        int listCount = bService.aSelectFaqListCount(); 
        PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 5);
        
        ArrayList<Board> list = bService.aSelectFaqList(pi);
        
        model.addAttribute("list", list);
        model.addAttribute("pi", pi);
        
        return "admin/a_faqList";
    }
    // 마이페이지 1대1 작성하기 이동
    @RequestMapping("inqueryEnroll.bo")
    public String inqueryEnroll(HttpSession session, Model model) {
    	Member m = (Member)session.getAttribute("loginUser");
    	
    	ArrayList<RoomPay> myRoomPay = rService.selectRoomPayList(m);
    	ArrayList<ExpPay> myExpPay = expService.selectExpPayList(m);
    	
    	
    	model.addAttribute("myExpPay", myExpPay);
    	model.addAttribute("myRoomPay", myRoomPay);
    	
    	return "user/myInqueryEnroll";
    }
    
    // 마이페이지 1대1 등록
    @RequestMapping("enrollInquery.bo")
    public String enrollInquery(Board b, HttpSession session) {
    	
    	int result = bService.insertInq(b);
    	
    	session.setAttribute("msg", "성공적으로  문의가 등록되었습니다. 답변까지는 1~2일 정도가 소요됩니다.");
    	return "redirect:inQuiry.bo";
    }
    
    // 마이페이지 위시리스트 이동
    @RequestMapping("wishList.bo") 
    	public String selectwishList(HttpSession session, Model model) {
    		Member m = (Member)session.getAttribute("loginUser");
    		ArrayList<WishList> wList = bService.selectwishList(m);
    		
    		System.out.println(wList);
    		
    		model.addAttribute("wList",wList);
    		return"user/wishList";
    	}
    // 마이페이지 1대1문의 이동
    @RequestMapping("inQuiry.bo")
    public String inQuiry(HttpSession session, Model model) {
    	Member m = (Member)session.getAttribute("loginUser");
    	
    	ArrayList<Board> qList = bService.selectInquiryList(m);
    	
    	model.addAttribute("qList", qList);
    	return "user/mpInquery";
    }
    // 마이페이지 1대1문의 상세페이지 이동
    @RequestMapping("inQuiryDt.bo")
    public String inQuiryDt(int inNo,HttpSession session, Model model) {
    	
    	Board b = bService.selectInquiryDt(inNo);
    	
    	model.addAttribute("b", b);
    	return "user/myInqueryEnrollDetail";
    }
    
    
    // 사용자 페이지 이벤트리스트 이동
    @RequestMapping("eventForm.bo")
    public String eventForm() {
    	return "user/board/eventList";
    }
    
    @RequestMapping("faqEnrollForm.bo")
    public String faqEnrollForm() {
    	
    	return "admin/a_faqInsert";
    	
    }
    
    @RequestMapping("faqInsert.bo")
    public String insertFaq(Board b, Model model, HttpServletRequest request) {
    	
    	int result = bService.insertFaq(b);
    	
        if(result > 0)
        { // 게시글 작성 성공 --> 갱신된 리스트가 보여지는 게시글 리스트 페이지
            return "redirect:aFaqList.bo?currentPage=1";
        }
        else
        { // 게시글 작성 실패
            model.addAttribute("msg", "게시글 등록 실패!!");
            return "common/errorPage";
        }
    	
    }
    
    
    @RequestMapping("aFaqDetail.bo")
    public ModelAndView selectFaq(int fno, ModelAndView mv)
    {
        
		/* int result = bService.selectFaq(fno, b); */
    	
    	Board b = bService.selectFaq(fno);
    	
    	
    	
        if(b != null)
        { // 게시글 상세조회 성공
            
            mv.addObject("b", b);
            mv.setViewName("admin/a_faqDetail");
        }
        else
        { // 게시글 상세조회 실패
            mv.addObject("msg", "게시글 상세조회 실패!");
            mv.setViewName("common/errorPage");
        }
        
        return mv;
    }
    

    
    
    @RequestMapping("faqUpdate.bo")
    public String faqUpdate(Board b, Model model, HttpServletRequest request) {
    	
        int result = bService.faqUpdate(b);
        
        if(result > 0)
        {
            return "redirect:aFaqDetail.bo?fno=" + b.getFaqNo();
        }
        else
        {
            model.addAttribute("msg", "게시글 수정 실패!!");
            return "common/errorPage";
        }
    	
    	
    }
    
    @RequestMapping("faqUpdateForm.bo")
    public String faqUpdateForm(int fno, Model model)
    {
        model.addAttribute("b", bService.selectFaq(fno));
        return "admin/a_faqUpdate";
    }
    

    @RequestMapping("faqDelete.bo")
    public String faqDelete(@RequestParam("checkfaqNo") List<Integer> ids) {
		
    	
    	
    	for(Integer fno : ids) bService.faqDelete(fno);
    	
    	return "redirect:aFaqList.bo?currentPage=1";

    	//int result = bService.faqDelete(checkfaqNo);
    	
       // if(result > 0)
        //{   // 게시글 삭제 성공
            
            //return "redirect:aFaqList.bo?currentPage=1";
            
        //}
       // else
        //{   // 게시글 삭제 실패
            
          //  model.addAttribute("msg", "게시글 삭제 실패!!");
          //  return "common/errorPage";
       // }
    	
    }
    
    @RequestMapping("faqSearch.bo")
    public String faqSearchList(int currentPage, Board b, Model model) {
    	
        int listCount = bService.faqSearchCount(b); 
        PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 5);
        
        ArrayList<Board> list = bService.faqSearchList(pi, b);
        
        model.addAttribute("list", list);
        model.addAttribute("b", b);
        model.addAttribute("pi", pi);
        
        return "admin/a_faqList";
        
    }
    // 관리자 FAQ 끝

    // 관리자 공지사항 시작
    
    @RequestMapping("aNoticeList.bo")
    public String aSelectNoticeList(int currentPage, Model model) {
    	
        int listCount = bService.aSelectNoticeListCount(); 
        PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 5);
        
        ArrayList<Board> list = bService.aSelectNoticeList(pi);
        
        model.addAttribute("list", list);
        model.addAttribute("pi", pi);
        
        return "admin/a_noticeList";
        
    }
    
    @RequestMapping("noticeEnrollForm.bo")
    public String enrollForm() {
        return "admin/a_noticeInsert";
    }
    
    @RequestMapping("noticeInsert.bo")
    public String insertBoard(Board b, HttpServletRequest request, Model model)
    {
        
        int result = bService.insertNotice(b);
        
        if(result > 0)
        { // 게시글 작성 성공 --> 갱신된 리스트가 보여지는 게시글 리스트 페이지
            return "redirect:aNoticeList.bo?currentPage=1";
        }
        else
        { // 게시글 작성 실패
            model.addAttribute("msg", "게시글 등록 실패!!");
            return "common/errorPage";
        }
    }
    
    @RequestMapping("aNoticeDetail.bo")
    public ModelAndView selectNotice(int nno, ModelAndView mv)
    {
    	
        int result = bService.noticeIncreaseCount(nno);
        
        if(result > 0)
        { // 게시글 상세조회 성공
            
            Board b = bService.selectNotice(nno);
            mv.addObject("b", b);
            mv.setViewName("admin/a_noticeDetail");
        }
        else
        { // 게시글 상세조회 실패
            mv.addObject("msg", "게시글 상세조회 실패!");
            mv.setViewName("common/errorPage");
        }
        
        return mv;
    }
    
    
    @RequestMapping("noticeUpdateForm.bo")
    public String noticeUpdateForm(int nno, Model model)
    {
        model.addAttribute("b", bService.selectNotice(nno));
        return "admin/a_noticeUpdate";
    }
    
    
    @RequestMapping("noticeUpdate.bo")
    public String noticeUpdate(Board b, Model model, HttpServletRequest request) {
    	
        int result = bService.noticeUpdate(b);
        
        if(result > 0)
        {
            return "redirect:aNoticeDetail.bo?nno=" + b.getNoNo();
        }
        else
        {
            model.addAttribute("msg", "게시글 수정 실패!!");
            return "common/errorPage";
        }
    	
    	
    }
    
    @RequestMapping("noticeSearch.bo")
    public String noticeSearchList(int currentPage, Board b, Model model) {
    	
        int listCount = bService.noticeSearchCount(b); 
        PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 5);
        
        ArrayList<Board> list = bService.noticeSearchList(pi, b);
        
        model.addAttribute("list", list);
        model.addAttribute("b", b);
        model.addAttribute("pi", pi);
        
        return "admin/a_noticeList";
        
    }
    
    @RequestMapping("noticeDelete.bo")
    public String noticeDelete(@RequestParam("checkNo") List<Integer> ids) {
		
    	
    	
    	for(Integer nno : ids) bService.noticeDelete(nno);
    	
    	return "redirect:aNoticeList.bo?currentPage=1";

   	
    }
    
    // 관리자 공지사항 끝
    
    // 관리자 1:1문의 시작
    
    @RequestMapping("aInquiryList.bo")
    public String aSelectInquiryList(int currentPage, Model model) {
    	
        int listCount = bService.aSelectInquiryListCount(); 
        PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 5);
        
        ArrayList<Board> list = bService.aSelectInquiryList(pi);
        
        model.addAttribute("list", list);
        model.addAttribute("pi", pi);
        
        return "admin/a_inquiry";
    }
    
    
    
    @RequestMapping("inquiryAnswerForm.bo")
    public String inquiryEnrollForm(int ino, Model model) {
    	
        model.addAttribute("b", bService.selectInquiry(ino));
    	return "admin/a_inquiryAnswer";
    	
    }
    
    
    @RequestMapping("inquiryUpdate.bo")
    public String insertInquiry(Board b, Model model, HttpServletRequest request) {
    	
    	int result = bService.insertInquiry(b);
    	
        if(result > 0)
        { // 게시글 작성 성공 --> 갱신된 리스트가 보여지는 게시글 리스트 페이지
            return "redirect:aInquiryList.bo?currentPage=1";
        }
        else
        { // 게시글 작성 실패
            model.addAttribute("msg", "게시글 등록 실패!!");
            return "common/errorPage";
        }
    	
    }
    
    
    
    @RequestMapping("aInquiryDetail.bo")
    public ModelAndView selectInquiry(int ino, ModelAndView mv)
    {
    	
    	Board b = bService.selectInquiry(ino);
    	
        if(b != null)
        { // 게시글 상세조회 성공
            
            mv.addObject("b", b);
            mv.setViewName("admin/a_inquiryDetail");
        }
        else
        { // 게시글 상세조회 실패
            mv.addObject("msg", "게시글 상세조회 실패!");
            mv.setViewName("common/errorPage");
        }
        
        return mv;
    }
    

    
    
    @RequestMapping("inquiryAnswerupdate.bo")
    public String inquiryUpdate(Board b, Model model, HttpServletRequest request) {
    	
        int result = bService.inquiryUpdate(b);
        
        if(result > 0)
        {
            return "redirect:aInquiryDetail.bo?ino=" + b.getInNo();
        }
        else
        {
            model.addAttribute("msg", "게시글 수정 실패!!");
            return "common/errorPage";
        }
    	
    	
    }
    
    @RequestMapping("inquiryAnswerUpdateForm.bo")
    public String inquiryUpdateForm(int ino, Model model)
    {
        model.addAttribute("b", bService.selectInquiry(ino));
        return "admin/a_inquiryAnswerUpdate";
    }
    
    @RequestMapping("inquirySearch.bo")
    public String inquirySearchList(int currentPage, Board b, Model model) {
    	
        int listCount = bService.inquirySearchCount(b); 
        PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 5);
        
        ArrayList<Board> list = bService.inquirySearchList(pi, b);
        model.addAttribute("list", list);
        model.addAttribute("b", b);
        model.addAttribute("pi", pi);
        
        return "admin/a_inquiry";
        
    }
    
    // 관리자 1:1문의 끝
    
    // 관리자 신고관리 시작
    @RequestMapping("aReportList.bo")
    public String aSelectReportList(int currentPage, Model model) {
    	
        int listCount = bService.aSelectReportListCount(); 
        PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 5);
        
        ArrayList<Board> list = bService.aSelectReportList(pi);
        model.addAttribute("list", list);
        model.addAttribute("pi", pi);
        
        return "admin/a_report";
    }
    
    @RequestMapping("aReportDetail.bo")
    public ModelAndView selectReport(int rno, ModelAndView mv)
    {
    	
    	Board b = bService.selectReport(rno);
    	
        if(b != null)
        { // 게시글 상세조회 성공
            
            mv.addObject("b", b);
            mv.setViewName("admin/a_reportDetail");
        }
        else
        { // 게시글 상세조회 실패
            mv.addObject("msg", "게시글 상세조회 실패!");
            mv.setViewName("common/errorPage");
        }
        
        return mv;
    }
    
    @RequestMapping("reportDelete.bo")
    public String reportDelete(int ino, Model model) {
    	
    	int result = bService.reportDelete(ino);
    	
        if(result > 0)
        {   // 게시글 삭제 성공
            
            return "redirect:aReportList.bo?currentPage=1";
            
        }
        else
        {   // 게시글 삭제 실패
            
            model.addAttribute("msg", "게시글 삭제 실패!!");
            return "common/errorPage";
        }
    	
    }
    
    @RequestMapping("yellowCardPlus.bo")
    public String yellowCardPlus(Board b, int ino, Model model) {
    	
    	//System.out.println(b);
    	int result1 = bService.yellowCardPlus(b);
    	
    	
        if(result1 > 0)
        {   // 게시글 삭제 성공
        	bService.reportDelete(ino);
            return "redirect:aReportList.bo?currentPage=1";
            
        }
        else
        {   // 게시글 삭제 실패
            
            model.addAttribute("msg", "게시글 삭제 실패!!");
            return "common/errorPage";
        }
    	
    }
    
    
    // 관리자 신고관리 끝
    
    // 관리자 후기
    @RequestMapping("aReplyList.bo")
    public String aReplyList(int currentPage, Model model) {
    	
        int listCount = bService.aReplyCount(); 
        PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 5);
        
        ArrayList<Board> list = bService.aReplyList(pi);
        
        model.addAttribute("list", list);
        model.addAttribute("pi", pi);
        
        return "admin/a_replyList";
        
    }
    
    @RequestMapping("aReplyDetail.bo")
    public String aReplyDetail(int reNo, int rpNo, Model model) {
    	
    	
        Board b = new Board();
        
        b.setReNo(reNo);
        b.setRpNo(rpNo);
              
        Board r = bService.selectReview(b);
         
        model.addAttribute("r", r);
        
        return "admin/a_replyDetailView";
    }
    	
    
    
    
    
    // 관리자 후기 끝
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    // 파트너 공지사항 시작 -------------------------------------------
    // 공지사항 전체 목록 조회용 서비스
    @RequestMapping("pNoticeList.bo")
    public String pSelectNoticeList(int currentPage, Model model) {
    	
        int listCount = bService.pSelectNoticeListCount(); 
        PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 5);
        
        ArrayList<Board> list = bService.pSelectNoticeList(pi);
        //System.out.println(list);
        model.addAttribute("list", list);
        model.addAttribute("pi", pi);
        
        return "partner/partnerNotice";
    }
    
    // 공지사항 상세 조회용 서비스 
    @RequestMapping("pNoticeListDetail.bo")
    public ModelAndView pSelectNoticeListDetail(int noNo, ModelAndView mv){
    	
        int result = bService.pNoticeIncreaseCount(noNo);
        
        if(result > 0){ // 게시글 상세조회 성공
            
            Board b = bService.pSelectNoticeDetail(noNo);
            mv.addObject("b", b);
            mv.setViewName("partner/partnerNoticeDetail");
            
        }else{ // 게시글 상세조회 실패
        	
            mv.addObject("msg", "게시글 상세조회 실패!");
            mv.setViewName("common/errorPage");
        }
        return mv;
    }
    
    //------------------------------------------- 파트너 공지사항 끝
    
    
    // 진아 시작 -------------------------------------------------------------------------
    // Page_faq.jsp : get latest 3 faqTitle per faqCategory
    @RequestMapping("faq.bo")
    public ModelAndView selectFaqList(ModelAndView mv){
    	
    	ArrayList<Board> faqList = new ArrayList<>();
    	ArrayList<Board> faqTempList = null;
    	
    	String[] faqCategoryList = {"공지사항", "상품문의", "예약방법", "일반문의", "취소환불", "파트너등록"};
    	String faqCategory = null;
    	System.out.println("point 1");
    	
    	for(int i=0; i<6; i++) {
    		
    		faqCategory = faqCategoryList[i];
    		faqTempList = bService.selectFaqList(faqCategory);
        	System.out.println("point 2");
        	
    		for(int y=0; y<3; y++) {
    			
    			faqList.add(faqTempList.get(y));
    			
    		}
    		
    		
    	}

        if(!faqList.isEmpty()){ // 성공
           
            mv.addObject("faqList", faqList);
            mv.setViewName("user/faq");
            for(int i=0; i<faqList.size(); i++) {
            	//System.out.println("faqList size() : " + faqList.size());
                System.out.println(i + " faqList 조회 성공 : " + faqList.get(i));
            }

        }else{ // 실패
        	
            mv.addObject("msg", "FAQ 리스트 조회 실패!");
            mv.setViewName("common/errorPage");
            System.out.println("faqList 조회 실패 : " + faqList);

        }
        
        return mv;
    	
    }
    
    @RequestMapping("agreement.bo")
    public String showAgreement() {
    	return "user/agreement";
    }
    
    @RequestMapping("personalInfoPolicy.bo")
    public String showPersonalInfoPolicy() {
    	return "user/personalInfoPolicy";
    }
    
    @RequestMapping("refundPolicy.bo")
    public String showRefundPolicy() {
    	return "user/refundPolicy";
    }
    
    // 진아 끝 -------------------------------------------------------------------------   
    
    @RequestMapping("reviewList.re")
    public String reviewList(int currentPage, String status, Model model, HttpSession session) {
 	   
		 Member m = (Member)session.getAttribute("loginUser");
		 int userNo = m.getUsNo();
		 		
		if(status == null ) {
			int responseListCount = bService.selectReviewCount2(userNo);
			 PageInfo responsePi = Pagination.getPageInfo(responseListCount, currentPage, 5, 5);

			 ArrayList<Board> responseList = bService.reviewList2(responsePi, userNo);
			 
			 model.addAttribute("responsePi", responsePi);
			 model.addAttribute("reList", responseList);
			 
			 int noReplyListCount = bService.selectReviewCount1(userNo);
			 PageInfo noReplyPi = Pagination.getPageInfo(noReplyListCount, currentPage, 5, 5);

			 ArrayList<Board> noreplyList = bService.reviewList1(noReplyPi, userNo);

			 model.addAttribute("noReplyPi", noReplyPi);
			 model.addAttribute("noList", noreplyList);
		}else if(status.equals("Y")){
			 int responseListCount = bService.selectReviewCount2(userNo);
			 PageInfo responsePi = Pagination.getPageInfo(responseListCount, currentPage, 5, 5);

			 ArrayList<Board> responseList = bService.reviewList2(responsePi, userNo);
			 
			 model.addAttribute("status",status);
			 model.addAttribute("responsePi", responsePi);
			 model.addAttribute("reList", responseList);
			 
		}else {
			 int noReplyListCount = bService.selectReviewCount1(userNo);
			 PageInfo noReplyPi = Pagination.getPageInfo(noReplyListCount, currentPage, 5, 5);

			 ArrayList<Board> noreplyList = bService.reviewList1(noReplyPi, userNo);

			 model.addAttribute("noReplyPi", noReplyPi);
			 model.addAttribute("noList", noreplyList);
		}

		 
		 return "partner/partnerReplyListView";
    
    }
    
    @RequestMapping("reviewForm.re")
    public String reviewForm(int reNo, int rpNo, Model model) {
    	Board b = new Board();
    	b.setReNo(reNo);
    	b.setRpNo(rpNo);
    	
    	Board r = bService.selectReview(b);
    	
    	model.addAttribute("r", r);
    	return "partner/partnerReplyEnrollForm";
    }
    
    @RequestMapping("insert.re")
    public String insertReply(int reNo,String reply, Model model) {
    	
    	Board b = new Board();
    	
    	b.setReNo(reNo);
    	b.setReply(reply);
    	
    	int result = bService.insertReply(b);
    	
    	
    	
    	if(result > 0){ // 게시글 상세조회 성공
            
            Board r = bService.selectReview(b);
            model.addAttribute("r", r);
            return "redirect:reviewList.re?currentPage=1";
            
        }else{ // 게시글 상세조회 실패
        	
            model.addAttribute("msg", "리뷰 등록 실패!!");
            return "common/errorPage";
        }
    	
    }
    
    @RequestMapping("reviewDetailView.re")
    public String reviewDetailView(int reNo, int rpNo, Model model) {
    	
    		Board b = new Board();
    		
    		b.setReNo(reNo);
    		b.setRpNo(rpNo);
    				
    	 Board r = bService.selectReview(b);
    	 
    	 model.addAttribute("r", r);
		 
		 return "partner/partnerReplyDetailView";
    	
    }
    
    ////////////////////////// 대쉬보드
    @RequestMapping("pNoticeListDashboard.bo")
    public String pNoticeListDashboard(int currentPage, Model model) {
    	
        int listCount = bService.pSelectNoticeListCount(); 
        PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 5);
        
        ArrayList<Board> list = bService.pSelectNoticeList(pi);
        //System.out.println(list);
        model.addAttribute("list", list);
        model.addAttribute("pi", pi);
        
        return "partner/partnerNotice";
    }
    
    @ResponseBody
	@RequestMapping(value="noticeListDashboard.bo", produces="application/json; charset=utf-8")
	public String pNoticeListDashboard(int currentPage, HttpSession session) {
		
    	int listCount = bService.aSelectNoticeListCount(); 
        PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 5);
        
        ArrayList<Board> list = bService.aSelectNoticeList(pi);
        

        // Gson 객체 생성
        Gson gson = new Gson();

        // JSON Object를 맵으로 바꿈
	    HashMap<String, Object> map = new HashMap<String, Object>();
	    JsonObject jsonObject = new JsonObject();

	    // key-value 형태로 맵에 저장
	    map.put("pi", pi); // 받아온 쿼리 리스트를 hashmap에 담는다.
	    map.put("list", list); // 받아온 문자열을 hashmap에 담는다.

	    // 맵을 JSON Ob,ject 문자열로 바꿈
	    String jsonString = gson.toJson(map);
				
	    return jsonString;
	}
    
    @ResponseBody
	@RequestMapping(value="reviewListDashboard.bo", produces="application/json; charset=utf-8")
	public String reviewListDashboard(int currentPage, HttpSession session) {
    	 
    	Member m = (Member)session.getAttribute("loginUser");
		int userNo = m.getUsNo();
		 		
		 
		int noReplyListCount = bService.selectReviewCount1(userNo);
    	int listCount = bService.pSelectNoticeListCount(); 
    	
        PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 5);
        PageInfo noReplyPi = Pagination.getPageInfo(noReplyListCount, currentPage, 5, 5);

		ArrayList<Board> list = bService.reviewList1(noReplyPi, userNo);

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
    
    
  
}
