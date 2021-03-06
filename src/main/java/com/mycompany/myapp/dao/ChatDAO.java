package com.mycompany.myapp.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.mycompany.myapp.handler.ChatRoom;
import com.mycompany.myapp.vo.ChatVO;
import com.mycompany.myapp.vo.MemberVO;

public interface ChatDAO {
	//채팅방 추가
	public void insertNewChat(Map chatMap) throws DataAccessException;
	
	//채팅방 조회
	public void insertMsg(Map chatMap) throws DataAccessException;
	
	//채팅방메세지에 대한 아이디 조회
	public int selectChatId(String msg) throws DataAccessException;
	
	//유저가 채팅방에 있는 여부 확인
	public List confirmUid(Map chatMap) throws DataAccessException;
	
	//채팅방 나가기
	public void exitChat(Map chatMap) throws DataAccessException;
}
