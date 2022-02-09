package com.mycompany.myapp.handler;

import java.io.IOException;
import java.util.HashSet;
import java.util.Set;
import java.util.UUID;

import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.mycompany.myapp.vo.ChatMessage;
import com.mycompany.myapp.vo.ChatVO;
import com.mycompany.myapp.vo.MessageType;


public class ChatRoom {
	private String roomId;
	private Set<WebSocketSession> sessions = new HashSet();
	
	
	public String getRoomId() {
		return roomId;
	}

	public void setRoomId(String roomId) {
		this.roomId = roomId;
	}
	
	public ChatRoom() {
	}	
	
	public static ChatRoom create(String postId){
        ChatRoom chatRoom = new ChatRoom();
        chatRoom.roomId =  postId;
        return chatRoom;
    }
	
	public void handleMessage(WebSocketSession session, ChatVO chatMessage, ObjectMapper objectMapper) throws IOException{
		if(chatMessage.getType() == MessageType.ENTER) {
			sessions.add(session);
		}else if(chatMessage.getType() == MessageType.LEAVE) {
			sessions.remove(session);
		}else {
			System.out.println("*********** " + chatMessage);
			chatMessage.setMsg(chatMessage.getNickname() + ":" + chatMessage.getMsg());
			send(chatMessage, objectMapper);
		}
	}
	
	private void send(ChatVO  chatMessage, ObjectMapper objectMapper) throws IOException{
		TextMessage textMessage = new TextMessage(objectMapper.writeValueAsString(chatMessage.getMsg()));
		for(WebSocketSession sess:sessions) {
			sess.sendMessage(textMessage);
		}
	}
}
