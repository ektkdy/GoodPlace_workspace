package com.kh.goodplace.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.kh.goodplace.member.model.service.MemberService;
import com.kh.goodplace.member.model.vo.Member;

@Controller
public class MemberController {

	@Autowired // DI
	private MemberService mService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	// 로그인 메인
	@RequestMapping("loginForm.me")
	public String loginForm() {
		return "user/member/loginMain";
	}
	// 이메일 로그인 페이지
	@RequestMapping("loginEmailForm.me")
	public String loginEmailForm() {
		return "user/member/loginEmail";
	}
	
	// 로그인
	@RequestMapping(value="login.me")
	public ModelAndView loginMember(Member m, HttpSession session, ModelAndView mv) {
		
		Member loginUser = mService.loginMember(m);
		
		// loginUser의 userPwd : 암호문
		// 		   m에 userPwd : 로그인 시 입력한 비밀번호(평문)
		
		if(loginUser != null && bcryptPasswordEncoder.matches(m.getUserPwd(), loginUser.getUserPwd())) {
			session.setAttribute("loginUser", loginUser);
			mv.setViewName("redirect:/");
		} else {
			//mv.addObject("msg","로그인 실패!!");
			//mv.setViewName("common/errorPage");
			session.setAttribute("msg", "아이디 혹은 비밀번호가 틀립니다.");
			mv.setViewName("redsirect:loginEmailForm.me");
			//mv.setViewName("user/member/loginEmail");	
		}
		return mv;
	}
	
	// 회원가입 메인
	@RequestMapping("enrollForm.me")
	public String enrollForm() {
		return "user/member/enrollMain";
	}
	// 회원가입 1단계(정보입력)
	@RequestMapping("enrollEmailForm1.me")
	public String enrollEmailForm1() {
		return "user/member/enrollForm1";
	}
	// 회원가입 2단계(이메일인증)
	@RequestMapping("enrollEmailForm2.me")
	public ModelAndView enrollEmailForm2(Member m, ModelAndView mv) {
		String encPwd = bcryptPasswordEncoder.encode(m.getUserPwd());
		//System.out.println("암호화후: " + encPwd);
		
		m.setUserPwd(encPwd);
		
		
		mv.addObject("m", m);
        mv.setViewName("user/member/enrollForm2");
		
		return mv;
	}
	
	// 회원가입 성공
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
