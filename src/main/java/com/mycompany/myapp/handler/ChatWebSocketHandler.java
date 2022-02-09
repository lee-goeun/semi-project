package com.mycompany.myapp.handler;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.codehaus.plexus.component.annotations.Component;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.mycompany.myapp.service.ChatService;
import com.mycompany.myapp.vo.ChatMessage;
import com.mycompany.myapp.vo.ChatVO;


public class ChatWebSocketHandler extends TextWebSocketHandler{
	
	private ObjectMapper objectMapper;
	private ChatRoomRepository chatRoomRepository;
	
	public static List<WebSocketSession> list = new ArrayList<WebSocketSession>();
	
	//클라이언트에서 메세지를 보냈을 때 메소드
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		ChatRoom chatRoom = new ChatRoom();
		objectMapper = new ObjectMapper();
		chatRoomRepository = new ChatRoomRepository();
		
		String msg = message.getPayload();
        ChatVO chatMessage = objectMapper.readValue(msg,ChatVO.class);
        chatRoom = chatRoomRepository.findRoomById(Integer.toString(chatMessage.getPostId()));
        
        chatRoom.handleMessage(session,chatMessage,objectMapper);
    }
	
}


