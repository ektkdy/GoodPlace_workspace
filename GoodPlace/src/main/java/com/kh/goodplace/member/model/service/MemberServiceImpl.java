package com.kh.goodplace.member.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.goodplace.common.model.vo.PageInfo;
import com.kh.goodplace.experience.model.vo.ExpPay;
import com.kh.goodplace.experience.model.vo.Experience;
import com.kh.goodplace.member.model.dao.MemberDao;
import com.kh.goodplace.member.model.vo.Member;
import com.kh.goodplace.messages.model.vo.ChatRoom;
import com.kh.goodplace.room.model.vo.Room;
import com.kh.goodplace.room.model.vo.RoomPay;

@Service("mService")	// 구체화 된 빈 (즉, 이 객체는 서비스의 역할을 수행하는 빈으로 등록)
public class MemberServiceImpl implements MemberService {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Autowired
	private MemberDao mDao;

	/**
	 * 1. 로그인 서비스
	 */
	@Override
	public Member loginMember(Member m) {
		return mDao.loginMember(sqlSession,m);
	}
	
	/**
	 * 2. 회원가입 정보 입력 서비스
	 */
	@Override
	public int insertMember(Member m) {
		return mDao.insertMember(sqlSession, m);
	}

	@Override
	public int updateMember(Member m) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteMember(String email) {
		return 0;
	}

	@Override
	public int emailCheck(String email) {
		return mDao.emailCheck(sqlSession, email);
	}

	@Override
	public int updatePwd(Member m) {
		return mDao.updatePwd(sqlSession, m);
	}

	/**
	 * 7.파트너 정보 등록 서비스
	 */
	@Override
	public int insertPartner(Member m) {
		return mDao.insertPartner(sqlSession, m);
	}
	


	//-------------------------------------------------------------------


	//2_1. 파트너 계정정보 수정용(파트너 테이블) 서비스
	@Override
	public int updatePartnerAccount(Member m) {
		return mDao.updatePartnerAccount(sqlSession, m);
	}

	// 2_2. 파트너 계정정보 수정용(멤버 테이블) 서비스
	@Override
	public int updateMemberAccount(Member m) {
		return mDao.updateMemberAccount(sqlSession, m);
	}





	//-------------------------------------------------------------------


	//-------------------------------------------------------------------
		// 1. 회원 전체 목록 조회용 서비스 - 관리자
		/*회원용*/
		@Override
		public int aSelectMemberListCount() {
			
			return mDao.aSelectMemberListCount(sqlSession);
			
		}
		
		@Override
		public ArrayList<Member> aSelectMemberList(PageInfo pi) {
			
			return mDao.aSelectMemberList(sqlSession, pi);
			
		}

		@Override
		public int updateBlockMemberOn(int mno) {
			
			return mDao.updateBlockMemberOn(sqlSession, mno);
			
		}

		@Override
		public int updateBlockMemberOff(int mno) {
			
			return mDao.updateBlockMemberOff(sqlSession, mno);
			
		}
		
		@Override
		public int memSearchCount(Member m) {
			return mDao.memSearchCount(sqlSession, m);
		}

		@Override
		public ArrayList<Member> memSearchList(PageInfo pi, Member m) {
			return mDao.memSearchList(sqlSession, pi, m);
		}

		/*파트너용*/
		@Override
		public int aSelectPartnerListCount() {
			return mDao.aSelectPartnerListCount(sqlSession);
		}
		
		@Override
		public ArrayList<Member> aSelectPartnerList(PageInfo pi) {
			
			return mDao.aSelectPartnerList(sqlSession, pi);
			
		}
		
		@Override
		public int updateBlockPartnerOn(int ptno) {
			return mDao.updateBlockPartnerOn(sqlSession, ptno);
		}
		
		@Override
		public int updateBlockPartnerOff(int ptno) {
			return mDao.updateBlockPartnerOff(sqlSession, ptno);
		}

		@Override
		public Member aSelectPartnerMember(int ptno) {
			return mDao.aSelectPartnerMember(sqlSession, ptno);
		}

		@Override
		public ArrayList<Room> aSelectPartnerRoom(int ptno) {
			return mDao.aSelectPartnerRoom(sqlSession, ptno);
		}

		@Override
		public ArrayList<Experience> aSelectPartnerExp(int ptno) {
			return mDao.aSelectPartnerExp(sqlSession, ptno);
		}

		@Override
		public int ptSearchCount(Member m) {
			return mDao.ptSearchCount(sqlSession, m);
		}

		@Override
		public ArrayList<Member> ptSearchList(PageInfo pi, Member m) {
			return mDao.ptSearchList(sqlSession, pi, m);
		}
		
		/* 관리자 메인 */
		@Override
		public Member mainExp1() {
			return mDao.mainExp1(sqlSession);
		}

		@Override
		public Member mainRoom1() {
			return mDao.mainRoom1(sqlSession);
		}

		@Override
		public Member mainExp2() {
			return mDao.mainExp2(sqlSession);
		}

		@Override
		public Member mainRoom2() {
			return mDao.mainRoom2(sqlSession);
		}



		
		
		//-------------------------------------------------------------------

}
