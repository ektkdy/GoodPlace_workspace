package com.kh.goodplace.member.model.service;

import java.util.ArrayList;

import com.kh.goodplace.member.model.vo.Member;

public interface MemberService {
	
	
	// 1. 로그인용 서비스
	Member loginMember(Member m);
	
	// 2. 회원가입용 서비스??
	int insertMember(Member m);
	
	// 3. 회원정보 수정용 서비스
	int updateMember(Member m);
	
	// 4. 회원탈퇴용 서비스
	int deleteMember(String userId);
	
	// 5. 아이디 중복체크용 서비스(AJAX)
	int idCheck(String userId);
	
	
	//-------------------------------------------------------------------
	
	// 1. 파트너 수입 목록 조회용 서비스
	ArrayList<Member> selectIncomeList();
	
	// 2. 파트너 계정정보 등록용 서비스
	Member selectAccount(int usNo);
	
	// 3. 파트너 계정정보 수정용 서비스
	Member insertAccount(int usNo);
	
	//-------------------------------------------------------------------
	
	
	
	
	
	
	
	
	
	
	
	
	
}
