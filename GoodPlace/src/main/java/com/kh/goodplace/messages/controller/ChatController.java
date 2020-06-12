package com.kh.goodplace.messages.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.goodplace.member.model.service.MemberService;
import com.kh.goodplace.member.model.vo.Member;
import com.kh.goodplace.messages.model.dao.ChatDao;
import com.kh.goodplace.messages.model.service.ChatService;
import com.kh.goodplace.messages.model.vo.ChatRoom;
import com.kh.goodplace.messages.model.vo.Message;

@Controller
public class ChatController {
	
	@Autowired // DI
	private ChatDao cDao;
	
	@Autowired // DI
	private ChatService cService;
	
	@Autowired // DI
	private MemberService mService;
	
	// 메세지 테스트
	@RequestMapping("mTest.me")
	public String mTest(ChatRoom cr, Model model) throws Exception {
		cr.setTutorEmail("ektkdy@naver.com"); // 관리자 아이디
		cr.setClass_class_id(1);
		
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
		cr.setClass_class_id(1);
		
		System.out.println(cr);
		ChatRoom room = cDao.selectChatRoom(cr);
		
		return new Gson().toJson(room);
	}
	
	
	
	
	// 관리자 메시지 페이지이동
	@RequestMapping("aMessagesList.me")
	public String aSelectMessagesList(Model model) {
		
		ArrayList<ChatRoom> cList = cService.aSelectMessagesList();
		
		model.addAttribute("cList", cList);
		return "admin/a_message";
	}

	
	// 메세지 상세보기 페이지 (해당사용자와 주고받은 대화 내용 전부를 가져옴)
	@RequestMapping("aMessageDetail.me")
	public String aMessageDetail(int msn, int class_class_id , Member m, Model model , HttpSession session) {
		ArrayList<Message> meList = cService.selectMessage(msn);
		
		Member user = mService.loginMember(m);
			
		session.setAttribute("class_class_id", class_class_id); // 소켓 세션에 연결할 때 구분하기 위해 전송함

		model.addAttribute("class_class_id", class_class_id);
		model.addAttribute("meList", meList);
		model.addAttribute("user", user);
		return "admin/a_messageDetail";
	}
	
	//사용자- 파트너 채팅리스트 
	@RequestMapping("partnerMsg.me")
	public String partnerMsg(Model model) {
		
		ArrayList<ChatRoom> cList = cService.pSelectMessagesList();
		
		model.addAttribute("cList", cList);

		return "partner/partnerMessage";
	}
	
	// 파트너 메세지 채팅방
	@RequestMapping("pMessageDetail.me")
	public String pMessageDetail(int msn, int class_class_id, Member m, Model model, HttpSession session) {
		
		ArrayList<Message> meList = cService.selectpMessage(msn);
		
		Member user = mService.loginMember(m);
			
		session.setAttribute("class_class_id", class_class_id);

		model.addAttribute("class_class_id", class_class_id);
		model.addAttribute("meList", meList);
		model.addAttribute("user", user);
			
		return "partner/partnerMessageDetail";
	}
	
	// 사용자 숙소 채팅방
	@RequestMapping("roomChatForm.ro")
	public String roomChatForm(int roNo, String email, HttpSession session, Model model) {
		
		ChatRoom cr = new ChatRoom();
		
		cr.setUserEmail(email);
		cr.setClass_class_id(roNo);
		
		System.out.println(cr);
		cr = cService.selectRoomChat(cr); 

		// 상대방 정보 검색
		Member m = new Member();
		m.setEmail(cr.getTutorEmail());
		Member user = mService.loginMember(m);
		
		System.out.println(cr);
		ArrayList<Message> meList = cService.selectpMessage(cr.getChNo());
		
		session.setAttribute("class_class_id", cr.getClass_class_id());
		
		model.addAttribute("class_class_id", cr.getClass_class_id());
		model.addAttribute("meList", meList);
		model.addAttribute("user", user);
		
		return "common/roomChat";
	}
	
	
	
	
}
