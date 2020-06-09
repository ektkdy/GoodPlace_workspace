package com.kh.goodplace.accounts.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.goodplace.accounts.model.service.AccountsService;
import com.kh.goodplace.accounts.model.vo.Accounts;
import com.kh.goodplace.common.model.vo.PageInfo;
import com.kh.goodplace.common.template.Pagination;

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
    
    
    

}
