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
	
	// ------------------- 관리자 FAQ ----------------------
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

	@Override
	public Board selectFaq(int fno) {
		
		return bDao.selectFaq(sqlSession, fno);
		
	}

	@Override
	public int faqUpdate(Board b) {
		return bDao.faqUpdate(sqlSession, b);
	}

	@Override
	public int faqDelete(int fno) {

		return bDao.faqDelete(sqlSession, fno);
		
	}
	
	// ------------------- 관리자 공지사항 ----------------------

	@Override
	public int aSelectNoticeListCount() {
		return bDao.aSelectNoticeListCount(sqlSession);
	}

	@Override
	public ArrayList<Board> aSelectNoticeList(PageInfo pi) {
		return bDao.aSelectNoticeList(sqlSession, pi);
	}

	@Override
	public int insertNotice(Board b) {
		return bDao.insertNotice(sqlSession, b);
	}

	@Override
	public int NoticeincreaseCount(int nno) {
		return 0;
	}

	@Override
	public Board selectNotice(int nno) {
		return null;
	}

	@Override
	public int NoticeUpdate(Board b) {
		return 0;
	}

	@Override
	public int NoticeDelete(int nno) {
		return 0;
	}
	




}
