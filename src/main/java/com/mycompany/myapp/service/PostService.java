package com.mycompany.myapp.service;

import java.util.List;
import java.util.Map;

import com.mycompany.myapp.common.PostCriteria;
import com.mycompany.myapp.vo.PostVO;

public interface PostService {
	
	// 포스트 조회 (+검색) - 사용X
	public List<PostVO> listPosts(PostVO PostVO) throws Exception;

	// 포스트 조회 + 페이징 + 검색
	public List<PostVO> getListPost(PostCriteria cri) throws Exception;

	// 포스트 총 개수
	public int getTotal(PostCriteria cri) throws Exception;

	// 포스트 추가
	public void addNewPost(Map postMap) throws Exception;

	// 추가된 포스트 아이디 조회
	public int selectNewId() throws Exception;

	// 포스트 상세조회
	public PostVO viewPost(int postId) throws Exception;

	// 포스트 수정
	public void modPost(Map postMap) throws Exception;

	// 포스트 삭제
	public void removePost(int postId) throws Exception;

	// 마감 상태 업데이트
	public int updateState() throws Exception;
	
}
