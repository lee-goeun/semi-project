package com.mycompany.myapp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.myapp.dao.ReviewReplyDao;
import com.mycompany.myapp.vo.ReviewReplyVO;

@Service("reviewReplyService")
public class ReviewReplyServiceImpl implements ReviewReplyService {
	
	@Autowired
	private ReviewReplyDao replyDAO;

	/* 댓글 목록 */
	@Override
	public List<ReviewReplyVO> listReply(int reviewId) throws Exception {
		return replyDAO.listReply(reviewId);
	}
	
	/* 댓글 작성 */
	@Override
	public void writeReply(ReviewReplyVO replyVO) throws Exception {
		replyDAO.writeReply(replyVO);
	}

	/* 댓글 수정 */
	@Override
	public void reviseReview(ReviewReplyVO replyVO) throws Exception {
		replyDAO.reviseReview(replyVO);
	}

	/* 댓글 삭제 */
	@Override
	public void deleteReview(ReviewReplyVO replyVO) throws Exception {
		replyDAO.deleteReview(replyVO);
	}
	
}
