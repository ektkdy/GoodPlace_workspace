package com.kh.goodplace.experience.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.goodplace.common.model.vo.Attachment;
import com.kh.goodplace.common.model.vo.PageInfo;
import com.kh.goodplace.experience.model.vo.Experience;

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
		return 0;
	}

	public int insertAttachment(SqlSessionTemplate sqlSession, Attachment at) {
		return sqlSession.insert("expMapper.insertAttachment", at);
	}

}
