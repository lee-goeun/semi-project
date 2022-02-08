package com.mycompany.myapp.dao;

import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.mycompany.myapp.handler.ChatRoom;
import com.mycompany.myapp.vo.ChatVO;

public interface ChatDAO {
	//채팅방 추가
	public void insertNewChat(Map chatMap) throws DataAccessException;
	
	//채팅방 조회
	public void insertMsg(Map chatMap) throws DataAccessException;
	
	//채팅방메세지에 대한 아이디 조회
	public int selectChatId(String msg) throws DataAccessException;
}
