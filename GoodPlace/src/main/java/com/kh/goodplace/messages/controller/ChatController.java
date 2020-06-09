package com.kh.goodplace.messages.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.goodplace.messages.model.dao.ChatDao;
import com.kh.goodplace.messages.model.vo.ChatRoom;

@Controller
public class ChatController {
	
	@Autowired // DI
	private ChatDao cDao;
	
	// 메세지 테스트
	@RequestMapping("mTest.me")
	public String mTest(ChatRoom cr, Model model) throws Exception {
		cr.setTutorEmail("ektkdy@naver.com"); // 관리자 아이디
		cr.setCLASS_class_id(1);
		
		ChatRoom room = cDao.selectChatRoom(cr); // 방 검색
		
		System.out.println("room : " + room);
		
		model.addAttribute("room", room);
		model.addAttribute("tutorEmail", "ektkdy@naver.com");
		return "common/mTest";
		//return "common/messages";
	}
	
	
	//사용x (테스트)
	@ResponseBody
	@RequestMapping(value="chatConect", produces="application/json; charset=utf-8")
	public String chatConect(ChatRoom cr) throws Exception {
		cr.setTutorEmail("ektkdy@naver.com"); // 관리자 아이디
		cr.setCLASS_class_id(1);
		
		System.out.println(cr);
		ChatRoom room = cDao.selectChatRoom(cr);
		
		return new Gson().toJson(room);
	}
	
}
