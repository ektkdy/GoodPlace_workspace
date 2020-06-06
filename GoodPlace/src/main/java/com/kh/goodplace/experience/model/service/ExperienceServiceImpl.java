package com.kh.goodplace.experience.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.goodplace.common.model.vo.Attachment;
import com.kh.goodplace.common.model.vo.PageInfo;
import com.kh.goodplace.experience.model.dao.ExperienceDao;
import com.kh.goodplace.experience.model.vo.Experience;
import com.kh.goodplace.room.model.vo.Room;


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
		return expDao.insertAttachment(sqlSession, at);
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
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	//------------[체험관리]------------

	@Override
	public int selectListExpWaitCount() {
		return expDao.selectListExpWaitCount(sqlSession);
	}

	@Override
	public ArrayList<Experience> selectExpWaitList(PageInfo pi) {
		return expDao.selectExpWaitList(sqlSession, pi);
	}

	@Override
	public int selectListExpOkayCount() {
		return expDao.selectListExpOkayCount(sqlSession);
	}

	@Override
	public ArrayList<Experience> selectExpOkayList(PageInfo pi) {
		return expDao.selectExpOkayList(sqlSession, pi);
	}

	
	
	
	
	
	
	
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
