package com.kh.goodplace.experience.controller;

import org.springframework.beans.factory.annotation.Autowired;

import com.kh.goodplace.experience.model.service.ExperienceService;

public class ExperienceController {
	
	@Autowired // DI
	private ExperienceService expService;

}
