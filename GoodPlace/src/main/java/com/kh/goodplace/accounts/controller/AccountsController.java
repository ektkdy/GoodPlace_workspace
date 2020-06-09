package com.kh.goodplace.accounts.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.goodplace.accounts.model.service.AccountsService;
import com.kh.goodplace.accounts.model.vo.Accounts;
import com.kh.goodplace.common.model.vo.PageInfo;
import com.kh.goodplace.common.template.Pagination;
import com.kh.goodplace.member.model.vo.Member;

@Controller
public class AccountsController {
	
    @Autowired
    private AccountsService aService;
    
    // 관리자 FAQ 시작
    @RequestMapping("aAccountsList.ac")
    public String aSelectAccountList(int currentPage, Model model) {
    	
        int listCount = aService.aSelectAccountListCount(); 
        PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
        
        ArrayList<Accounts> list = aService.aSelectAccountList(pi);
        
        model.addAttribute("list", list);
        model.addAttribute("pi", pi);
        
        return "admin/a_accountsList";
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

    /* 파트너페이지 정산관리 */
	@RequestMapping("partnerIncome.ac")
	public String selectIncomeList(int currentPage, Model model, HttpSession session) {
		
		Member loginUser  = (Member)session.getAttribute("loginUser");
		int usNo = loginUser.getUsNo();
		
		int listCount = aService.selectIncomeListCount(usNo);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		
		ArrayList<Accounts> list = aService.selectIncomeList(pi, usNo);
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
		return "partner/partnerIncome";
	}
    
    
    
    
    
    
    
    
    
    
    
    

}
