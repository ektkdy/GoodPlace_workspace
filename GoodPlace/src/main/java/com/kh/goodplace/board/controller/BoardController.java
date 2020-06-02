package com.kh.goodplace.board.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.goodplace.board.model.service.BoardService;
import com.kh.goodplace.board.model.vo.Board;
import com.kh.goodplace.common.model.vo.PageInfo;
import com.kh.goodplace.common.template.Pagination;

@Controller
public class BoardController {

    @Autowired
    private BoardService bService;
    
    @RequestMapping("aFaqList.bo")
    public String aSelectFaqList(int currentPage, Model model) {
    	
        int listCount = bService.aSelectFaqListCount(); 
        PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
        
        ArrayList<Board> list = bService.aSelectFaqList(pi);
        
        model.addAttribute("list", list);
        model.addAttribute("pi", pi);
        
        return "admin/a_faqList";
        
    	
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
    
    
    
    
    
    
    
    
    
    
    
    
}
