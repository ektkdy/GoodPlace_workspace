package com.kh.goodplace.messages.model.dao;

import java.util.ArrayList;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.goodplace.messages.model.vo.ChatRoom;
import com.kh.goodplace.messages.model.vo.Message;

@Repository("cDao")
public class ChatDao{
	
	@Inject
	private SqlSession session;

	
	// 채팅룸 생성
	public void createRoom(ChatRoom vo) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("테이블 생성중...");
		session.insert("chatMapper.createRoom" , vo);
		System.out.println("테이블 생성완료");
	}


	// 채팅룸 조회
	public ChatRoom selectChatRoom(ChatRoom vo) throws Exception {
		// TODO Auto-generated method stub
		
		ChatRoom roomvo = null;
		roomvo = session.selectOne("chatMapper.selectChatRoom", vo);
		System.out.println("해당 채팅 사용자 채팅테이블 : " + roomvo);
		
		return roomvo;
	}


	// 채팅 내용 메세지테이블 입력
	public int insertMessage(Message vo) throws Exception {
		return session.insert("chatMapper.insertMessage" , vo);
	}
	
	
	// 관리자 메세지 리스트 가져오기
	public ArrayList<ChatRoom> aSelectMessagesList(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("chatMapper.aSelectMessagesList");
	}
	
	public ArrayList<Message> selectMessage(SqlSessionTemplate sqlSession, int msn) {
		return (ArrayList)sqlSession.selectList("chatMapper.selectMessage",msn);
	}
	
	// 파트너 메세지 리스트 가져오기
	public ArrayList<ChatRoom> pSelectMessagesList(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("chatMapper.pSelectMessagesList");
	}


	public ArrayList<Message> selectpMessage(SqlSessionTemplate sqlSession, int pmsn) {
		return (ArrayList)sqlSession.selectList("chatMapper.selectpMessage", pmsn);
	}
	
	public ChatRoom selectRoomChat(SqlSessionTemplate sqlSession, ChatRoom cr) {
		 return sqlSession.selectOne("chatMapper.selectRoomChat", cr);
	}
	
	
	public ChatRoom selectpChatRoom(ChatRoom cr) {
		return session.selectOne("chatMapper.selectpChatRoom", cr);
	}
	// 채팅 내용 메세지테이블 입력
	public int insertpMessage(Message vo) throws Exception {
		return session.insert("chatMapper.insertpMessage" , vo);
	}
	
	
}
