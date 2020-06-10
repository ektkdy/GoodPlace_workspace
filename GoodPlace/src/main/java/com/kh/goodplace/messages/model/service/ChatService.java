package com.kh.goodplace.messages.model.service;

import java.util.ArrayList;

import com.kh.goodplace.messages.model.vo.ChatRoom;
import com.kh.goodplace.messages.model.vo.Message;

public interface ChatService {
	// 메세지 리스트 가져옴
	public ArrayList<ChatRoom> aSelectMessagesList();
	
	// 상대방과 주고받은 메세지를 전부 가져옴
	public ArrayList<Message> selectMessage(int msn);
}
