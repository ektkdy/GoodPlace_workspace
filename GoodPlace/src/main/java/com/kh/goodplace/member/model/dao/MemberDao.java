package com.kh.goodplace.member.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.goodplace.common.model.vo.PageInfo;
import com.kh.goodplace.experience.model.vo.Experience;
import com.kh.goodplace.member.model.vo.Member;
import com.kh.goodplace.room.model.vo.Room;

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
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	//-------------------------------파트너------------------------------------

	// 파트너 계정관리 업데이트
	public int updatePartnerAccount(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("memberMapper.updatePartnerAccount", m);
	}

	public int updateMemberAccount(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("memberMapper.updateMemberAccount", m);
	}
	
	
	
	
	
	
	
	//-------------------------------관리자------------------------------------
	// 1. 회원 전체 목록 조회용 서비스 - 관리자
	/*회원용*/
	public int aSelectMemberListCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("memberMapper.aSelectMemberListCount");
		
	}
	
	public ArrayList<Member> aSelectMemberList(SqlSessionTemplate sqlSession, PageInfo pi){
		
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("memberMapper.aSelectMemberList", null, rowBounds);
		
	}
	
	public int updateBlockMemberOn(SqlSessionTemplate sqlSession, int mno) {
		return sqlSession.update("memberMapper.updateBlockMemberOn", mno);
	}
	
	public int updateBlockMemberOff(SqlSessionTemplate sqlSession, int mno) {
		return sqlSession.update("memberMapper.updateBlockMemberOff", mno);
	}
	
	public int memSearchCount(SqlSessionTemplate sqlSession, Member m) {
		
		return sqlSession.selectOne("memberMapper.memSearchCount", m);
		
	}
	
	public ArrayList<Member> memSearchList(SqlSessionTemplate sqlSession, PageInfo pi, Member m){
		
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("memberMapper.memSearchList", m, rowBounds);
		
	}
	
	
	
	/*파트너용*/
	public int aSelectPartnerListCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("memberMapper.aSelectPartnerListCount");
		
	}
	
	public ArrayList<Member> aSelectPartnerList(SqlSessionTemplate sqlSession, PageInfo pi){
		
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("memberMapper.aSelectPartnerList", null, rowBounds);
		
	}
	
	public int updateBlockPartnerOn(SqlSessionTemplate sqlSession, int ptno) {
		return sqlSession.update("memberMapper.updateBlockPartnerOn", ptno);
	}
	
	public int updateBlockPartnerOff(SqlSessionTemplate sqlSession, int ptno) {
		return sqlSession.update("memberMapper.updateBlockPartnerOff", ptno);
	}
	
	public Member aSelectPartnerMember(SqlSessionTemplate sqlSession, int ptno) {
		
		return sqlSession.selectOne("memberMapper.aSelectPartnerMember", ptno);
		
	}
	
	public ArrayList<Room> aSelectPartnerRoom(SqlSessionTemplate sqlSession, int ptno) {
		
		return (ArrayList)sqlSession.selectList("memberMapper.aSelectPartnerRoom", ptno);
		
	}
	
	public ArrayList<Experience> aSelectPartnerExp(SqlSessionTemplate sqlSession, int ptno) {
		
		return (ArrayList)sqlSession.selectList("memberMapper.aSelectPartnerExp", ptno);
		
	}
	
	
	//-------------------------------------------------------------------
}
