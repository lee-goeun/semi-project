package com.mycompany.myapp.dao;

import java.util.List;

import com.mycompany.myapp.vo.ReviewReplyVO;

public interface ReviewReplyDao {
	
	/* 댓글 목록 */
	public List<ReviewReplyVO> listReply(int reviewId) throws Exception;

}
