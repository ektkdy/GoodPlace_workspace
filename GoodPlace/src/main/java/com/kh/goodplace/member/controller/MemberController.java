package com.kh.goodplace.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
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
	
	//비밀번호 찾기 페이지1
	@RequestMapping("pwdFindForm1.me")
	public String pwdFindForm1() {
		return "user/member/pwdFind1";
	}
	
	//비밀번호 찾기 페이지2 이메일 체크
	@RequestMapping("emailCheck.me")
	public String emailCheck(String email, HttpSession session, Model model) {
		
		int result = mService.emailCheck(email);
		
		if( result > 0 ) {
			model.addAttribute("email", email);
			return "user/member/pwdFind2";
		} else {
			session.setAttribute("msg", "가입된 이메일이 없습니다.");
			return "redirect:pwdFindForm1.me";
		}
	}
	
	@ResponseBody
	@RequestMapping(value="emailCheck2.me")
	public String emailCheck2(String email) {
		int count = mService.emailCheck(email);
		
		if(count > 0) {	// 중복 아이디 있음 --> 사용 불가
			return "fail";
		} else { // 중복된 아이디가 없음 --> 사용가능
			return "success";
		}
		
	}
	
	//비밀번호 찾기 페이지3 비밀번호 재설정 페이지
	@RequestMapping("pwdResetForm.me")
	public String pwdResetForm(String email, Model model) {
		model.addAttribute("email", email);
		return "user/member/pwdReset";
	}
	
	//비밀번호 재설정
	@RequestMapping("updatePwd.me")
	public String updatePwd(Member m, HttpSession session) {
		String encPwd = bcryptPasswordEncoder.encode(m.getUserPwd());
		
		m.setUserPwd(encPwd);
		
		int result = mService.updatePwd(m);
		
		session.setAttribute("msg", "비밀번호를 성공적으로 변경 하였습니다.");
		return "redirect:/";
	}

	
	// 로그인
	@RequestMapping(value="login.me")
	public ModelAndView loginMember(Member m, HttpSession session, ModelAndView mv) {
		
		Member loginUser = mService.loginMember(m);
		
		// loginUser의 userPwd : 암호문
		// 		   m에 userPwd : 로그인 시 입력한 비밀번호(평문)
		
		if(loginUser != null && bcryptPasswordEncoder.matches(m.getUserPwd(), loginUser.getUserPwd())) {
			//System.out.println(loginUser);
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
	
	@RequestMapping("logout.me")
	public String logoutMember(HttpSession session) {
		session.invalidate();
		return "redirect:/";
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
	
//	// "경우1" 글씨 몇 번 읽는지 테스트  -> 경우1: return 으로 "텍스트"(뷰명) 반환하는 경우
    @RequestMapping("faq.bo")
    public String faq() {
    	
    	System.out.println("경우1");
    	
    	return "main";
    	
    }
    
	/*
	 * // "경우2" 글씨 몇 번 읽는지 테스트 -> 경우2: return 으로 "redirect:/" 반환하는 경우
	 * 
	 * @RequestMapping("faq.bo") public String faq() {
	 * 
	 * System.out.println("경우2");
	 * 
	 * return "redirect:/";
	 * 
	 * }
	 */
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    // ------------------ 파트너 계정관리 컨트롤러 --------------------
    
    @RequestMapping("partnerMain.me")
    public String partnerMain() {
    	return "common/partnerMenubar";
    }
    
    @RequestMapping("pAccount.me")
    public String pAccount() {
    	return "partner/partnerAccount";
    }
    
    @RequestMapping("updateAccount.me")
    public ModelAndView updateAccount(Member m, HttpSession session, ModelAndView mv) {
    	int result1  = mService.updateMemberAccount(m);
    	int result2 = mService.updatePartnerAccount(m);
    	
    	int result = result1*result2;
	
		if(result>0) {
			session.setAttribute("msg", "계정정보 업데이트 성공");
			mv.setViewName("redirect:partnerMain.me");
		} else {
			session.setAttribute("msg", "계정정보 업데이트에 실패했습니다");
			mv.setViewName("redirect:pAccount.me");
		}
		return mv;
    }
    
    
    
    
    
    
    
    
    
    
    
}
