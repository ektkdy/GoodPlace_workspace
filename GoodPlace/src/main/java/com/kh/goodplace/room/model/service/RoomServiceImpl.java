package com.kh.goodplace.room.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	public int selectListCount() {
		
		return rDao.selectListCount(sqlSession);
	}

	@Override
	public ArrayList<Room> selectRoomsList(PageInfo pi) {
		return rDao.selectRoomsList(sqlSession, pi);
	}

	@Override
	public int insertRoom(Room r) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Room selectBoard(int rno) {
		// TODO Auto-generated method stub
		return null;
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
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updatePower(Room r) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deletePower(int pno) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<Room> selectPowerRoomList() {
		// TODO Auto-generated method stub
		return null;
	}
	// --------- 파워관리 끝 --------------------------
	
	
	
	
}
