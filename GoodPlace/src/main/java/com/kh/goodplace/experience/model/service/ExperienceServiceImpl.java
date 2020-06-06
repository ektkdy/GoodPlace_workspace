package com.kh.goodplace.experience.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.goodplace.common.model.vo.Attachment;
import com.kh.goodplace.common.model.vo.PageInfo;
import com.kh.goodplace.experience.model.dao.ExperienceDao;
import com.kh.goodplace.experience.model.vo.Experience;


@Service("expService")
public class ExperienceServiceImpl implements ExperienceService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private ExperienceDao expDao;

	@Override
	public int selectExpListCount(int usNo) {
		return expDao.selectExpListCount(sqlSession, usNo);
	}

	@Override
	public ArrayList<Experience> selectExpList(PageInfo pi, int usNo) {
		return expDao.selectExpList(sqlSession, pi, usNo);
	}

	
	//---------------------------------------------------------
	
	@Override
	public int insertExp(Experience e) {
		return expDao.insertExp(sqlSession, e);
	}
	
	@Override
	public int insertAttachment(Attachment at) {
		
		//int result = 1;
		
		//for(int i=0; i<at.length; i++) {
			int result1 = expDao.insertAttachment(sqlSession, at); 
			//result = result*result1;
		//}
		
		return result1;
	}

	//---------------------------------------------------------

	@Override
	public Experience selectExp(int exNo) {
		return null;
	}

	@Override
	public int updateExp(int exNo) {
		return 0;
	}

	@Override
	public int restExp(int exNo) {
		return 0;
	}

	@Override
	public int deleteExp(int exNo) {
		return 0;
	}

	@Override
	public int updateReExp(int exNo) {
		return 0;
	}

	
}
