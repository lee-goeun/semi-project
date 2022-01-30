package com.mycompany.myapp.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.mycompany.myapp.vo.PostVO;

@Repository("PostDAO")
public class PostDAOImpl implements PostDAO{
	@Autowired
	private SqlSession sqlSession;
	
	//포스트 조회(+검색)
	@Override
	public List selectAllPostsList(PostVO vo) throws DataAccessException {
		return sqlSession.selectList("mapper.post.selectAllPostsList", vo);
	}
	
	//포스트 추가
	@Override
	public void insertNewPost(Map postMap) throws DataAccessException {
		sqlSession.insert("mapper.post.insertNewPost", postMap);
	}
	
	//최근 추가한 포스트아이디 조회
	public int selectNewId() throws DataAccessException{
		return sqlSession.selectOne("mapper.post.selectNewPostId");
	}
	
	//포스트 상세조회
	@Override
	public PostVO selectPost(int postId) throws DataAccessException {
		return sqlSession.selectOne("mapper.post.selectPost", postId);
	}
	
	//포스트 수정
	@Override
	public void updatePost(Map postMap) throws DataAccessException {
		sqlSession.update("mapper.post.updatePost", postMap);
	}
	
	//포스트 삭제
	@Override
	public void deletePost(int postId) throws DataAccessException {
		sqlSession.update("mapper.post.deletePost", postId);
	}

}
