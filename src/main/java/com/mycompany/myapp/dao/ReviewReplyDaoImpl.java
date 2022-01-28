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

}
