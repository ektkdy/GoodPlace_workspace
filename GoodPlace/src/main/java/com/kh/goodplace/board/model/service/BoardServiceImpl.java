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
	public int noticeIncreaseCount(int nno) {
		return bDao.noticeIncreaseCount(sqlSession, nno);
	}

	@Override
	public Board selectNotice(int nno) {
		return bDao.selectNotice(sqlSession, nno);
	}

	@Override
	public int noticeUpdate(Board b) {
		return bDao.noticeUpdate(sqlSession, b);
	}

	@Override
	public int noticeDelete(int nno) {
		return 0;
	}

	
	
	// ------------------- 파트너 공지사항 ----------------------
	
	@Override
	public int pSelectNoticeListCount() {
		return bDao.pSelectNoticeListCount(sqlSession);
	}

	@Override
	public ArrayList<Board> pSelectNoticeList(PageInfo pi) {
		return bDao.pSelectNoticeList(sqlSession, pi);
	}

	@Override
	public Board pSelectNoticeDetail(int noNo) {
		return bDao.pSelectNoticeDetail(sqlSession, noNo);
	}

	@Override
	public int pNoticeIncreaseCount(int noNo) {
		return bDao.pNoticeIncreaseCount(sqlSession, noNo);
	}

	// ------------------- 사용자 FAQ ----------------------

	@Override
	public ArrayList<Board> selectFaqList(String faqCategory) {
		return bDao.selectFaqList(sqlSession, faqCategory);
	}



	

}
