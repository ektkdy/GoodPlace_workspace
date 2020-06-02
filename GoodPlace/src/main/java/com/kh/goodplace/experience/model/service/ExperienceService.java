package com.kh.goodplace.experience.model.service;

import java.util.ArrayList;

import com.kh.goodplace.common.model.vo.PageInfo;
import com.kh.goodplace.experience.model.vo.Experience;

public interface ExperienceService {
	
	//------------[체험관리]------------
	
	// 1. 전체 체험목록 조회용 서비스
	// 1_1. 전체 체험 갯수 조회용 서비스 
	int selectListExpCount();
	
	// 1_2. 요청한 페이지에 보여질 체험리스트 조회용 서비스
	ArrayList<Experience> selectExpList(PageInfo pi);
	
	// 2. 체험 등록용 서비스
	int insertExp();
	
	// 3. 체험 상세조회용 서비스 
	Experience selectExp(int exNo);
	
	// 4. 체험 수정용 서비스
	int updateExp(int exNo);
	
	// 5. 체험 휴면용 서비스
	int restExp(int exNo);
	
	// 6. 체험 삭제용 서비스
	int deleteExp(int exNo);
	
	// 7. 체험 반려건 재등록 요청 서비스
	int updateReExp(int exNo);
	
	//------------[정산관리]------------
	
	// 8. 정산내역 목록 조회용 서비스
	// 8_1. 전체 정산목록 조회용 서비스
	
	// 8_2. 요청한 페이지에 보여질 정산리스트 조회용 서비스
	
	//------------[메세지관리]------------
	// 9. 메세지 목록 조회용 서비스
	// 9_1. 전체 메세지목록 조회용 서비스
	
	// 9_2. 요청한 페이지에 보여질 메세지 리스트 조회용 서비스
	
	// 9_3. 메세지 상세조회용 서비스
	
	
	//------------[계정관리]------------
	// 10. 계정정보 서비스
	// 10_1. 계정정보 조회용 서비스
	
	
	// 10_2. 계정정보 수정용 서비스
	
	
	//------------[공지사항]------------
	// 11. 공지사항 서비스
	// 11_1. 공지사항 전체 목록 조회용 서비스
	
	// 11_2. 요청한 페이지에 보여질 공지사항 리스트 조회용 서비스
	
	// 11_3. 공지사항 상세조회용 서비스
	
	

}
