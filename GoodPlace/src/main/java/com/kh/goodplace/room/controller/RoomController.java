package com.kh.goodplace.room.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.kh.goodplace.room.model.service.RoomService;

@Controller
public class RoomController {
	
	@Autowired // DI
	private RoomService rService;

}
