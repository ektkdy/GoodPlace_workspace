package com.kh.goodplace.experience.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.goodplace.common.model.vo.Attachment;
import com.kh.goodplace.common.model.vo.PageInfo;
import com.kh.goodplace.experience.model.vo.Experience;
import com.kh.goodplace.room.model.vo.Room;

@Repository("expDao")
public class ExperienceDao {

	public int selectExpListCount(SqlSessionTemplate sqlSession, int usNo) {
		return sqlSession.selectOne("expMapper.selectExpListCount", usNo);
	}

	public ArrayList<Experience> selectExpList(SqlSessionTemplate sqlSession, PageInfo pi, int usNo) {
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("expMapper.selectExpList", usNo, rowBounds);
	}

	public int insertExp(SqlSessionTemplate sqlSession, Experience e) {
		return sqlSession.insert("expMapper.insertExp", e);
	}

	public int insertAttachment(SqlSessionTemplate sqlSession, Attachment at) {
		return sqlSession.insert("expMapper.insertAttachment", at);
	}
	

	public ArrayList<Experience> selectExp(SqlSessionTemplate sqlSession, int exNo) {
		return (ArrayList)sqlSession.selectList("expMapper.selectExp", exNo);
	}

	
	public ArrayList<Experience> updateExpForm(SqlSessionTemplate sqlSession, int exNo) {
		return (ArrayList)sqlSession.selectList("expMapper.selectExp", exNo);
	}
	
	public ArrayList<Experience> updateReExpForm(SqlSessionTemplate sqlSession, int exNo) {
		return (ArrayList)sqlSession.selectList("expMapper.selectExp", exNo);
	}

	
	
	
	
	
	
	// --------- 체험관리 시작 -----------------
	
	public int selectListExpWaitCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("expMapper.selectListExpWaitCount");
		
	}
	
	public ArrayList<Experience> selectExpWaitList(SqlSessionTemplate sqlSession, PageInfo pi){
		
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("expMapper.selectExpWaitList", null, rowBounds);
		
	}
	
	public int selectListExpOkayCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("expMapper.selectListExpOkayCount");
		
	}
	
	public ArrayList<Experience> selectExpOkayList(SqlSessionTemplate sqlSession, PageInfo pi){
		
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("expMapper.selectExpOkayList", null, rowBounds);
		
	}

	
	
	// --------- 체험관리 시작 -----------------

}
