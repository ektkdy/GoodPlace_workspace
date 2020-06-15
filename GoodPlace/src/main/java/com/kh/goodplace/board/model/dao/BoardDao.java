package com.kh.goodplace.board.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.goodplace.board.model.vo.Board;
import com.kh.goodplace.common.model.vo.PageInfo;
import com.kh.goodplace.common.model.vo.WishList;
import com.kh.goodplace.member.model.vo.Member;

@Repository("bDao")
public class BoardDao {

	
	//------------ 관리자 FAQ -----------------------------------------
	public int aSelectFaqListCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("boardMapper.aSelectFaqListCount");
		
	}
	
	public ArrayList<Board> aSelectFaqList(SqlSessionTemplate sqlSession, PageInfo pi){
		
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("boardMapper.aSelectFaqList", null, rowBounds);
		
	}
	
	public int insertFaq(SqlSessionTemplate sqlSession, Board b) {
		
		return sqlSession.insert("boardMapper.insertFaq", b);
		
	}
	
	public Board selectFaq(SqlSessionTemplate sqlSession, int fno) {
		
		return sqlSession.selectOne("boardMapper.selectFaq", fno);
		
	}
	
	public int faqUpdate(SqlSessionTemplate sqlSession, Board b) {
		
		return sqlSession.update("boardMapper.faqUpdate", b);
		
	}
	
	public int faqDelete(SqlSessionTemplate sqlSession, int fno) {
		
		return sqlSession.delete("boardMapper.faqDelete", fno);
		
	}
	
	public int faqSearchCount(SqlSessionTemplate sqlSession, Board b) {
		
		return sqlSession.selectOne("boardMapper.faqSearchCount", b);
		
	}
	
	public ArrayList<Board> faqSearchList(SqlSessionTemplate sqlSession, PageInfo pi, Board b){
		
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("boardMapper.faqSearchList", b, rowBounds);
		
	}
	
	//------------ 관리자 공지사항 -----------------------------------------
	
	public int aSelectNoticeListCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("boardMapper.aSelectNoticeListCount");
		
	}
	
	public ArrayList<Board> aSelectNoticeList(SqlSessionTemplate sqlSession, PageInfo pi){
		
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("boardMapper.aSelectNoticeList", null, rowBounds);
		
	}
	
	public int insertNotice(SqlSessionTemplate sqlSession, Board b) {
		
		return sqlSession.insert("boardMapper.insertNotice", b);
		
	}

	
	public int noticeIncreaseCount(SqlSessionTemplate sqlSession, int nno) {
		
		return sqlSession.update("boardMapper.noticeIncreaseCount", nno);
		
	}
	
	
	public Board selectNotice(SqlSessionTemplate sqlSession, int nno) {
		
		return sqlSession.selectOne("boardMapper.selectNotice", nno);
		
	}
	
	public int noticeUpdate(SqlSessionTemplate sqlSession, Board b) {
		
		return sqlSession.update("boardMapper.noticeUpdate", b);
		
	}
	
	public int noticeDelete(SqlSessionTemplate sqlSession, int nno) {
		return sqlSession.update("boardMapper.noticeDelete", nno);
	}
	
	public int noticeSearchCount(SqlSessionTemplate sqlSession, Board b) {
		
		return sqlSession.selectOne("boardMapper.noticeSearchCount", b);
		
	}
	
	public ArrayList<Board> noticeSearchList(SqlSessionTemplate sqlSession, PageInfo pi, Board b){
		
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("boardMapper.noticeSearchList", b, rowBounds);
		
	}
	
	
	//------------ 사용자 1:1문의 -----------------------------------------
	public int insertInq(SqlSessionTemplate sqlSession, Board b) {
		return sqlSession.insert("boardMapper.insertInq",b);
	}
	
	//------------ 관리자 1:1문의 -----------------------------------------
	
	
	public int aSelectInquiryListCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("boardMapper.aSelectInquiryListCount");
		
	}
	
	public ArrayList<Board> aSelectInquiryList(SqlSessionTemplate sqlSession, PageInfo pi){
		
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("boardMapper.aSelectInquiryList", null, rowBounds);
		
	}
	
	public int insertInquiry(SqlSessionTemplate sqlSession, Board b) {
		
		return sqlSession.update("boardMapper.insertInquiry", b);
		
	}
	
	public Board selectInquiry(SqlSessionTemplate sqlSession, int ino) {
		
		return sqlSession.selectOne("boardMapper.selectInquiry", ino);
		
	}
	
	public int inquiryUpdate(SqlSessionTemplate sqlSession, Board b) {
		
		return sqlSession.update("boardMapper.inquiryUpdate", b);
		
	}
	
	public int inquirySearchCount(SqlSessionTemplate sqlSession, Board b) {
		
		return sqlSession.selectOne("boardMapper.inquirySearchCount", b);
		
	}
	
	public ArrayList<Board> inquirySearchList(SqlSessionTemplate sqlSession, PageInfo pi, Board b){
		
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("boardMapper.inquirySearchList", b, rowBounds);
		
	}
	
	// ------------------- 관리자 신고관리 ----------------------
	
	public int aSelectReportListCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("boardMapper.aSelectReportListCount");
		
	}
	
	public ArrayList<Board> aSelectReportList(SqlSessionTemplate sqlSession, PageInfo pi){
		
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("boardMapper.aSelectReportList", null, rowBounds);
		
	}
	
	public Board selectReport(SqlSessionTemplate sqlSession, int rno) {
		
		return sqlSession.selectOne("boardMapper.selectReport", rno);
		
	}
	
	
	public int reportDelete(SqlSessionTemplate sqlSession, int ino) {
		
		return sqlSession.update("boardMapper.reportDelete", ino);
		
	}
	
	public int yellowCardPlus(SqlSessionTemplate sqlSession, Board b) {
		
		return sqlSession.update("boardMapper.yellowCardPlus", b);
		
	}
	
	// ------------------- 관리자 후기관리 ----------------------
	
	public int aReplyCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("boardMapper.aReplyCount");
		
	}
	
	public ArrayList<Board> aReplyList(SqlSessionTemplate sqlSession, PageInfo pi){
		
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("boardMapper.aReplyList", null, rowBounds);
		
	}
	
	public Board aReplyDetail(SqlSessionTemplate sqlSession, int reNo) {
		
		return sqlSession.selectOne("boardMapper.aReplyDetail", reNo);
		
	}
	
	
	
	//------------ 파트너 공지사항 -----------------------------------------
	
	public int pSelectNoticeListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("boardMapper.pSelectNoticeListCount");
	}

	public ArrayList<Board> pSelectNoticeList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("boardMapper.pSelectNoticeList", null, rowBounds);
	}

	public Board pSelectNoticeDetail(SqlSessionTemplate sqlSession, int noNo) {
		return sqlSession.selectOne("boardMapper.pSelectNoticeDetail", noNo);
	}

	public int pNoticeIncreaseCount(SqlSessionTemplate sqlSession, int noNo) {
		return sqlSession.update("boardMapper.pNoticeIncreaseCount", noNo);
	}
	
	
	// ---------------------------------- 사용자 FAQ --------------------------------------------------------------------------
	
	public ArrayList<Board> selectFaqList(SqlSessionTemplate sqlSession, String faqCategory){
		System.out.println("faqCategory : " + faqCategory);
		return (ArrayList)sqlSession.selectList("boardMapper.selectFaqList", faqCategory);
	}
	
	
	// ---------------------------------- 파트너 리뷰 ----------------------------------
	
	// 답글전 리뷰 수 조회
	public int selectReviewCount1(SqlSessionTemplate sqlSession, int userNo) {
		return sqlSession.selectOne("boardMapper.selectReviewCount1", userNo);
	}
	
	// 답글후 리뷰 수 조회
	public int selectReviewCount2(SqlSessionTemplate sqlSession, int userNo) {
		return sqlSession.selectOne("boardMapper.selectReviewCount2", userNo);
	}
	// 답글전 리뷰 리스트  조회용
	public ArrayList<Board> reviewList1(SqlSessionTemplate sqlSession, int userNo,  PageInfo noReplyPi) {
		int offset = (noReplyPi.getCurrentPage() -1) * noReplyPi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, noReplyPi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("boardMapper.reviewList1", userNo, rowBounds);
	}
	// 답글후 리뷰 리스트  조회용
	public ArrayList<Board> reviewList2(SqlSessionTemplate sqlSession, int userNo,  PageInfo responsePi) {
		int offset = (responsePi.getCurrentPage() -1) * responsePi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, responsePi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("boardMapper.reviewList2", userNo, rowBounds);
	}
	
	public Board selectReview(SqlSessionTemplate sqlSession,int reNo) {
		return sqlSession.selectOne("boardMapper.selectReview", reNo);
	}
	
	public int insertReply(SqlSessionTemplate sqlSession, Board b) {
		return sqlSession.update("boardMapper.insertReply", b);
	}
	/*
	// 숙소별 ReviewList 조회
	public ArrayList<Board> selectReviewList(SqlSessionTemplate sqlSession, int roNo){
		return (ArrayList)sqlSession.selectList("boardMapper.reviewListPerRoom", roNo);
	}
	*/
	// 숙소별 Review 개수 조회
	public int reviewListCount(SqlSessionTemplate sqlSession, int roNo){
		return (sqlSession.selectOne("boardMapper.reviewListCount", roNo));
	}
	
	// 마이페이지
	public ArrayList<WishList> selectwishList(SqlSessionTemplate sqlSession, Member m){
		return (ArrayList)sqlSession.selectList("boardMapper.selectwishList", m);
	}
	
	public ArrayList<Board> selectInquiryList(SqlSessionTemplate sqlSession, Member m) {
		return (ArrayList)sqlSession.selectList("boardMapper.selectInquiryList", m);
	}
	
public Board selectInquiryDt(SqlSessionTemplate sqlSession, int inNo) {
		
		return sqlSession.selectOne("boardMapper.selectInquiryDt", inNo);
		
	}
	
	
	
	
	
	
	
	
	
}
