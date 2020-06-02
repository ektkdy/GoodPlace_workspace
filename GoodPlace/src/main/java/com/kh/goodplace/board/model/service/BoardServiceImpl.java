package com.kh.goodplace.board.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.goodplace.board.model.dao.BoardDao;
import com.kh.goodplace.board.model.vo.Board;
import com.kh.goodplace.common.model.vo.PageInfo;

@Service("bService")
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private BoardDao bDao;
	
	
	@Override
	public int aSelectFaqListCount() {
		
		return bDao.aSelectFaqListCount(sqlSession);
		
	}

	@Override
	public ArrayList<Board> aSelectFaqList(PageInfo pi) {
		
		return bDao.aSelectFaqList(sqlSession, pi);
	}

	@Override
	public int insertFaq(Board b) {
		return bDao.insertFaq(sqlSession, b);
	}



}
