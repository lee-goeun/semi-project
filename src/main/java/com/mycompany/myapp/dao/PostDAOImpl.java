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
	
	@Override
	public List selectAllPostsList() throws DataAccessException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertNewPost(Map postMap) throws DataAccessException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public PostVO selectPost(int postId) throws DataAccessException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updatePost(Map postMap) throws DataAccessException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deletePost(int post_id) throws DataAccessException {
		// TODO Auto-generated method stub
		
	}

}
