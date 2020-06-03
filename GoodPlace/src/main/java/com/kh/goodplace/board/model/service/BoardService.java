package com.kh.goodplace.board.model.service;

import java.util.ArrayList;

import com.kh.goodplace.board.model.vo.Board;
import com.kh.goodplace.common.model.vo.PageInfo;

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

	// 1. FAQ 모든 카테고리 조회용 서비스 - 진아
	String selectFaqCategory();
	
	// 2. FAQ 카테고리별 제목 조회용 서비스 - 진아
	ArrayList<String> selectFaqList(String faqCategory);
	
	// 3. FAQ 카테고리별 : 제목, 내용표시용 서비스 - 진아
	ArrayList<Board> selectFaqContent(String faqCategory);
	
}
