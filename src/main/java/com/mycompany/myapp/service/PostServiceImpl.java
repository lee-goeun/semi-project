package com.mycompany.myapp.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.myapp.dao.PostDAO;
import com.mycompany.myapp.vo.PostVO;

@Service("postService")
public class PostServiceImpl implements PostService{
	@Autowired
	private PostDAO postDAO;
	
	public PostServiceImpl() {
	}
	
	//포스트 조회
	@Override
	public List<PostVO> listPosts() throws Exception {
		List<PostVO> postList = postDAO.selectAllPostsList();
		return postList;
	}
	
	//포스트 추가
	@Override
	public void addNewPost(Map postMap) throws Exception {
		postDAO.insertNewPost(postMap);
	}
	
	//포스트 상세조회
	@Override
	public PostVO viewPost(int postId) throws Exception {
		PostVO postVO = postDAO.selectPost(postId);
		return postVO;
	}
	
	//포스트 수정
	@Override
	public void modPost(Map postMap) throws Exception {
		postDAO.updatePost(postMap);
	}
	
	//포스트 삭제
	@Override
	public void removePost(int postId) throws Exception {
		postDAO.deletePost(postId);
	}
	
}
