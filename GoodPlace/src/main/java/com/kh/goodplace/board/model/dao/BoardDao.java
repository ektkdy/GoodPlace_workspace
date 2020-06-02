package com.kh.goodplace.board.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.goodplace.board.model.vo.Board;
import com.kh.goodplace.common.model.vo.PageInfo;

@Repository("bDao")
public class BoardDao {

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
	
}
