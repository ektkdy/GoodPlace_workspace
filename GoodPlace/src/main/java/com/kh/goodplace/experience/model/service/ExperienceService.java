package com.kh.goodplace.experience.model.service;

import java.util.ArrayList;

import com.kh.goodplace.common.model.vo.Attachment;
import com.kh.goodplace.common.model.vo.PageInfo;
import com.kh.goodplace.experience.model.vo.Experience;

public interface ExperienceService {
	
	// 1. 전체 체험목록 조회용 서비스
	// 1_1. 전체 체험 갯수 조회용 서비스 
	int selectExpListCount(int usNo);
	
	// 1_2. 요청한 페이지에 보여질 체험리스트 조회용 서비스
	ArrayList<Experience> selectExpList(PageInfo pi, int usNo);
	
	// 2_1. 체험 등록용 서비스(체험정보+썸네일)
	int insertExp(Experience e);
	
	// 2_3. 체험 등록용 서비스(상세사진용)
	int insertAttachment(Attachment at);
	
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

	


	
	
}
