package com.kh.goodplace.room.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.goodplace.board.model.vo.Board;
import com.kh.goodplace.common.model.vo.Attachment;
import com.kh.goodplace.common.model.vo.PageInfo;
import com.kh.goodplace.common.model.vo.Power;
import com.kh.goodplace.member.model.vo.Member;
import com.kh.goodplace.room.model.dao.RoomDao;
import com.kh.goodplace.room.model.vo.Room;

@Service("rService")
public class RoomServiceImpl implements RoomService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private RoomDao rDao;

	@Override
	public int selectListCount(int userNo) {
		
		return rDao.selectListCount(sqlSession, userNo);
	}

	@Override
	public ArrayList<Room> selectRoomsList(PageInfo pi, int userNo) {
		
		return rDao.selectRoomsList(sqlSession, pi, userNo);
	}

	@Override
	public int insertRoom(Room r) {
		return rDao.insertRoom(sqlSession, r);
	}

	@Override
	public int selectRono() {
		return rDao.selectRono(sqlSession);
	}

	@Override
	public int insertAttachment(Attachment at) {
		return rDao.insertAttachment(sqlSession, at);
	}

	@Override
	public Room selectRoom(int rno) {
		return rDao.selectRoom(sqlSession, rno);
	}
	
	@Override
	public ArrayList<Attachment> selectAt(int roNo) {
		return rDao.selectAt(sqlSession, roNo);
	}

	@Override
	public int updateAt(Attachment at) {
		return rDao.updateAt(sqlSession, at);
	}

	@Override
	public int updateReRoom(int roNo) {
		return rDao.updateReRoom(sqlSession, roNo);
	}

	@Override
	public int endRestRoom(int roNo) {
		return rDao.endRestRoom(sqlSession, roNo);
	}

	@Override
	public int deleteRoom(int roNo) {
		return rDao.deleteRoom(sqlSession, roNo);
	}

	@Override
	public int updateRoom(Room r) {
		return rDao.updateRoom(sqlSession, r);
	}

	@Override
	public int restRoom(int roNo) {
		return rDao.restRoom(sqlSession, roNo);
	}
	
	@Override
	public int selectRoomOkeyListCount(int usNo) {
		return rDao.selectRoomOkeyListCount(sqlSession, usNo);
	}

	@Override
	public ArrayList<Room> selectRoomOkeyList(PageInfo pi,int usNo) {
		return rDao.selectRoomsOkayList(sqlSession, pi, usNo);
	}
	
	@Override
	public int updateRoomPower(Room r) {
		return rDao.updateRoomPower(sqlSession, r);
	}

	
	// --------- 파워관리 시작 --------------------------
	@Override
	public ArrayList<Room> selectPowerList() {
		
		return rDao.selectPowerList(sqlSession);
	}

	@Override
	public int insertPower(Room r) {
		return rDao.insertPower(sqlSession, r);
	}

	@Override
	public int updatePower(Room r) {

		return rDao.updatePower(sqlSession, r);
		
	}
	
	@Override
	public Room selectPower(int pno) {
		
		return rDao.selectPower(sqlSession, pno);
		
	}

	@Override
	public int deletePower(int pno) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int aSelectPowerListCount() {
		return rDao.aSelectPowerListCount(sqlSession);
	}
	
	@Override
	public ArrayList<Room> selectPowerRoomList(PageInfo pi) {
		return rDao.selectPowerRoomList(sqlSession, pi);
	}
	// --------- 파워관리 끝 --------------------------
	// --------- 숙소관리 시작 --------------------------

	@Override
	public int selectListRoomsWaitCount() {
		return rDao.selectListRoomsWaitCount(sqlSession);
	}

	@Override
	public ArrayList<Room> selectRoomsWaitList(PageInfo pi) {
		return rDao.selectRoomsWaitList(sqlSession, pi);
	}

	@Override
	public int selectListRoomsOkayCount() {
		return rDao.selectListRoomsOkayCount(sqlSession);
	}

	@Override
	public ArrayList<Room> selectRoomsOkayList(PageInfo pi) {
		return rDao.selectRoomsOkayList(sqlSession, pi);
	}

	@Override
	public Room selectRoomWaitDetail(int rno) {
		return rDao.selectRoomWaitDetail(sqlSession, rno);
	}
	
	@Override
	public int updateOkay(int rno) {
		return rDao.updateOkay(sqlSession, rno);
	}

	@Override
	public int updateReject(Room r) {
		return rDao.updateReject(sqlSession, r);
	}
	
	// --------- 숙소관리 끝 --------------------------
	
	// --------- 숙소조회 시작 -------------------------
	
	@Override
	public ArrayList<Room> searchRoom(Room room) {
		return rDao.searchRoom(sqlSession, room);
	}

	@Override
	public Room roomDetail(int roNo) {
		return rDao.roomDetail(sqlSession, roNo);
	}

	@Override
	public ArrayList<Attachment> getDetailImages(int roNo) {
		return rDao.getDetailImages(sqlSession, roNo);
	}

		@Override
	public Member getPartner(int roNo) {
		return  rDao.getPartner(sqlSession, roNo);
	}
	
	@Override
	public ArrayList<Board> getReview(int roNo) {
		return rDao.getReview(sqlSession, roNo);
	}

	// --------- 숙소조회 끝 -------------------------
	
	//--------------- 예약관리 시작 -------------------
	
	@Override
	public int selectRvRoomListCount(int usNo) {
		return rDao.selectRvRoomListCount(sqlSession, usNo);
	}
	//예약확정
	@Override
	public int 	selectRvRoomConfirmListCount(int usNo) {
		return rDao.selectRvRoomConfirmListCount(sqlSession, usNo);
	}
	//예약취소
	@Override
	public int 	selectRvRoomCancelListCount(int usNo) {
		return rDao.selectRvRoomCancelListCount(sqlSession, usNo);
	}
	
	@Override
	public ArrayList<Room> selectRvRoomList(PageInfo pi, int usNo) {
		
		return rDao.selectRvRoomList(sqlSession, pi, usNo);
	}
	//예약확정
	@Override
	public ArrayList<Room> selectRvRoomConfirmList(PageInfo pi, int usNo){
		
		return rDao.selectRvRoomConfirmList(sqlSession, pi, usNo);
	}
	//예약취소
	@Override
	public ArrayList<Room> selectRvRoomCancelList(PageInfo pi, int usNo){
		
		return rDao.selectRvRoomCancelList(sqlSession, pi, usNo);
	}

	
	
	
}
