package com.mycompany.myapp.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.myapp.common.PostCriteria;
import com.mycompany.myapp.dao.PostDAO;
import com.mycompany.myapp.vo.PostVO;

@Service("postService")
public class PostServiceImpl implements PostService {
	@Autowired
	private PostDAO postDAO;

	public PostServiceImpl() {
	}

	// 포스트 조회 (+검색) - 사용X
	@Override
	public List<PostVO> listPosts(PostVO postVO) throws Exception {
		List<PostVO> postList = postDAO.selectAllPostsList(postVO);
		return postList;
	}
	
	// 포스트 조회 + 페이징 + 검색
	@Override
	public List<PostVO> getListPost(PostCriteria cri) throws Exception {
		return postDAO.getListPost(cri);
	}

	// 포스트 총 개수
	@Override
	public int getTotal(PostCriteria cri) throws Exception {
		return postDAO.getTotal(cri);
	}

	// 포스트 추가
	@Override
	public void addNewPost(Map postMap) throws Exception {
		postDAO.insertNewPost(postMap);
	}

	// 추가된 포스트 아이디 조회
	@Override
	public int selectNewId() throws Exception {
		return postDAO.selectNewId();
	}

	// 포스트 상세조회
	@Override
	public PostVO viewPost(int postId) throws Exception {
		PostVO postVO = postDAO.selectPost(postId);
		return postVO;
	}

	// 포스트 수정
	@Override
	public void modPost(Map postMap) throws Exception {

		postDAO.updatePost(postMap);
	}

	// 포스트 삭제
	@Override
	public void removePost(int postId) throws Exception {
		postDAO.deletePost(postId);
	}

	// 마감 상태 업데이트
	@Override
	public int updateState() throws Exception {
		return postDAO.updateState();
	}

}
