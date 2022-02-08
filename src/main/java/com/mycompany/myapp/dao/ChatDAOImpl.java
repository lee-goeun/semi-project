package com.mycompany.myapp.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.mycompany.myapp.handler.ChatRoom;

@Repository("ChatDAO")
public class ChatDAOImpl implements ChatDAO{
	@Autowired
	private SqlSession sqlSession;
	
	//채팅추가
	@Override
	public void insertNewChat(Map chatMap) throws DataAccessException {
		sqlSession.insert("mapper.chat.insertNewChat", chatMap);
	}
	
	//채팅조회
	@Override
	public ChatRoom selectChat(int postId) throws DataAccessException {
		return sqlSession.selectOne("mapper.chat.selectChat", postId);
	}

}
