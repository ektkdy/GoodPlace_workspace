package com.kh.goodplace.experience.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.kh.goodplace.experience.model.service.ExperienceService;

@Controller
public class ExperienceController {
	
	@Autowired // DI
	private ExperienceService expService;
	
	

}
