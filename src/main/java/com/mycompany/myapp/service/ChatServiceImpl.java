package com.mycompany.myapp.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.myapp.dao.ChatDAO;
import com.mycompany.myapp.handler.ChatRoom;
import com.mycompany.myapp.vo.ChatVO;

@Service("chatService")
public class ChatServiceImpl implements ChatService{
	@Autowired
	private ChatDAO chatDAO;

	//채팅 추가
	@Override
	public void addNewChat(Map chatMap) throws Exception {
		chatDAO.insertNewChat(chatMap);
	}
	
	//채팅 조회
	@Override
	public ChatRoom viewChat(int postId) throws Exception {
		ChatRoom chatVO = chatDAO.selectChat(postId);
		return chatVO;
	}
	
}
