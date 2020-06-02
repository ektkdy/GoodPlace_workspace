package com.kh.goodplace.experience.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.goodplace.experience.model.service.ExperienceService;
import com.kh.goodplace.experience.model.vo.Experience;

@Controller
public class ExperienceController {
	
	@Autowired // DI
	private ExperienceService expService;
	
	@RequestMapping("expEnrollForm1.exp")
	public String expForm() {
		return "partner/partnerExpEnrollForm1";
	}
	
	@RequestMapping("expEnrollForm2.exp")
	public ModelAndView expForm2(Experience e, ModelAndView mv) {
		
		System.out.println(e);
		
		mv.addObject("e", e);

		mv.setViewName("partner/partnerExpEnrollForm2");
		
		return mv;
	}
	

}
