package com.mycompany.myapp.service;

import java.util.List;

import com.mycompany.myapp.vo.ReviewReplyVO;

public interface ReviewReplyService {
	
	/* 댓글 목록 */
	public List<ReviewReplyVO> listReply(int reviewId) throws Exception;

}
