package com.kh.goodplace.board.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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

    
    
    
    
    
    
    
    
    
    
    
    
    
}
