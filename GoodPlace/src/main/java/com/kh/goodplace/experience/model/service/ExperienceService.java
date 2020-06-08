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
	
	// 2_2. 체험 등록용 서비스(상세사진용)
	int insertAttachment(Attachment at);
	
	// 3. 체험 상세조회용 서비스 
	ArrayList<Experience> selectExp(int exNo);
	
	// [공통] 체험객체(썸네일포함 모든 컬럼) 조회용 서비스
	Experience selectExpOne(int exNo);
	
	// [공통] 체험번호에 해당하는 상세사진 조회용 서비스
	ArrayList<Attachment> selectAt(int exNo);
	
	// [공통] 변경된 내용으로 체험객체 업데이트
	int updateExp(Experience e);
	
	// [공통] 변경된 내용으로 상세사진 업데이트
	int updateAt(Attachment at);
	
	// 승인거절된 체험객체 업데이트
	int updateReExp(Experience e);
	
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

	// 3_1. 해당 게시글 조회용 서비스
	Experience selectExpmWaitDetail(int eno);
	
	// 3_2.게시글 승인용 서비스-현영
	int updateOkay(int eno);
	
	// 3_3.게시글 거절용 서비스-현영
	int updateReject(Experience e);


	
	
}
