package com.mycompany.myapp.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.mycompany.myapp.dao.ChatDAO;
import com.mycompany.myapp.handler.ChatRoom;
import com.mycompany.myapp.vo.ChatVO;

@Transactional(propagation = Propagation.REQUIRED)
@Service("chatService")
public class ChatServiceImpl implements ChatService{
	@Autowired
	private ChatDAO chatDAO;
	
	public ChatServiceImpl() {
	}

	//채팅 추가
	@Override
	public void addNewChat(Map chatMap) throws Exception {
		chatDAO.insertNewChat(chatMap);
	}
	
	//채팅메세지 추가
	@Override
	public void insertMsg(Map chatMap) throws Exception {
		chatDAO.insertMsg(chatMap);
	}
	
	@Override
	public int selectChatId(String msg) throws Exception{
		return chatDAO.selectChatId(msg);
	}
	
	
}
