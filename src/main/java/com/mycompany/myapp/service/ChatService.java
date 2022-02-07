package com.mycompany.myapp.service;

import java.util.Map;

import com.mycompany.myapp.handler.ChatRoom;
import com.mycompany.myapp.vo.ChatVO;

public interface ChatService {
	//채팅 추가
	public void addNewChat(Map chatMap) throws Exception;
	
	//채팅 조회
	public ChatRoom viewChat(int postId) throws Exception;

}
