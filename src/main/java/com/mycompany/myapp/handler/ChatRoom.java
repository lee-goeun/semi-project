package com.mycompany.myapp.handler;

import java.io.IOException;
import java.util.HashSet;
import java.util.Set;
import java.util.UUID;

import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.mycompany.myapp.vo.ChatVO;
import com.mycompany.myapp.vo.MessageType;

public class ChatRoom {
	private String roomId;
    private String name;
	private Set<WebSocketSession> sessions = new HashSet<>();
	
	
	public String getRoomId() {
		return roomId;
	}

	public void setRoomId(String roomId) {
		this.roomId = roomId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public static ChatRoom create(String name){
        ChatRoom chatRoom = new ChatRoom();
        chatRoom.roomId = UUID.randomUUID().toString();
        chatRoom.name = name;
        return chatRoom;
    }
	
	public void handleMessage(WebSocketSession session, ChatVO chatMessage, ObjectMapper objectMapper) throws IOException{
		System.out.println("&&&&&&&&&&&&&&&&&&&&&" + chatMessage.getType());
		if(chatMessage.getType() == MessageType.ENTER) {
			sessions.add(session);
			chatMessage.setMsg(chatMessage.getUid() + "입장");
			
		}else if(chatMessage.getType() == MessageType.LEAVE) {
			sessions.remove(session);
			chatMessage.setMsg(chatMessage.getUid() + "퇴장");
		}else {
			chatMessage.setMsg(chatMessage.getUid() + ":" + chatMessage.getMsg());
		}
		send(chatMessage, objectMapper);
		
	}
	private void send(ChatVO chatMessage, ObjectMapper objectMapper) throws IOException{
		TextMessage textMessage = new TextMessage(objectMapper.writeValueAsString(chatMessage.getMsg()));
		for(WebSocketSession sess:sessions) {
			sess.sendMessage(textMessage);
		}
	}
}
