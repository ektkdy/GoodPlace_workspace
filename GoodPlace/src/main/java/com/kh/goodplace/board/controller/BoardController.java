package com.kh.goodplace.board.controller;

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
import org.springframework.web.servlet.ModelAndView;

import com.kh.goodplace.board.model.service.BoardService;
import com.kh.goodplace.board.model.vo.Board;
import com.kh.goodplace.common.model.vo.PageInfo;
import com.kh.goodplace.common.template.Pagination;

@Controller
public class BoardController {

    @Autowired
    private BoardService bService;
    
    // 관리자 FAQ 시작
    @RequestMapping("aFaqList.bo")
    public String aSelectFaqList(int currentPage, Model model) {
    	
        int listCount = bService.aSelectFaqListCount(); 
        PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
        
        ArrayList<Board> list = bService.aSelectFaqList(pi);
        
        model.addAttribute("list", list);
        model.addAttribute("pi", pi);
        
        return "admin/a_faqList";
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
    public String faqDelete(int fno, Model model) {
    	
    	int result = bService.faqDelete(fno);
    	
        if(result > 0)
        {   // 게시글 삭제 성공
            
            return "redirect:aFaqList.bo?currentPage=1";
            
        }
        else
        {   // 게시글 삭제 실패
            
            model.addAttribute("msg", "게시글 삭제 실패!!");
            return "common/errorPage";
        }
    	
    }
    // 관리자 FAQ 끝

    // 관리자 공지사항 시작
    
    @RequestMapping("aNoticeList.bo")
    public String aSelectNoticeList(int currentPage, Model model) {
    	
        int listCount = bService.aSelectNoticeListCount(); 
        PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
        
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
    
    // 관리자 공지사항 끝
    

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    // 파트너 공지사항 시작 -------------------------------------------
    // 공지사항 전체 목록 조회용 서비스
    @RequestMapping("pNoticeList.bo")
    public String pSelectNoticeList(int currentPage, Model model) {
    	
        int listCount = bService.pSelectNoticeListCount(); 
        PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
        
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
    
    
    // 사용자 FAQ 시작
    // 전체 Category별 제목 조회
//    @RequestMapping("faq.bo")
//    public String showFaq(Model model) {
//    	
//    		ArrayList<String> faqCategoryList = selectFaqCategory();
////        ArrayList<String> faqCategoryList = bService.selectFaqCategory();
////        ArrayList<String> faqTitleList = bService.selectFaqList(String faqCategory);
//        
//        model.addAttribute("faqCategoryList", faqCategoryList);
//        model.addAttribute("faqTitleList", faqTitleList);
//        	
//        return "user/faq";
//    }
    
    // FAQ 모든 카테고리 조회
    @RequestMapping("faq.bo")
    public ArrayList<String> selectFaqCategory(){
    	
    	ArrayList<String> faqCategoryList = bService.selectFaqCategory();
    	System.out.println(faqCategoryList);
    	return faqCategoryList;
    	
    }
    
//    // FAQ 카테고리별 faqTitle 조회
//    public ArrayList<String> selectFaqList(String faqCategory){
//    	ArrayList<String> faqTitleList = bService.selectFaqCategory();
//    	return faqCategoryList;
//    }
    
    
    // 사용자 FAQ 끝
    
    
    
    
    
    
    
    
    
    
    
}
