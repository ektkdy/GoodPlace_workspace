package com.kh.goodplace.board.model.service;

import java.util.ArrayList;

import com.kh.goodplace.board.model.vo.Board;
import com.kh.goodplace.common.model.vo.PageInfo;
import com.kh.goodplace.common.model.vo.WishList;
import com.kh.goodplace.member.model.vo.Member;

public interface BoardService {
	
	// 1. 관리자 FAQ게시판 리스트 조회용 서비스-현영
	// 1_1. 관리자 FAQ게시판 총갯수 조회용 서비스
	int aSelectFaqListCount();
	
	// 1_2. 요청한 페이지에 보여질 게시글 리스트 조회용 서비스-현영
	ArrayList<Board> aSelectFaqList(PageInfo pi);
	
	// 2. FAQ게시판 작성용 서비스-현영
	int insertFaq(Board b);
	
	// 3. FAQ게시판 상세조회용 서비스-현영
	Board selectFaq(int fno);
	
	// 4.게시글 수정용 서비스-현영
	int faqUpdate(Board b);
	
	// 5. 게시글 삭제용 서비스-현영
	int faqDelete(int fno);
	
	//6. FAQ 검색 총갯수 조회용
	int faqSearchCount(Board b);
	
	//7. FAQ 검색 조회용
	ArrayList<Board> faqSearchList(PageInfo pi, Board b);
	
	//------------------------------------------------------
	
	// 1. 관리자 공지사항 게시판 리스트 조회용 서비스-현영
	// 1_1. 관리자 공지사항 게시판 총갯수 조회용 서비스
	int aSelectNoticeListCount();
	
	// 1_2. 요청한 페이지에 보여질 게시글 리스트 조회용 서비스-현영
	ArrayList<Board> aSelectNoticeList(PageInfo pi);
	
	// 2. 공지사항게시판 작성용 서비스-현영
	int insertNotice(Board b);
	
	// 3. 공지사항게시판 상세조회용 서비스-현영
	// 3_1. 해당 게시글 조회수 증가용 서비스
	int noticeIncreaseCount(int nno);
	// 3_2. 해당 게시글 조회용 서비스
	Board selectNotice(int nno);
	
	// 4.게시글 수정용 서비스-현영
	int noticeUpdate(Board b);
	
	// 5. 게시글 삭제용 서비스-현영
	int noticeDelete(int nno);
	
	//6. 공지사항 검색 총갯수 조회용
	int noticeSearchCount(Board b);
	
	//7. 공지사항 검색 조회용
	ArrayList<Board> noticeSearchList(PageInfo pi, Board b);
	
	//-----------------------------------------------------
	// 1. 사용자 1:1문의 등록 서비스
	
	int insertInq(Board b);
	//------------------------------------------------------
	// 1. 관리자 1:1문의 게시판 리스트 조회용 서비스-현영
	// 1_1. 관리자 공지사항 게시판 총갯수 조회용 서비스
	int aSelectInquiryListCount();
	
	// 1_2. 요청한 페이지에 보여질 게시글 리스트 조회용 서비스-현영
	ArrayList<Board> aSelectInquiryList(PageInfo pi);
	
	// 2. 1:1문의 단볍 작성용 서비스-현영
	int insertInquiry(Board b);
	
	// 3. 1:1문의 상세조회용 서비스-현영
	Board selectInquiry(int ino);
	
	// 4.게시글 수정용 서비스-현영
	int inquiryUpdate(Board b);
	
	//5. 1:1문의 검색 총갯수 조회용
	int inquirySearchCount(Board b);
	
	//6. 1:1문의 검색 조회용
	ArrayList<Board> inquirySearchList(PageInfo pi, Board b);
	
	//------------------------------------------------------
	// 1. 관리자 신고관리 게시판 리스트 조회용 서비스-현영
	// 1_1. 관리자 공지사항 게시판 총갯수 조회용 서비스
	int aSelectReportListCount();
	
	// 1_2. 요청한 페이지에 보여질 게시글 리스트 조회용 서비스-현영
	ArrayList<Board> aSelectReportList(PageInfo pi);
	
	// 2. 1:1문의 상세조회용 서비스-현영
	Board selectReport(int rno);
	
	// 3. 게시글 삭제용 서비스-현영
	int reportDelete(int ino);
	
	// 4. 신고당한사람 제제용 서비스-현영
	int yellowCardPlus(Board b);
	
	//------------------------------------------------------
	// 1. 관리자 후기관리 게시판 리스트 조회용 서비스-현영
	// 1_1. 관리자 후기관리 총갯수 조회용 서비스
	int aReplyCount();
	
	// 1_2. 요청한 페이지에 보여질 후기 리스트 조회용 서비스-현영
	ArrayList<Board> aReplyList(PageInfo pi);
	
	// 2. 1:1문의 상세조회용 서비스-현영
	Board aReplyDetail(int reNo);

	//------------------------------------------------------
	
	// 1_1.파트너 공지사항 전체 리스트 조회용 서비스 - 하정
	int pSelectNoticeListCount();
	
	// 1_2. 요청한 페이지에 보여질 공지사항 리스트 조회용 서비스 - 하정
	ArrayList<Board> pSelectNoticeList(PageInfo pi);
	
	// 2. 파트너 공지사항 상세 조회용 서비스 - 하정
	Board pSelectNoticeDetail(int noNo);

	// 3. 공지사항 조회수 1증가용 서비스 - 하정
	int pNoticeIncreaseCount(int noNo);
	
	
	// ------------------------------------------------------

	// 1. FAQ 카테고리별 제목 조회용 서비스 - 진아
	ArrayList<Board> selectFaqList(String faqCategory);
	
	// 2. 숙소별 REVIEW 리스트 조회 - 진아
	//ArrayList<Board> selectReviewList(int roNo);
	
	// 3. 숙소별  REVIEW 갯수 조회 - 진아
	int reviewListCount(int roNo);

	// ------------------------------------------------------ 
	
	//1-1.파트너  리뷰 (답글전) 리스트 조회용 서비스 - 기하
	int selectReviewCount1(int userNo);
	
	//1-1.파트너  리뷰 (답글후) 리스트 조회용 서비스 - 기하
	int selectReviewCount2(int userNo);
	
	//1-2.답글전 리뷰  조회용서비스 - 기하
	ArrayList<Board> reviewList1(PageInfo noReplyPi, int userNo);
	
	//1-2.답글후 리뷰  조회용서비스 - 기하
	ArrayList<Board> reviewList2(PageInfo responsePi, int userNo);
	
	//1-3.리뷰 상세조회용(리뷰작성전) - 기하
	Board selectReview(Board b);
	
	//2.리뷰 댓글 작성용서비스 - 기하
	int insertReply(Board b);
	
	// 1. 마이페이지에서 현재 로그인한 회원에 위시리스트정보를 가져옴
	public ArrayList<WishList> selectwishList(Member m);
	
	// 2. 마이페이지에서 1대1문의 리스트 정보 조회
	public ArrayList<Board> selectInquiryList(Member m);
	
	// 3. 마이페이지 1대1문의 내용 정보 조회
	Board selectInquiryDt(int inNo);
	
	
}
