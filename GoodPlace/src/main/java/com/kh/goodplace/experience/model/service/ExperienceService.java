package com.kh.goodplace.experience.model.service;

import java.util.ArrayList;

import com.kh.goodplace.board.model.vo.Board;
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
	ArrayList<Experience> selectExp(int exNo);
	
	// 4. 체험 수정폼에서 내용 조회용 서비스
	// 4_1. 체험객체(썸네일포함 모든 컬럼) 조회용 서비스
	Experience selectExpOne(int exNo);
	
	// 4_2. 체험번호에 해당하는 상세사진 조회용 서비스
	ArrayList<Attachment> selectAt(int exNo);
	
	// 5. 체험 수정용 서비스
	// 5_1. 변경된 내용으로 체험객체 업데이트
	int updateExp(Experience e);
	
	// 5_2. 변경된 내용으로 상세사진 업데이트
	int updateAt(Attachment at);
	
	// 6. 승인거절된 체험객체 업데이트(상세사진은 5_2이용하여 업데이트)
	int updateReExp(Experience e);
	
	// 7. 체험 휴면용 서비스
	int restExp(int exNo);
	
	// 8. 체험 삭제용 서비스
	int deleteExp(int exNo);
	
	// 9. 체험 휴면해제용 서비스
	int endRestExp(int exNo);
	
	
	
	
	
	
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


	//--------------[예약관리]---------------
	//예약목록 조회용 서비스
	int selectRvExpListCount(int usNo);
	//리스트 카운트 예약 확정
	int selectRvExpConfirmListCount(int usNo);
	//리스트 카운트 예약 취소
	int selectRvExpCancelListCount(int usNo);
	//리스트 기본 
	ArrayList<Experience> selectRvExpList(PageInfo pi, int usNo);
	
	//예약확정 리스트
	ArrayList<Experience> selectRvExpConfirmList(PageInfo pi, int usNo);
	
	//예약확취소 리스트
	ArrayList<Experience> selectRvExpCancelList(PageInfo pi, int usNo);
	
	//예약 내역 상세페이지
	Experience reservationExpDetailView(int epno);
	//4. 공지사항 검색 총갯수 조회용
	int expSearchCount(Experience e);
	
	//5. 공지사항 검색 조회용
	ArrayList<Experience> expSearchList(PageInfo pi, Experience e);
	
	//------------[체험조회 시작]------------
	ArrayList<Experience> selectExpListUser(Experience exp);
	
	//------------[체험조회 끝]------------

}
