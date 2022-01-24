package com.mycompany.myapp.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.mycompany.myapp.vo.PostVO;

public interface PostDAO {
	public List selectAllPostsList() throws DataAccessException;
	public int insertNewPost(Map postMap) throws DataAccessException;
	
	public PostVO selectPost(int post_id) throws DataAccessException;
	public void updatePost(Map postMap) throws DataAccessException;
	public void deletePost(int post_id) throws DataAccessException;
}
