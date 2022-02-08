package com.mycompany.myapp.service;

import java.util.Map;


public interface ChatService {
	//채팅 추가
	public void addNewChat(Map chatMap) throws Exception;
	
	//채팅 조회
	public void insertMsg(Map chatMap) throws Exception;
	
	//메세지에 대한 아이디 조회
	public int selectChatId(String msg) throws Exception;
	
	//채팅 나가기
	public void exitChat(Map chatMap) throws Exception;
}
