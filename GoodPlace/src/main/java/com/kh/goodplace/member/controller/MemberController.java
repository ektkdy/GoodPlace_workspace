package com.kh.goodplace.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.goodplace.member.model.service.MemberService;
import com.kh.goodplace.member.model.vo.Member;

@Controller
public class MemberController {

	@Autowired // DI
	private MemberService mService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@RequestMapping("loginForm.me")
	public String loginForm() {
		return "user/member/loginMain";
	}
	
	@RequestMapping("enrollForm.me")
	public String enrollForm() {
		return "user/member/enrollMain";
	}
	
	@RequestMapping("enrollEmailForm1.me")
	public String enrollEmailForm1() {
		return "user/member/enrollForm1";
	}
	
	@RequestMapping("enrollEmailForm2.me")
	public ModelAndView enrollEmailForm2(Member m, ModelAndView mv) {
		String encPwd = bcryptPasswordEncoder.encode(m.getUserPwd());
		//System.out.println("암호화후: " + encPwd);
		
		m.setUserPwd(encPwd);
		
		
		mv.addObject("m", m);
        mv.setViewName("user/member/enrollForm2");
		
		return mv;
	}
	
	@RequestMapping("insertMember.me")
	public ModelAndView insertMember(Member m, ModelAndView mv, HttpSession session) {
		
		int result = mService.insertMember(m);
		if(result > 0) {	// 회원가입 성공
			session.setAttribute("msg", "GoodPlace의 회원이 되신것을 축하합니다.");
			mv.setViewName("user/member/enrollSuccess");
		} else {			// 회원가입 실패
			mv.addObject("msg","회원가입 실패!!");
			mv.setViewName("common/errorPage");
		}
		
		return mv;
	}
}
