package com.kh.goodplace.experience.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.goodplace.common.model.vo.PageInfo;
import com.kh.goodplace.experience.model.vo.Experience;

@Repository("expDao")
public class ExperienceDao {

	public int selectExpListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("expMapper.selectExpListCount");
	}

	public ArrayList<Experience> selectExpList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("expMapper.selectExpList", null, rowBounds);
	}

}
