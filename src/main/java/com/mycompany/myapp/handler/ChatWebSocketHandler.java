package com.mycompany.myapp.handler;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class ChatWebSocketHandler extends TextWebSocketHandler{
	public static List<WebSocketSession> list = new ArrayList<WebSocketSession>();
	
	public ChatWebSocketHandler() {
		
	}
	
	// 클라이언트가 접속되었을 때 호출되는 메소드
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		System.out.println(session.getId() + "연결 됨");
		list.add(session);
	}
	
	//클라이언트에서 메세지를 보냈을 때 메소드
	@Override
	public void handleMessage(WebSocketSession session, WebSocketMessage<?> message) throws Exception {

		//특정 session 클라이언트에서 전송된 메세지를 받음
		String msg = (String)message.getPayload();
		
		//현재 websocket에 접속된 모든 클라이언트에 메세지를 전송
		for(WebSocketSession socket:list) {
			//메세지생성
			WebSocketMessage<String> sendMsg = new TextMessage(msg);
			//각 세션에 메세지를 전송
			socket.sendMessage(sendMsg);
		}
	}
	
	//클라이언트와의 연결이 끊겼을 때 호출되는 메소드
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		System.out.println(session.getId() + "연결 종료");
		list.remove(session);
	}
}
