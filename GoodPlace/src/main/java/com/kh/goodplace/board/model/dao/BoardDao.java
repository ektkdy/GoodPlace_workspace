package com.kh.goodplace.board.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.goodplace.board.model.vo.Board;
import com.kh.goodplace.common.model.vo.PageInfo;

@Repository("bDao")
public class BoardDao {

	
	//------------ 관리자 FAQ -----------------------------------------
	public int aSelectFaqListCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("boardMapper.aSelectFaqListCount");
		
	}
	
	public ArrayList<Board> aSelectFaqList(SqlSessionTemplate sqlSession, PageInfo pi){
		
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("boardMapper.aSelectFaqList", null, rowBounds);
		
	}
	
	public int insertFaq(SqlSessionTemplate sqlSession, Board b) {
		
		return sqlSession.insert("boardMapper.insertFaq", b);
		
	}
	
	public Board selectFaq(SqlSessionTemplate sqlSession, int fno) {
		
		return sqlSession.selectOne("boardMapper.selectFaq", fno);
		
	}
	
	public int faqUpdate(SqlSessionTemplate sqlSession, Board b) {
		
		return sqlSession.update("boardMapper.faqUpdate", b);
		
	}
	
	public int faqDelete(SqlSessionTemplate sqlSession, int fno) {
		
		return sqlSession.delete("boardMapper.faqDelete", fno);
		
	}
	
	//------------ 관리자 공지사항 -----------------------------------------
	
	public int aSelectNoticeListCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("boardMapper.aSelectNoticeListCount");
		
	}
	
	public ArrayList<Board> aSelectNoticeList(SqlSessionTemplate sqlSession, PageInfo pi){
		
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("boardMapper.aSelectNoticeList", null, rowBounds);
		
	}
	
	public int insertNotice(SqlSessionTemplate sqlSession, Board b) {
		
		return sqlSession.insert("boardMapper.insertNotice", b);
		
	}

	
	
	
	
	
	
	
	
	
	
	
	
	public int noticeIncreaseCount(SqlSessionTemplate sqlSession, int nno) {
		
		return sqlSession.update("boardMapper.noticeIncreaseCount", nno);
		
	}
	
	
	public Board selectNotice(SqlSessionTemplate sqlSession, int nno) {
		
		return sqlSession.selectOne("boardMapper.selectNotice", nno);
		
	}
	
	public int noticeUpdate(SqlSessionTemplate sqlSession, Board b) {
		
		return sqlSession.update("boardMapper.noticeUpdate", b);
		
	}
	
	
	
	
	//------------ 파트너 공지사항 -----------------------------------------
	
	public int pSelectNoticeListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("boardMapper.pSelectNoticeListCount");
	}

	public ArrayList<Board> pSelectNoticeList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("boardMapper.pSelectNoticeList", null, rowBounds);
	}

	public Board pSelectNoticeDetail(SqlSessionTemplate sqlSession, int noNo) {
		return sqlSession.selectOne("boardMapper.pSelectNoticeDetail", noNo);
	}

	public int pNoticeIncreaseCount(SqlSessionTemplate sqlSession, int noNo) {
		return sqlSession.update("boardMapper.pNoticeIncreaseCount", noNo);
	}
	
	
	// ---------------------------------- 사용자 FAQ --------------------------------------------------------------------------
	
	public ArrayList<Board> selectFaqList(SqlSessionTemplate sqlSession, String faqCategory){
		System.out.println("faqCategory : " + faqCategory);
		return (ArrayList)sqlSession.selectList("boardMapper.selectFaqList", faqCategory);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
