package com.mycompany.myapp.dao;

import java.util.List;

import com.mycompany.myapp.vo.ReviewReplyVO;

public interface ReviewReplyDao {
	
	/* 댓글 목록 */
	public List<ReviewReplyVO> listReply(int reviewId) throws Exception;
	
	/* 댓글 작성 */
	public void writeReply(ReviewReplyVO replyVO) throws Exception;
	
	/* 댓글 수정 */
	public void reviseReview(ReviewReplyVO replyVO) throws Exception;
	
	/* 댓글 삭제 */
	public void deleteReview(ReviewReplyVO replyVO) throws Exception;
	
}
