package com.kh.goodplace.member.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.goodplace.member.model.dao.MemberDao;
import com.kh.goodplace.member.model.vo.Member;

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

	//-------------------------------------------------------------------
	
	
	// 1. 파트너 수입 목록 조회용 서비스
	@Override
	public ArrayList<Member> selectIncomeList() {
		return null;
	}

	//2. 파트너 계정정보 수정용 서비스
	@Override
	public int updateAccount(Member m) {
		return mDao.updateAccount(sqlSession, m);
	}

	//-------------------------------------------------------------------

	

}
