package com.mycompany.myapp.service;

import java.util.List;

import com.mycompany.myapp.vo.ReviewReplyVO;

public interface ReviewReplyService {
	
	/* 댓글 목록 */
	public List<ReviewReplyVO> listReply(int reviewId) throws Exception;
	
	/* 댓글 작성 */
	public void writeReply(ReviewReplyVO replyVO) throws Exception;

	/* 댓글 수정 */
	public void reviseReview(ReviewReplyVO replyVO) throws Exception;
	
	/* 댓글 삭제 */
	public void deleteReview(ReviewReplyVO replyVO) throws Exception;

}
