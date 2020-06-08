package com.kh.goodplace.experience.model.service;

import java.util.ArrayList;

import com.kh.goodplace.common.model.vo.Attachment;
import com.kh.goodplace.common.model.vo.PageInfo;
import com.kh.goodplace.experience.model.vo.Experience;
import com.kh.goodplace.room.model.vo.Room;

public interface ExperienceService {
	
	// 1. 전체 체험목록 조회용 서비스
	// 1_1. 전체 체험 갯수 조회용 서비스 
	int selectExpListCount(int usNo);
	
	// 1_2. 요청한 페이지에 보여질 체험리스트 조회용 서비스
	ArrayList<Experience> selectExpList(PageInfo pi, int usNo);
	
	// 2_1. 체험 등록용 서비스(체험정보+썸네일)
	int insertExp(Experience e);
	
	// 2_2. 체험 등록용 서비스(상세사진용)
	int insertAttachment(Attachment at);
	
	// 3. 체험 상세조회용 서비스 
	//Experience selectExp(int exNo);
	
	// 3. 체험 상세조회용 서비스 
	ArrayList<Experience> selectExp(int exNo);
	
	// 4_1. 체험 수정폼 요청용 서비스
	ArrayList<Experience> updateExpForm(int exNo);
	
	// 4_2. 승인 거절시 체험 수정폼 요청용 서비스
	ArrayList<Experience> updateReExpForm(int exNo);
	
	// 4_3. 체험수정용 서비스
	int updateExp(int exNo);
	
	// 4_4. 체험 반려건 재등록 요청 서비스
	int updateReExp(int exNo);
	
	// 5. 체험 휴면용 서비스
	int restExp(int exNo);
	
	// 6. 체험 삭제용 서비스
	int deleteExp(int exNo);
	
	

	
	
	
	
	
	
	
	//------------[체험관리]------------
	//1.체험 승인대기 조회용 서비스
	//1_1. 체험 총 갯수 조회용 서비스
	int selectListExpWaitCount();
	
	//1_2.요청한 페이지에 보여질 체험 승인대기 리스트 조회용 서비스
	ArrayList<Experience> selectExpWaitList(PageInfo pi);
	
	
	//2.체험 승인완료 조회용 서비스
	//2_1. 체험 총 갯수 조회용 서비스
	int selectListExpOkayCount();
	
	//2_2.요청한 페이지에 보여질 체험 승인완료 리스트 조회용 서비스
	ArrayList<Experience> selectExpOkayList(PageInfo pi);



	
	
}
