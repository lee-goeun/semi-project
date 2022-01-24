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
	
	@Override
	public List<PostVO> listPosts() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int addNewPost(Map postMap) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public PostVO viewPost(int postId) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void modPost(Map postMap) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void removePost(int postId) throws Exception {
		// TODO Auto-generated method stub
		
	}
	
}
