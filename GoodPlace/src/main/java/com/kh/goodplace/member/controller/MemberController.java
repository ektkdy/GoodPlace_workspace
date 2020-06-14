package com.kh.goodplace.member.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.goodplace.common.model.vo.PageInfo;
import com.kh.goodplace.common.template.Pagination;
import com.kh.goodplace.member.model.service.MemberService;
import com.kh.goodplace.member.model.vo.Member;
import com.kh.goodplace.messages.model.dao.ChatDao;
import com.kh.goodplace.messages.model.vo.ChatRoom;

@Controller
public class MemberController {

	@Autowired // DI
	private MemberService mService;
	
	@Autowired // DI
	private ChatDao cDao;

	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@Autowired
	private JavaMailSender mailSender;
	

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
	
	// 파트너대시보드 페이지
	
	@RequestMapping("partnerDashBoardForm.me")
	public String partnerDashBoardForm() {
		return "partner/partnerDashBoard";
	}

	//비밀번호 찾기 페이지2 이메일 체크
	@RequestMapping("emailCheck.me")
	public String emailCheck(String email, HttpSession session, Model model) {

		int result = mService.emailCheck(email);
		
		String setfrom = "gmldud695@naver.com";
		String tomail = email; // 받는 사람 이메일
		String title = "GoodPlace 회원가입 인증 메일입니다."; // 제목

		int random = (int)(Math.random()*1000000);
		
		String content = "인증번호 : " + random; // 내용
		
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message,
					true, "UTF-8");

			messageHelper.setFrom(setfrom); // 보내는사람 생략하면 정상작동을 안함
			messageHelper.setTo(tomail); // 받는사람 이메일
			messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
			messageHelper.setText(content); // 메일 내용

			mailSender.send(message);
		} catch (Exception e) {
			System.out.println(e);
		}
		
		if( result > 0 ) {
			model.addAttribute("email", email);
			model.addAttribute("random",random);
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
			mv.setViewName("redirect:loginEmailForm.me");
			//mv.setViewName("user/member/loginEmail");
		}
		return mv;
	}
	
	
	@RequestMapping(value="kakaoLogin.me")
	public ModelAndView kakaoLogin(Member m, HttpSession session, ModelAndView mv) {
		Member loginUser = mService.loginMember(m);
		session.setAttribute("loginUser", loginUser);
		mv.setViewName("redirect:/");
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
		
		String setfrom = "gmldud695@naver.com";
		String tomail = m.getEmail(); // 받는 사람 이메일
		String title = "GoodPlace 회원가입 인증 메일입니다."; // 제목

		int random = (int)(Math.random()*1000000);
		
		String content = "인증번호 : " + random; // 내용
		
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message,
					true, "UTF-8");

			messageHelper.setFrom(setfrom); // 보내는사람 생략하면 정상작동을 안함
			messageHelper.setTo(tomail); // 받는사람 이메일
			messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
			messageHelper.setText(content); // 메일 내용

			mailSender.send(message);
		} catch (Exception e) {
			System.out.println(e);
		}
		
		m.setUserPwd(encPwd);

		mv.addObject("m", m);
		mv.addObject("random", random);
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
	
	@RequestMapping("kakaoEnroll.me")
	public ModelAndView kakaoEnroll(Member m, ModelAndView mv, HttpSession session) {
		String encPwd = bcryptPasswordEncoder.encode(m.getUserPwd());
		m.setUserPwd(encPwd);
		
		int result1 = mService.emailCheck(m.getEmail()); // 이메일 체크
		int result2 = 0;
		
		if(result1 == 0) { // 가입된 이메일이 없을 경우
			result2 = mService.insertMember(m);
		}

		if(result2 > 0) {	// 회원가입 성공
			session.setAttribute("msg", "GoodPlace의 회원이 되신것을 축하합니다.");
			mv.setViewName("user/member/enrollSuccess");
		} else if(result1 > 0) {			// 회원가입 실패
			session.setAttribute("msg", "이미 가입된 이메일 입니다.");
			mv.setViewName("redirect:loginForm.me");
		} else {
			mv.addObject("msg","회원가입 실패! 관리자에게 문의하세요.");
			mv.setViewName("common/errorPage");
		}
		
		return mv;
	}

	// 파트너 등록 페이지 이동
	@RequestMapping("enrollPartnerForm.me")
	public String enrollPartnerForm() {
		return "user/member/p_enrollFrom";
	}

	// 파트너 정보 insert
	@RequestMapping("insertPartner.me")
	public String insertPartner(Member m, HttpSession session, HttpServletRequest request,
			 						@RequestParam(name="uploadFile", required=false) MultipartFile file) {
		if(!file.getOriginalFilename().equals("")) {
			// 서버에 파일 업로드  --> saveFile 메소드로 따로 빼서 정의할 것
			String changeName = saveFile(file, request);

			m.setOriginName(file.getOriginalFilename());
			m.setChangeName(changeName);
		}

		int result = mService.insertPartner(m);

		session.setAttribute("loginUser", mService.loginMember(m));
		session.setAttribute("msg", "GoodPlace의 파트너 회원이 되신것을 축하합니다!");
		return "redirect:/";
	}

	// 전달받은 파일을 서버에 업로드 시키는 메소드
    public String saveFile(MultipartFile file, HttpServletRequest request) {

      // 파일을 업로드 시킬 폴더 경로 (String savePath)
      String resources = request.getSession().getServletContext().getRealPath("resources");
      String savePath = resources + "\\uploadFiles\\userProfile\\";

      // 원본명 (aaa.jpg)
      String originName = file.getOriginalFilename();

      // 수정명 (20200522202011.jpg)
      // 년월일시분초 (String currentTime)
      String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date()); // 20200522202011

      // 확장자(String ext)
      String ext = originName.substring(originName.lastIndexOf(".")); // ".jpg"

      String changeName = currentTime + ext;


      try {
         file.transferTo(new File(savePath + changeName));
      } catch (IllegalStateException | IOException e) {
         e.printStackTrace();
      }

      return changeName;

   }

    
    // 채팅 상대방 정보 가져오기
	@ResponseBody
	@RequestMapping(value="selectTutor", produces="application/json; charset=utf-8")
	public String selectTutor(Member m, String loginEmail, HttpSession session) throws Exception {
		
		Member tutor = mService.loginMember(m);
		System.out.println(tutor + "/" + loginEmail );
		
		ChatRoom cr = new ChatRoom();
		cr.setTutorEmail(tutor.getEmail());
		cr.setUserEmail(loginEmail);
		
		if(cDao.selectChatRoom(cr) == null) {
			cDao.createRoom(cr);
			cr = cDao.selectChatRoom(cr);
		}
		
		cr = cDao.selectChatRoom(cr);
		
		session.setAttribute("class_class_id", cr.getClass_class_id());
		
		System.out.println("cr : " + cr);
		System.out.println("상대방 : " + tutor);
		return new Gson().toJson(tutor);
	}
	
	@RequestMapping("ReserveForm.ro")
	public String selectReserve() {
		return "user/reserve";
	}



    // ------------------ 파트너 계정관리 컨트롤러 --------------------

    @RequestMapping("partnerMain.me")
    public String partnerMain() {
    	return "partner/partnerDashBoard";
    }

    @RequestMapping("pAccount.me")
    public String pAccount() {
    	return "partner/partnerAccount";
    }

    @RequestMapping("updateAccount.me")
    public ModelAndView updateAccount(Member m, HttpSession session, ModelAndView mv, HttpServletRequest request,
    								  @RequestParam(name="reUploadFile", required=true) MultipartFile file) {
    	
    	//현재 넘어온 파일이 있을 경우(== 넘어온 파일명이 빈문자열이 아닐경우)
    	if(!file.getOriginalFilename().equals("")) {
    		
    		//서버에 파일 업로드 진행
    		String changeName = saveFile(file, request);
    		
    		m.setOriginName(file.getOriginalFilename());
    		m.setChangeName(changeName);
    		m.setFilePath(session.getServletContext().getRealPath("resources")+ "\\uploadFiles\\" + changeName);
    	}

    	int result1 = mService.updateMemberAccount(m);
    	int result2 = mService.updatePartnerAccount(m);

    	int result = result1*result2;
	
		if(result>0) {
			session.setAttribute("loginUser", mService.loginMember(m));
			session.setAttribute("msg", "계정정보 업데이트 성공");
			mv.setViewName("redirect:partnerMain.me");
		} else {
			session.setAttribute("msg", "계정정보 업데이트에 실패했습니다");
			mv.setViewName("redirect:pAccount.me");
		}
		return mv;
    }

    
    
    
    // ------------------ 관리자 컨트롤러 시작 --------------------
    
    
    @RequestMapping("adminForm.me")
    public String adminForm(Model model) {
    	
    	Member e1 = mService.mainExp1();
    	Member e2 = mService.mainExp2();
    	Member r1 = mService.mainRoom1();
    	Member r2 = mService.mainRoom2();
    	
    	model.addAttribute("e1", e1);
    	model.addAttribute("e2", e2);
    	model.addAttribute("r1", r1);
    	model.addAttribute("r2", r2);
   
    	return "admin/a_main";
    }
    /*회원용*/
    @RequestMapping("aMemberList.me")
    public String aSelectMemberList(int currentPage, Model model)
    {
        int listCount = mService.aSelectMemberListCount(); 
        PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
        
        ArrayList<Member> list = mService.aSelectMemberList(pi);
        
        model.addAttribute("list", list);
        model.addAttribute("pi", pi);
        
        return "admin/a_member";
    }
    
    @RequestMapping("blockOn.me")
    public ModelAndView updateBlockMemberOn(int mno, HttpSession session, ModelAndView mv) {
    	
    	int result  = mService.updateBlockMemberOn(mno);
    	
		if(result>0) {
			session.setAttribute("msg", "해당 회원을 정지했습니다");
			mv.setViewName("redirect:aMemberList.me?currentPage=1");
		} else {
			session.setAttribute("msg", "정지 실패!!");
			mv.setViewName("redirect:aMemberList.me?currentPage=1");
		}
		return mv;
    }
    
    @RequestMapping("blockOff.me")
    public ModelAndView updateBlockMemberOff(int mno, HttpSession session, ModelAndView mv) {
    	
    	int result  = mService.updateBlockMemberOff(mno);
    	
		if(result>0) {
			session.setAttribute("msg", "해당 회원을 정지해지했습니다");
			mv.setViewName("redirect:aMemberList.me?currentPage=1");
		} else {
			session.setAttribute("msg", "정지 실패!!");
			mv.setViewName("redirect:aMemberList.me?currentPage=1");
		}
		return mv;
    }
    
    @RequestMapping("memSearch.me")
    public String memSearchList(int currentPage, Member m, Model model) {
    	
    	
        int listCount = mService.memSearchCount(m); 
        PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
        
        ArrayList<Member> list = mService.memSearchList(pi, m);
        model.addAttribute("list", list);
        model.addAttribute("m", m);
        model.addAttribute("pi", pi);
        
        return "admin/a_member";
    }
    
    /*파트너용*/
    @RequestMapping("aPartnerList.me")
    public String selectPartnerList(int currentPage, Model model)
    {
        int listCount = mService.aSelectPartnerListCount(); 
        PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
        
        ArrayList<Member> list = mService.aSelectPartnerList(pi);
        
        model.addAttribute("list", list);
        model.addAttribute("pi", pi);
        
        return "admin/a_partner";
    }
    
    
    @RequestMapping("partnerblockOn.me")
    public ModelAndView updateBlockPartnerOn(int ptno, HttpSession session, ModelAndView mv) {
    	
    	int result  = mService.updateBlockPartnerOn(ptno);
    	
		if(result>0) {
			session.setAttribute("msg", "해당 파트너를 정지했습니다");
			mv.setViewName("redirect:aPartnerList.me?currentPage=1");
		} else {
			session.setAttribute("msg", "정지 실패!!");
			mv.setViewName("redirect:aPartnerList.me?currentPage=1");
		}
		return mv;
    }
    
    @RequestMapping("partnerblockOff.me")
    public ModelAndView updateBlockPartnerOff(int ptno, HttpSession session, ModelAndView mv) {
    	//System.out.println(ptno);
    	int result  = mService.updateBlockPartnerOff(ptno);
    	
		if(result>0) {
			session.setAttribute("msg", "해당 파트너를 정지해지했습니다");
			mv.setViewName("redirect:aPartnerList.me?currentPage=1");
		} else {
			session.setAttribute("msg", "정지 실패!!");
			mv.setViewName("redirect:aPartnerList.me?currentPage=1");
		}
		return mv;
    }
    
    @RequestMapping("aPartnerDetail.me")
    public ModelAndView aSelectPartner(int ptno, ModelAndView mv)
    {
        
    	Member m = mService.aSelectPartnerMember(ptno);
    	ArrayList listR = mService.aSelectPartnerRoom(ptno);
    	ArrayList listE = mService.aSelectPartnerExp(ptno);
    	
    	
    	
        if(m != null)
        { // 파트너 상세조회 성공
            
            mv.addObject("m", m);
            mv.addObject("listR", listR);
            mv.addObject("listE", listE);
            mv.setViewName("admin/a_partnerDetail");
        }
        else
        { // 파트너 상세조회 실패
            mv.addObject("msg", "게시글 상세조회 실패!");
            mv.setViewName("common/errorPage");
        }
        
        return mv;
    } 
    
    @RequestMapping("ptSearch.me")
    public String ptSearchList(int currentPage, Member m, Model model) {
    	
    	
        int listCount = mService.ptSearchCount(m); 
        PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
        
        ArrayList<Member> list = mService.ptSearchList(pi, m);
        model.addAttribute("list", list);
        model.addAttribute("m", m);
        model.addAttribute("pi", pi);
        
        return "admin/a_partner";
    }
    
    
    // ------------------ 관리자 컨트롤러 끝 --------------------
    
    
    
    
    







}
