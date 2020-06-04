package com.kh.goodplace.experience.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.goodplace.common.model.vo.PageInfo;
import com.kh.goodplace.common.template.Pagination;
import com.kh.goodplace.experience.model.service.ExperienceService;
import com.kh.goodplace.experience.model.vo.Experience;

@Controller
public class ExperienceController {
	
	@Autowired // DI
	private ExperienceService expService;
	
	/* 1. 체험관리- 전체 체험목록 조회용 서비스 */
	@RequestMapping("list.exp")
	public String selectExpList(int currentPage, Model model) {
		int listCount = expService.selectExpListCount();
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		
		ArrayList<Experience> list = expService.selectExpList(pi);
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
	public ModelAndView insertExp(Experience e, ModelAndView mv) {
		
		mv.addObject("e", e);
		mv.setViewName("partner/partnerExpList");
		return mv;
	}
	
	
	
	
	/* 8. 정산관리- expPay union roomsPay 리스트 조회용 */
	@RequestMapping("pIncome.me")
	public String selectIncomeList(int currentPage, Model model) {
		int listCount = expService.selectExpListCount();
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		
		return "partner/partnerIncome";
	}

}
