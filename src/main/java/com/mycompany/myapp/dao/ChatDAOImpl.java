package com.mycompany.myapp.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.mycompany.myapp.handler.ChatRoom;

@Repository("chatDAO")
public class ChatDAOImpl implements ChatDAO{
	@Autowired
	private SqlSession sqlSession;
	
	//채팅추가
	@Override
	public void insertNewChat(Map chatMap) throws DataAccessException {
		sqlSession.insert("mapper.chat.insertNewChat", chatMap);
	}

	@Override
	public void insertMsg(Map chatMap) throws DataAccessException {
		sqlSession.insert("mapper.chat.insertMsg", chatMap);
	}
	
	public int selectChatId(String msg) throws DataAccessException{
		return sqlSession.selectOne("mapper.chat.selectChatId", msg);
	}

}
