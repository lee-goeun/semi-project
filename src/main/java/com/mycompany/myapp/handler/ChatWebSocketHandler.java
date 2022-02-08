package com.mycompany.myapp.handler;

import java.util.ArrayList;
import java.util.List;


import org.codehaus.plexus.component.annotations.Component;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.mycompany.myapp.service.ChatService;
import com.mycompany.myapp.vo.ChatVO;


public class ChatWebSocketHandler extends TextWebSocketHandler{
	
	  private ChatService chatService;
	  private ChatVO chatVO; 
	  
	  private ObjectMapper objectMapper;
	  private ChatRoomRepository chatRoomRepository;
	
	public static List<WebSocketSession> list = new ArrayList<WebSocketSession>();
	
	/*public ChatWebSocketHandler() {
		
	}*/
	
	// 클라이언트가 접속되었을 때 호출되는 메소드
	/*@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		System.out.println(session.getId() + "연결 됨");
		
		list.add(session);
		System.out.println("**********  " + list);
	}*/
	
	//클라이언트에서 메세지를 보냈을 때 메소드
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
        String msg = message.getPayload();
        ChatVO chatMessage = objectMapper.readValue(msg,ChatVO.class);
        ChatRoom chatRoom = chatRoomRepository.findRoomById(chatMessage.getChatId());
        chatRoom.handleMessage(session,chatMessage,objectMapper);
    }
	
	//클라이언트와의 연결이 끊겼을 때 호출되는 메소드
	/*@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		System.out.println(session.getId() + "연결 종료");
		list.remove(session);
	}*/
}


