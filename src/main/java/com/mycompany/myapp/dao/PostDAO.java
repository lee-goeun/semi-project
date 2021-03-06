package com.mycompany.myapp.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.mycompany.myapp.common.PostCriteria;
import com.mycompany.myapp.vo.PostVO;

public interface PostDAO {
	
	// 포스트 조회 (+검색) - 사용X
	public List selectAllPostsList(PostVO vo) throws DataAccessException;
	
	// 포스트 조회 + 페이징 + 검색
	public List<PostVO> getListPost(PostCriteria cri) throws Exception;
	
	// 포스트 총 개수
    public int getTotal(PostCriteria cri) throws Exception;
	
	// 포스트 추가
	public void insertNewPost(Map postMap) throws DataAccessException;
	
	// 추가된 포스트아이디 조회
	public int selectNewId() throws DataAccessException;
	
	// 포스트 상세조회
	public PostVO selectPost(int postId) throws DataAccessException;
	
	// 포스트 수정
	public void updatePost(Map postMap) throws DataAccessException;
	
	// 포스트 삭제
	public void deletePost(int postId) throws DataAccessException;
	
	// 마감 상태 업데이트
    public int updateState() throws Exception;
    
}
