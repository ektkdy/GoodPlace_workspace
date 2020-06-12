package com.kh.goodplace.messages.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.goodplace.messages.model.dao.ChatDao;
import com.kh.goodplace.messages.model.vo.ChatRoom;
import com.kh.goodplace.messages.model.vo.Message;

@Service("cService")
public class ChatServiceImpl implements ChatService {
	@Autowired // DI
	private ChatDao cDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;


	@Override
	public ArrayList<ChatRoom> aSelectMessagesList() {
		return cDao.aSelectMessagesList(sqlSession);
	}


	@Override
	public ArrayList<Message> selectMessage(int msn) {
		return cDao.selectMessage(sqlSession, msn);
	}


	@Override
	public ArrayList<ChatRoom> pSelectMessagesList() {
		return cDao.pSelectMessagesList(sqlSession);
	}


	@Override
	public ArrayList<Message> selectpMessage(int pmsn) {
		return cDao.selectpMessage(sqlSession, pmsn);
	}


	@Override
	public ChatRoom selectRoomChat(ChatRoom cr) {
		return cDao.selectRoomChat(sqlSession, cr);
	}
	
	
}
