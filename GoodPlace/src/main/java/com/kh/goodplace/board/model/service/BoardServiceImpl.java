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
	
	// ------------------- 관리자 1:1문의 ----------------------

	@Override
	public int aSelectInquiryListCount() {
		return bDao.aSelectInquiryListCount(sqlSession);
	}

	@Override
	public ArrayList<Board> aSelectInquiryList(PageInfo pi) {
		return bDao.aSelectInquiryList(sqlSession, pi);
	}

	@Override
	public int insertInquiry(Board b) {
		return bDao.insertInquiry(sqlSession, b);
	}

	@Override
	public Board selectInquiry(int ino) {
		return bDao.selectInquiry(sqlSession, ino);
	}

	@Override
	public int inquiryUpdate(Board b) {
		return bDao.inquiryUpdate(sqlSession, b);
	}
	// ------------------- 관리자 신고관리 ----------------------
	
	@Override
	public int aSelectReportListCount() {
		return bDao.aSelectReportListCount(sqlSession);
	}

	@Override
	public ArrayList<Board> aSelectReportList(PageInfo pi) {
		return bDao.aSelectReportList(sqlSession, pi);
	}

	@Override
	public Board selectReport(int rno) {
		return bDao.selectReport(sqlSession, rno);
	}
	
	@Override
	public int reportDelete(int ino) {
		return bDao.reportDelete(sqlSession, ino);
	}

	@Override
	public int yellowCardPlus(Board b) {
		return bDao.yellowCardPlus(sqlSession, b);
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

	// ------------------- 파트너 리뷰 ----------------------
	
	@Override
	public int selectReviewCount(int userNo) {
		return bDao.selectReviewCount(sqlSession, userNo);
	}

	@Override
	public ArrayList<Board> reviewList(PageInfo pi, int userNo) {
		
		return bDao.reviewList(sqlSession, userNo, pi);
	}

	@Override
	public Board selectReview(int reNo) {
		return bDao.selectReview(sqlSession, reNo);
	}

	@Override
	public int insertReply(Board b) {
		return bDao.insertReply(sqlSession, b);
	}


	

}
