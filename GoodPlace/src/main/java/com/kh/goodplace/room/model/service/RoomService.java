package com.kh.goodplace.room.model.service;

import java.util.ArrayList;

import com.kh.goodplace.common.model.vo.PageInfo;
import com.kh.goodplace.room.model.vo.Room;

public interface RoomService {
	
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
	

}
