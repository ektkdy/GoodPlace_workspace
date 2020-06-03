package com.kh.goodplace.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.goodplace.member.model.vo.Member;

@Repository("mDao")
public class MemberDao {
	
	// 로그인
	public Member loginMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.loginMember", m);
	}
	
	// 회원가입 정보입력
	public int insertMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.insert("memberMapper.insertMember", m);
	}
	
	// 이메일 1개 조회
	public int emailCheck(SqlSessionTemplate sqlSession, String email) {
		return sqlSession.selectOne("memberMapper.emailCheck", email);
	}
	
	public int updatePwd(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("memberMapper.updatePwd", m);
	}
	
	public int insertPartner(SqlSessionTemplate sqlSession, Member m) {
		int result1 = sqlSession.insert("memberMapper.insertPartner", m);
		int result2 = sqlSession.update("memberMapper.updatePartnerNo", m);	// 회원테이블의 파트너번호, 프로필 변경
		return result1 * result2;
	}
}
