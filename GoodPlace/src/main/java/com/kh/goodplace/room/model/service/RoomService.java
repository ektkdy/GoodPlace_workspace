package com.kh.goodplace.room.model.service;

import java.util.ArrayList;

import com.kh.goodplace.board.model.vo.Board;
import com.kh.goodplace.common.model.vo.Attachment;
import com.kh.goodplace.common.model.vo.PageInfo;
import com.kh.goodplace.member.model.vo.Member;
import com.kh.goodplace.room.model.vo.Room;

public interface RoomService {
	
	//------------[대시보드]------------
	
	
	//------------[숙소관리]------------
	
	// 1.숙소리스트 조회용 서비스
	// 1_1. 숙소 총 갯수 조회용 서비스
	int selectListCount(int userNo);
	
	// 1_2.요청한 페이지에 보여질 숙소 리스트 조회용 서비스
	ArrayList<Room> selectRoomsList(PageInfo pi, int userNo);
	
	// 2. 숙소 등록용 서비스
	// 2_1.숙소등록 서비스(상태==2)
	int insertRoom(Room r);
	
	// 2_2. 숙소 번호 가져오는 서비스(CURRVAL안되서..)
	int selectRono();
	
	// 2-3. 숙소 상세이미지 등록 서비스
	int insertAttachment(Attachment at);
	
	// 3. 숙소 상세조회용 서비스(정보+썸네일)
	Room selectRoom(int rno);
	
	// 4. 숙소번호에 해당하는 상세사진 조회용 서비스(숙소객체+썸네일은 3번 이용)
	ArrayList<Attachment> selectAt(int roNo);
	
	// 5. 숙소 수정용 서비스
	// 5_1. 숙소객체(정보+썸네일) 수정용 서비스
	int updateRoom(Room r);
		
	// 5_2. 숙소객체 상세사진 수정용 서비스 
	int updateAt(Attachment at);
	
	// 6. 승인거절된 숙소객체 수정용 서비스(상세사진은 5_2이용하여 업데이트)
	int updateReRoom(int roNo);
	
	// 7.숙소 삭제용 서비스(상태==5)
	int deleteRoom(int rno);
	
	// 8. 숙소 휴면용 서비스
	int restRoom(int rno);
	
	// 9. 숙소 휴면해제용 서비스				
	int endRestRoom(int roNo);
						
	// 10. 운영중인 숙소 조회용 서비스 (파워등록용)
	// 10_1. 운영중인 숙소 전체 갯수 조회
	int selectRoomOkeyListCount(int usNo);
	// 10_2. 해당 페이지에 보여질 운영중인 숙소 조회
	ArrayList<Room> selectRoomOkeyList(PageInfo pi,int usNo);
	
	// 11. 파워 신청 및 결제용 서비스 (파워등록용) : 결제완료후 db의 숙소정보 updat
	int updateRoomPower(Room r);
	
	
	
	//------------[예약관리]------------    
	//9_1. 진행중인 예약목록 조회용 서비스
	int selectRvRoomListCount(int usNo);
	
	//리스트 카운트 예약 확정
	int selectRvRoomConfirmListCount(int usNo);
	
	//리스트 카운트 예약 취소
	int selectRvRoomCancelListCount(int usNo);
	
	//리스트 기본 
	ArrayList<Room> selectRvRoomList(PageInfo pi, int usNo);
	
	//예약확정 리스트
	ArrayList<Room> selectRvRoomConfirmList(PageInfo pi, int usNo);
	
	//예약확취소 리스트
	ArrayList<Room> selectRvRoomCancelList(PageInfo pi, int usNo);
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
	
	
	//------------[숙소조회]------------
	
	//1. 메뉴바에서 검색한 조건에 해당하는 숙소리스트 조회용 서비스 - 진아
	ArrayList<Room> searchRoom(Room room);
	
	//2. 숙소리스트에서 특정 숙소상세페이지 조회용 서비스 - 진아
	Room roomDetail(int roNo);
	
	//3. 숙소 필드에 상세이미지 파일명 저장용 서비스 - 진아
	ArrayList<Attachment> getDetailImages(int roNo);
	
	//4. 파트너 정보 조회용 서비스 - 진아 
	Member getPartner(int roNo);
	
	//5. 숙소별 리뷰 조회용 서비스 - 진아
	ArrayList<Board> getReview(int roNo);
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
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
	
	//5_1. 숙소 총 갯수 조회용 서비스
	int aSelectPowerListCount();
	
	//5_2. 파워등록 된 리스트 조회용 서비스
	ArrayList<Room> selectPowerRoomList(PageInfo pi);
	
	//------------[숙소관리]------------
	//1.숙소 승인대기 조회용 서비스
	//1_1. 숙소 총 갯수 조회용 서비스
	int selectListRoomsWaitCount();
	
	//1_2.요청한 페이지에 보여질 숙소 승인대기 리스트 조회용 서비스
	ArrayList<Room> selectRoomsWaitList(PageInfo pi);
	
	
	//2.숙소 승인완료 조회용 서비스
	//2_1. 숙소 총 갯수 조회용 서비스
	int selectListRoomsOkayCount();
	
	//2_2.요청한 페이지에 보여질 숙소 승인완료 리스트 조회용 서비스
	ArrayList<Room> selectRoomsOkayList(PageInfo pi);
	
	// 3_1. 해당 게시글 조회용 서비스
	Room selectRoomWaitDetail(int rno);
	
	// 3_2.게시글 승인용 서비스-현영
	int updateOkay(int rno);
	
	// 3_3.게시글 거절용 서비스-현영
	int updateReject(Room r);

	//4. 공지사항 검색 총갯수 조회용
	int roomSearchCount(Room r);
	
	//5. 공지사항 검색 조회용
	ArrayList<Room> roomSearchList(PageInfo pi, Room r);


	
	
	
	
	
	
	
	
	
	
	
	
}
