package com.kh.goodplace.experience.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	public int selectListExpCount() {
		return 0;
	}

	@Override
	public ArrayList<Experience> selectExpList(PageInfo pi) {
		return null;
	}

	@Override
	public int insertExp() {
		return 0;
	}

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
