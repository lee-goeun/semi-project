package com.mycompany.myapp.service;

import java.util.List;
import java.util.Map;

import com.mycompany.myapp.vo.PostVO;
public interface PostService {
	//포스트 조회
	public List<PostVO> listPosts() throws Exception;
	
	//포스트 추가
	public void addNewPost(Map postMap) throws Exception;
	
	//포스트 상세조회
	public PostVO viewPost(int postId) throws Exception;
	
	//포스트 수정
	public void modPost(Map postMap) throws Exception;
	
	//포스트 삭제
	public void removePost(int postId) throws Exception;
}
