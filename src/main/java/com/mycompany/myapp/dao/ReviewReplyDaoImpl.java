package com.mycompany.myapp.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mycompany.myapp.vo.ReviewReplyVO;

@Repository("reviewReplyDAO")
public class ReviewReplyDaoImpl implements ReviewReplyDao {

	@Autowired
	private SqlSession sqlSession;

	/* 댓글 목록 */
	@Override
	public List<ReviewReplyVO> listReply(int reviewId) throws Exception {
		return sqlSession.selectList("reviewReplyMapper.listReply", reviewId);
	}

	/* 댓글 작성 */
	@Override
	public void writeReply(ReviewReplyVO replyVO) throws Exception {
		sqlSession.insert("reviewReplyMapper.writeReply", replyVO);
	}

	/* 댓글 수정 */
	@Override
	public void reviseReview(ReviewReplyVO replyVO) throws Exception {
		sqlSession.update("reviewReplyMapper.reviseReply", replyVO);
	}

	/* 댓글 삭제 */
	@Override
	public void deleteReview(ReviewReplyVO replyVO) throws Exception {
		sqlSession.update("reviewReplyMapper.deleteReply", replyVO);
	}

}
