package com.kh.goodplace.room.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.goodplace.common.model.vo.Attachment;
import com.kh.goodplace.common.model.vo.PageInfo;
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
	public int deleteRoom(int rno) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateRoom(Room r) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int restRoom(int rno) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int selectRoomList(int roNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int payPower(int roNo) {
		// TODO Auto-generated method stub
		return 0;
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

	
	

	
	
	
	
}
