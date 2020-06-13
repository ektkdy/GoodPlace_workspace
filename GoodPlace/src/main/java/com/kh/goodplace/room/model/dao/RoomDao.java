package com.kh.goodplace.room.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.goodplace.board.model.vo.Board;
import com.kh.goodplace.common.model.vo.Attachment;
import com.kh.goodplace.common.model.vo.PageInfo;
import com.kh.goodplace.common.model.vo.Power;
import com.kh.goodplace.member.model.vo.Member;
import com.kh.goodplace.room.model.vo.Room;

@Repository("rDao")
public class RoomDao {
	
	public int selectListCount(SqlSessionTemplate sqlSession, int userNo) {
		return sqlSession.selectOne("roomMapper.selectListCount", userNo);
	}
	
	public ArrayList<Room> selectRoomsList(SqlSessionTemplate sqlSession, PageInfo pi, int userNo){
		int offset =(pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("roomMapper.selectRoomsList", userNo, rowBounds);
	}
	
	public int insertRoom(SqlSessionTemplate sqlSession, Room r) {
		return sqlSession.insert("roomMapper.insertRoom", r);
	}
	
	public int insertAttachment(SqlSessionTemplate sqlSession, Attachment at) {
		return sqlSession.insert("roomMapper.insertAttachment", at);
	}
	
	public int selectRono(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("roomMapper.selectRono");
	}
	
	public Room selectRoom(SqlSessionTemplate sqlSession, int rno) {
		return sqlSession.selectOne("roomMapper.selectRoom", rno);
	}
	
	public ArrayList<Attachment> selectAt(SqlSessionTemplate sqlSession, int roNo) {
		return (ArrayList)sqlSession.selectList("roomMapper.selectAt", roNo);
	}

	public int updateAt(SqlSessionTemplate sqlSession, Attachment at) {
		return sqlSession.update("roomMapper.updateAt", at);
	}

	public int updateReRoom(SqlSessionTemplate sqlSession, Room r) {
		return sqlSession.update("roomMapper.updateReRoom", r);
	}

	public int endRestRoom(SqlSessionTemplate sqlSession, int roNo) {
		return sqlSession.update("roomMapper.endRestRoom", roNo);
	}

	public int deleteRoom(SqlSessionTemplate sqlSession, int roNo) {
		return sqlSession.update("roomMapper.deleteRoom", roNo);
	}

	public int updateRoom(SqlSessionTemplate sqlSession, Room r) {
		return sqlSession.update("roomMapper.updateRoom", r);
	}

	public int restRoom(SqlSessionTemplate sqlSession, int roNo) {
		return sqlSession.update("roomMapper.restRoom", roNo);
	}
	
	public int selectRoomOkeyListCount(SqlSessionTemplate sqlSession, int usNo) {
		return sqlSession.selectOne("roomMapper.selectRoomOkeyListCount", usNo);
	}
	
	public ArrayList<Room> selectRoomsOkayList(SqlSessionTemplate sqlSession, PageInfo pi, int usNo) {
		int offset =(pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("roomMapper.selectOkeyList", usNo, rowBounds);
	}


	public int updateRoomPower(SqlSessionTemplate sqlSession, Room r) {
		//System.out.println(r);
		return sqlSession.update("roomMapper.updateRoomPower", r);
	}
	
	public int deleteAt(SqlSessionTemplate sqlSession, String deList) {
		return sqlSession.delete("roomMapper.deleteAt", deList);
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	// --------- 파워관리 시작 ----------------
	
	public ArrayList<Room> selectPowerList(SqlSessionTemplate sqlSession){
		
		return (ArrayList)sqlSession.selectList("roomMapper.selectPowerList");
		
	}
	
	
	public int insertPower(SqlSessionTemplate sqlSession, Room r) {
		
		return sqlSession.insert("roomMapper.insertPower", r);
		
	}
	
	public int updatePower(SqlSessionTemplate sqlSession, Room r) {
		
		return sqlSession.update("roomMapper.updatePower", r);
		
	}
	
	public Room selectPower(SqlSessionTemplate sqlSession, int pno) {
		
		return sqlSession.selectOne("roomMapper.selectPower", pno);
		
	}
	
	
	public int aSelectPowerListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("roomMapper.aSelectPowerListCount");
	}
	
	
	public ArrayList<Room> selectPowerRoomList(SqlSessionTemplate sqlSession, PageInfo pi){
		
		int offset =(pi.getCurrentPage()-1) * pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("roomMapper.selectPowerRoomList", null, rowBounds);
		
	
	
	}
	
	
	
	// --------- 파워관리 끝 -----------------
	// --------- 숙소관리 시작 -----------------
	
	public int selectListRoomsWaitCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("roomMapper.selectListRoomsWaitCount");
		
	}
	
	public ArrayList<Room> selectRoomsWaitList(SqlSessionTemplate sqlSession, PageInfo pi){
		
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("roomMapper.selectRoomsWaitList", null, rowBounds);
		
	}
	
	public int selectListRoomsOkayCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("roomMapper.selectListRoomsOkayCount");
		
	}
	
	public ArrayList<Room> selectRoomsOkayList(SqlSessionTemplate sqlSession, PageInfo pi){
		
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("roomMapper.selectRoomsOkayList", null, rowBounds);
		
	}
	
	public Room selectRoomWaitDetail(SqlSessionTemplate sqlSession, int rno) {
		
		return sqlSession.selectOne("roomMapper.selectRoomWaitDetail", rno);
		
	}
	
	public int updateOkay(SqlSessionTemplate sqlSession, int rno) {
		
		return sqlSession.update("roomMapper.updateOkay", rno);
		
	}
	
	public int updateReject(SqlSessionTemplate sqlSession, Room r) {
		
		return sqlSession.update("roomMapper.updateReject", r);
		
	}
	
	public int roomSearchCount(SqlSessionTemplate sqlSession, Room r) {
		
		return sqlSession.selectOne("roomMapper.roomSearchCount", r);
		
	}
	
	public ArrayList<Room> roomSearchList(SqlSessionTemplate sqlSession, PageInfo pi, Room r){
		
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("roomMapper.roomSearchList", r, rowBounds);
		
	}
	
	
	
	// --------- 숙소관리 시작 -----------------
	
	// --------- 숙소조회 시작 -----------------
	
	public ArrayList<Room> searchRoom(SqlSessionTemplate sqlSession, Room room){
		return (ArrayList)sqlSession.selectList("roomMapper.selectRoomSearch", room);
	}

	public Room roomDetail(SqlSessionTemplate sqlSession, int roNo) {
		return sqlSession.selectOne("roomMapper.selectRoom", roNo);
	}

		public ArrayList<Attachment> getDetailImages(SqlSessionTemplate sqlSession, int roNo){
		return (ArrayList)sqlSession.selectList("roomMapper.selectDetailImages", roNo);
	}
	
	public Member getPartner(SqlSessionTemplate sqlSession, int roNo){
		return sqlSession.selectOne("memberMapper.selectPartner", roNo);
	}

	
	public ArrayList<Board> getReview(SqlSessionTemplate sqlSession, int roNo){
		return (ArrayList)sqlSession.selectList("roomMapper.selectReviewList", roNo);
	}
	
	// --------- 숙소조회 끝 -----------------
	

	// -------------------------------- 예약관리 시작 ---------------------------------------
	
	public int selectRvRoomListCount(SqlSessionTemplate sqlSession, int userNo) {
		return sqlSession.selectOne("roomMapper.selectRvRoomListCount", userNo);
	}
	
	//확정 후
	public int selectRvRoomConfirmListCount(SqlSessionTemplate sqlSession, int userNo) {
		return sqlSession.selectOne("roomMapper.selectRvRoomConfirmListCount", userNo);
	}
	
	//취소
	public int selectRvRoomCancelListCount(SqlSessionTemplate sqlSession, int userNo) {
		return sqlSession.selectOne("roomMapper.selectRvRoomCancelListCount", userNo);
	}
	
	public ArrayList<Room> selectRvRoomList(SqlSessionTemplate sqlSession, PageInfo pi, int userNo){
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return  (ArrayList)sqlSession.selectList("roomMapper.selectRvRoomList", userNo, rowBounds);
	}

	//확정
	public ArrayList<Room> selectRvRoomConfirmList(SqlSessionTemplate sqlSession, PageInfo pi, int userNo){
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return  (ArrayList)sqlSession.selectList("roomMapper.selectRvRoomConfirmList", userNo, rowBounds);
	}

	//취소
	public ArrayList<Room> selectRvRoomCancelList(SqlSessionTemplate sqlSession, PageInfo pi, int userNo){
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return  (ArrayList)sqlSession.selectList("roomMapper.selectRvRoomCancelList", userNo, rowBounds);
	}

	//상세조회
	public Room reservationRoomDetailView(SqlSessionTemplate sqlSession, int rpNo) {
		
		return sqlSession.selectOne("roomMapper.reservationRoomDetailView", rpNo);
	}
	
	//예약확정
	public int roomConfirm(SqlSessionTemplate sqlSession, int rpNo) {
		
		return sqlSession.update("roomMapper.roomConfirm", rpNo);
	}
	
	//예약취소
		public int roomCancel(SqlSessionTemplate sqlSession, int rpNo) {
			
			return sqlSession.update("roomMapper.roomCancel", rpNo);
		}

		
	
	

}
