package com.kh.goodplace.room.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.goodplace.board.model.vo.Board;
import com.kh.goodplace.common.model.vo.Attachment;
import com.kh.goodplace.common.model.vo.PageInfo;
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
	
	
	// --------- 숙소관리 시작 -----------------
	
	// --------- 숙소검색 시작 -----------------
	public ArrayList<Room> searchRoom(SqlSessionTemplate sqlSession, Room room){
		return (ArrayList)sqlSession.selectList("roomMapper.selectRoomSearch", room); // 미완성
	}
	
	
	
	
	
	
	
	
	
	
	
	

}
