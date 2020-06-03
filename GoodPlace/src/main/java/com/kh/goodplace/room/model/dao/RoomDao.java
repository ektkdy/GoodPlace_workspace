package com.kh.goodplace.room.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.goodplace.common.model.vo.PageInfo;
import com.kh.goodplace.room.model.vo.Room;

@Repository("rDao")
public class RoomDao {
	
	public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("roomMapper.selectListCount");
	}
	
	public ArrayList<Room> selectRoomsList(SqlSessionTemplate sqlSession, PageInfo pi){
		int offset =(pi.getCurrentPage()-1) * pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("roomMapper.selectRoomsList", null, rowBounds);
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	// --------- 파워관리 시작 ----------------
	
	public ArrayList<Room> selectPowerList(SqlSessionTemplate sqlSession){
		
		return (ArrayList)sqlSession.selectList("roomMapper.selectPowerList");
		
	}
	
	// --------- 파워관리 끝 -----------------
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
