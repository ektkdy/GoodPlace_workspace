package com.kh.goodplace.member.model.service;

import java.util.ArrayList;

import com.kh.goodplace.common.model.vo.PageInfo;
import com.kh.goodplace.experience.model.vo.ExpPay;
import com.kh.goodplace.experience.model.vo.Experience;
import com.kh.goodplace.member.model.vo.Member;
import com.kh.goodplace.room.model.vo.Room;
import com.kh.goodplace.room.model.vo.RoomPay;

public interface MemberService {
	
	
	// 1. 로그인용 서비스
	Member loginMember(Member m);
	
	// 2. 회원가입 서비스??
	int insertMember(Member m);
	
	// 3. 회원정보 수정용 서비스
	int updateMember(Member m);
	
	// 4. 회원탈퇴용 서비스
	int deleteMember(String email);
	
	// 5. 이메일 조회(1개) 서비스
	int emailCheck(String email);
	
	// 6. 멤버 비밀번호 변경 서비스
	int updatePwd(Member m);
	
	// 7. 파트너 정보 등록 서비스
	int insertPartner(Member m);
	//-------------------------------------------------------------------
	
	// 파트너 계정정보 수정용 서비스 --> updateMember와 updatePartnerAccount를 사용함
	int updatePartnerAccount(Member m);
	int updateMemberAccount(Member m);
	
	//-------------------------------------------------------------------
	
	
	
	/*관리자*/
	//-------------------------------------------------------------------
	/*회원용*/
	//1_1. 게시판 총갯수 조회용 서비스
	int aSelectMemberListCount();
	
	//1_2. 전체 회원 조회용 서비스
	ArrayList<Member> aSelectMemberList(PageInfo pi);
	
	//2. 회원 정지
	int updateBlockMemberOn(int mno);
	
	//3. 회원 정지해지
	int updateBlockMemberOff(int mno);
	
	//4. 회원 검색 총갯수 조회용
	int memSearchCount(Member m);
	
	//5. 회원 검색 조회용
	ArrayList<Member> memSearchList(PageInfo pi, Member m);
	
	/*파트너용*/
	//1_1. 게시판 총갯수 조회용 서비스
	int aSelectPartnerListCount();
	
	//1_2. 전체 파트너 조회용 서비스
	ArrayList<Member> aSelectPartnerList(PageInfo pi);
	
	//2. 파트너 정지
	int updateBlockPartnerOn(int mno);
	
	//3. 파트너 정지해지
	int updateBlockPartnerOff(int mno);
	
	// 4. 파트너 상세조회용 서비스-현영
	Member aSelectPartnerMember(int ptno);
	ArrayList<Room> aSelectPartnerRoom(int ptno);
	ArrayList<Experience> aSelectPartnerExp(int ptno);
	
	//4. 회원 검색 총갯수 조회용
	int ptSearchCount(Member m);
	
	//5. 회원 검색 조회용
	ArrayList<Member> ptSearchList(PageInfo pi, Member m);
	
	//6. 관리자 메인페이지
	Member mainExp1();
	Member mainRoom1();
	Member mainExp2();
	Member mainRoom2();
	
	
	//-------------------------------------------------------------------
	
	
	
	
	
	
	
	
	
}
