package com.kh.goodplace.messages.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.kh.goodplace.member.model.vo.Member;
import com.kh.goodplace.messages.model.dao.ChatDao;
import com.kh.goodplace.messages.model.vo.ChatRoom;
import com.kh.goodplace.messages.model.vo.Message;

@RequestMapping("/echo")
public class EchoHandler extends TextWebSocketHandler{
	
	@Inject
	private ChatDao cDao;
	
	// 세션에 접속한 사람들을 담을 공간
	private Map<String, WebSocketSession> sessions = new HashMap<String,WebSocketSession>();
	
    //세션 리스트
    private List<WebSocketSession> connectedUsers = new ArrayList<WebSocketSession>();

    private static Logger logger = LoggerFactory.getLogger(EchoHandler.class);

    //클라이언트가 연결 되었을 때 실행
    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
        Map<String, Object> user = session.getAttributes();
        Member loginUser = (Member)user.get("loginUser");// loginUser의 회원정보를 가져온다
        // 이메일 + 세션 classId
    	String loginUserEmail = loginUser.getEmail() + user.get("class_class_id");

        // loginUserEmail --> 세션 생성
        sessions.put(loginUserEmail, session);// {"gmldud695@naver.com1", "idmglanfwa"}	
        logger.info("{} 연결됨", loginUserEmail); 
    }

    //클라이언트가 웹소켓 서버로 메시지를 전송했을 때 실행
    @Override
    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
    	Map<String, Object> user = session.getAttributes();
        Member loginUser = (Member)user.get("loginUser");
        
    	Message messageVO = Message.convertMessage(message.getPayload());
    	
    	System.out.println("messageVO : " +messageVO);
    	logger.info("{}로 부터 {} 받음", messageVO.getMessageSender(), message.getPayload());
    	
	    ChatRoom roomVO  = new ChatRoom();
	    //roomVO.setCLASS_class_id(messageVO.getCLASS_class_id()); //클래스
	    roomVO.setTutorEmail(messageVO.getMessageReceiver()); //튜터
	    roomVO.setUserEmail(messageVO.getMessageSender()); //유저
	      
	    ChatRoom croom =null;

	    if(roomVO.getTutorEmail().equals("admin@goodplace.com")) {
	    	croom = cDao.selectChatRoom(roomVO);
	    } else {
	    	croom = cDao.selectpChatRoom(roomVO);
	    }
	    // 채팅방의 chno를 외부키 객체로 넣어줌
	    messageVO.setChNo(croom.getChNo());
	    
	    if(croom.getUserEmail().equals(messageVO.getMessageSender())) { // 보낸 사람이 채팅방의 유저1와 일치할 경우
	    	messageVO.setMessageReceiver(roomVO.getTutorEmail());	// 상대방이름을 receiver에 넣음
	    	System.out.println("1");
	    }else {																// 보낸 사람이 채팅방의 유저2와 일치할 경우
	  		messageVO.setMessageReceiver(roomVO.getUserEmail());		// 보낸사람이름을 receiver에 넣음
	  		System.out.println("2");
	    }
	    
	    int result = 0;
	    System.out.println("messageVO : " + messageVO);
	    if(messageVO.getMessageReceiver().equals("admin@goodplace.com")) {	// 관리자에 대한 채팅내용일 경우
	    	result = cDao.insertMessage(messageVO);					// MESSAGE테이블에 채팅 입력
	    	
	    } else {														// 파트너와 숙소 사용자 간의 채팅일 경우
	    	result = cDao.insertpMessage(messageVO);														// PMESSAGE테이블에 채팅 입력
	    }
	    
	    // 자신에게 전송
	    sessions.get(messageVO.getMessageSender()+croom.getClass_class_id()).sendMessage(new TextMessage(message.getPayload()));
	    // 상대방이 세션에 들어와있지 않을 경우 보내지 않음(오류방지)
	    if(sessions.get(messageVO.getMessageReceiver()+croom.getClass_class_id()) != null) {	
	    	sessions.get(messageVO.getMessageReceiver()+croom.getClass_class_id()).sendMessage(new TextMessage(message.getPayload()));
	    }
	    
	    // 
	    /*
	    // 세션에 접속해있는 모두에게 메세지 전송
	    Iterator<String> sessionIds = sessions.keySet().iterator();
        String sessionId="";
        while(sessionIds.hasNext()){
            sessionId = sessionIds.next();
            sessions.get(sessionId).sendMessage(new TextMessage("echo:" + message.getPayload())); 
        }
	    */
        /*
        //sessions.put(messageVO.getTUTOR_USER_user_id(), session);
        
        // 상대방 아이디로 매핑전송
        String target = messageVO.getTUTOR_USER_user_id();
        System.out.println("target : " + target);
        WebSocketSession ws = (WebSocketSession)sessions.get(target);
        
        System.out.println(ws);
    	//받는 사람
        /*
    	if (messageVO.getUSER_user_id().equals(messageVO.getMessage_sender())) { // 로그인 유저와 보내는사람이 일치할 경우
    		// 다른 모든사람에게 메세지를 보냄 
    		Gson gson = new Gson();
            String msgJson = gson.toJson(messageVO);
            ws.sendMessage(new TextMessage(msgJson));
        }
        */
    	//websocketSession.sendMessage(new TextMessage(message.getPayload()));
        
    }
    //클라이언트 연결을 끊었을 때 실행
    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
    	connectedUsers.remove(session);
        logger.info("{} 연결 끊김.", session.getId());
    }
}

