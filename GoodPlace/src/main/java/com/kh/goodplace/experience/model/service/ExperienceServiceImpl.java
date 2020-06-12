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

	@Override
	public int insertExp(Experience e) {
		return expDao.insertExp(sqlSession, e);
	}
	
	@Override
	public int insertAttachment(Attachment at) {
		return expDao.insertAttachment(sqlSession, at);
	}

	@Override
	public ArrayList<Experience> selectExp(int exNo) {
		return expDao.selectExp(sqlSession, exNo);
	}

	@Override
	public Experience selectExpOne(int exNo) {
		return expDao.selectExpOne(sqlSession, exNo);
	}

	@Override
	public ArrayList<Attachment> selectAt(int exNo) {
		return expDao.selectAt(sqlSession, exNo);
	}

	@Override
	public int updateExp(Experience e) {
		return expDao.updateExp(sqlSession, e);
	}

	@Override
	public int updateAt(Attachment at) {
		return expDao.updateAt(sqlSession, at);
	}
	
	@Override
	public int updateReExp(Experience e) {
		return expDao.updateReExp(sqlSession, e);
	}

	@Override
	public int restExp(int exNo) {
		return expDao.restExp(sqlSession, exNo);
	}

	@Override
	public int deleteExp(int exNo) {
		return expDao.deleteExp(sqlSession, exNo);
	}

	@Override
	public int endRestExp(int exNo) {
		return expDao.endRestExp(sqlSession, exNo);
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

	@Override
	public Experience selectExpmWaitDetail(int eno) {
		return expDao.selectExpmWaitDetail(sqlSession, eno);
	}

	@Override
	public int updateOkay(int eno) {
		return expDao.updateOkay(sqlSession, eno);
	}

	@Override
	public int updateReject(Experience e) {
		return expDao.updateReject(sqlSession, e);
	}

	@Override
	public int selectRvExpListCount(int usNo) {
		return expDao.selectRvExpListCount(sqlSession, usNo) ;
	}

	@Override
	public int selectRvExpConfirmListCount(int usNo) {
		return expDao.selectRvExpConfirmListCount(sqlSession, usNo) ;
	}

	@Override
	public int selectRvExpCancelListCount(int usNo) {
		return expDao.selectRvExpCancelListCount(sqlSession, usNo) ;
	}
	@Override
	public ArrayList<Experience> selectRvExpList(PageInfo pi, int usNo) {
		return expDao.selectRvExpList(sqlSession, pi, usNo);
	}

	@Override
	public ArrayList<Experience> selectRvExpConfirmList(PageInfo pi, int usNo) {
		return expDao.selectRvExpConfirmList(sqlSession, pi, usNo);
	}

	@Override
	public ArrayList<Experience> selectRvExpCancelList(PageInfo pi, int usNo) {
		return expDao.selectRvExpCancelList(sqlSession, pi, usNo);
	}

	@Override
	public Experience reservationDetailView(int epno) {
		return expDao.reservationDetailView(sqlSession, epno);
	}

	@Override
	public int expSearchCount(Experience e) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<Experience> expSearchList(PageInfo pi, Experience e) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<Experience> selectExpListUser(Experience exp) {
		// TODO Auto-generated method stub
		return null;
	}

	
	
	
	
	
	
	
	
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
