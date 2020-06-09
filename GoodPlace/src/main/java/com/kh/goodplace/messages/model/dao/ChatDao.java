package com.kh.goodplace.messages.model.dao;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.goodplace.messages.model.vo.ChatRoom;
import com.kh.goodplace.messages.model.vo.Message;

@Repository("cDao")
public class ChatDao{
	
	@Inject
	private SqlSession session;

	
	
	public void createRoom(ChatRoom vo) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("테이블 생성중...");
		session.insert("chatMapper.createRoom" , vo);
		System.out.println("테이블 생성완료");
	}



	public ChatRoom selectChatRoom(ChatRoom vo) throws Exception {
		// TODO Auto-generated method stub
		
		ChatRoom roomvo = null;
		roomvo = session.selectOne("chatMapper.selectChatRoom", vo);
		System.out.println("해당 채팅 사용자 채팅테이블 : " + roomvo);
		
		return roomvo;
	}



	public int insertMessage(Message vo) throws Exception {
		// TODO Auto-generated method stub
		
		return session.insert("chatMapper.insertMessage" , vo);
		
	}

	
}
