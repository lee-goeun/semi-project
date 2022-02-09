package com.mycompany.myapp.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.mycompany.myapp.handler.ChatRoom;
import com.mycompany.myapp.vo.ChatVO;
import com.mycompany.myapp.vo.MemberVO;

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
	
	@Override
	public int selectChatId(String msg) throws DataAccessException{
		return sqlSession.selectOne("mapper.chat.selectChatId", msg);
	}
	
	@Override
	public void exitChat(Map chatMap) throws DataAccessException {
		sqlSession.delete("mapper.chat.exitChat", chatMap);
	}
	@Override
	public List<ChatVO> confirmUid(Map chatMap) throws DataAccessException {
		return sqlSession.selectList("mapper.chat.confirmUid", chatMap);
	}
	

	

}
