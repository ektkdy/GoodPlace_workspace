package com.kh.goodplace.room.model.service;

import java.util.ArrayList;

import com.kh.goodplace.board.model.vo.Board;
import com.kh.goodplace.common.model.vo.PageInfo;
import com.kh.goodplace.room.model.vo.Room;

public interface RoomService {
	
	//------------[대시보드]------------
	
	
	//------------[숙소관리]------------
	
	//1.숙소리스트 조회용 서비스
	//1_1. 숙소 총 갯수 조회용 서비스
	int selectListCount();
	
	//1_2.요청한 페이지에 보여질 숙소 리스트 조회용 서비스
	ArrayList<Room> selectRoomsList(PageInfo pi);
	
	//2.숙소등록 서비스
	int insertRoom(Room r);
	
	//3.숙소 조회용 서비스
	Room selectBoard(int rno);
	
	//4.숙소 삭제용 서비스
	int deleteRoom(int rno);
	
	//5.숙소 수정용 서비스
	int updateRoom(Room r);
	
	//6.숙소 휴면용 서비스
	int restRoom(int rno);
	
	//7. 운영중인 숙소 조회용 서비스 (파워등록용)
	int selectRoomList(int roNo);
	
	//8. 파워 신청 및 결제용 서비스 (파워등록용)
	int payPower(int roNo);
	
	
	//------------[예약관리]------------    (여긴 페이징바 필요없을까?)
	//9_1. 진행중인 예약목록 조회용 서비스
	
	//9_2. 진행중인 예약 상세조회용 서비스
	
	
	//10_1. 확정된 예약목록 조회용 서비스
	
	//10_2. 확정된 예약 상세조회용 서비스
	
	
	//11. 취소된 예약목록 조회용 서비스
	
	
	
	//------------[일정관리]------------
	
	//12. 일정관리(달력) 조회용 서비스
	
	
	//------------[후기관리]------------
	
	//13. 답글전 후기 목록 조회용 서비스
	//13_1. 답글전 후기 총 갯수 조회용 서비스
	
	//13_2. 요청한 페이지에 보여질 답글전 후기 목록 조회용 서비스
	
	
	//13_3. 답글전 후기 상세조회용 서비스
	
	//14. 답글 후 후기 목록 조회용 서비스
	//14_1. 답글후 후기 총 갯수 조회용 서비스
	
	//14_2. 요청한 페이지에 보여질 답글후 후기 목록 조회용 서비스
	
	//14_3. 답글 후 후기 상세조회용 서비스
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	//------------[파워관리]------------
	// 1. 파워등록 리스트 조회용 서비스
	ArrayList<Room> selectPowerList();
	
	// 2. 파워등록 작성용 서비스
	int insertPower(Room r);
	
	// 3_1. 해당 게시글 조회용 서비스
	Room selectPower(int pno);
	
	// 3_2.게시글 수정용 서비스-현영
	int updatePower(Room r);
	
	// 4. 게시글 삭제용 서비스-현영
	int deletePower(int pno);
	
	// 5. 파워등록 된 리스트 조회용 서비스
	ArrayList<Room> selectPowerRoomList();
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
