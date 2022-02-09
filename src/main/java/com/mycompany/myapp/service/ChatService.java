package com.mycompany.myapp.service;

import java.util.List;
import java.util.Map;

import com.mycompany.myapp.vo.ChatVO;


public interface ChatService {
	//채팅 추가
	public void addNewChat(Map chatMap) throws Exception;
	
	//채팅 조회
	public void insertMsg(Map chatMap) throws Exception;
	
	//메세지에 대한 아이디 조회
	public int selectChatId(String msg) throws Exception;
	
	//유저가 채팅방에 있는 지 여부 확인
	public List<ChatVO> confirmUid(Map chatMap) throws Exception;
	
	//채팅 나가기
	public void exitChat(Map chatMap) throws Exception;
}
