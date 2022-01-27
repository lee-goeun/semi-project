package com.mycompany.myapp.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mycompany.myapp.common.Criteria;
import com.mycompany.myapp.vo.ReviewVO;

@Repository("reviewDAO")
public class ReviewDAOImpl implements ReviewDAO {

	@Autowired
	private SqlSession sqlSession;

	/* 게시판 목록 */
	@Override
	public List<ReviewVO> reviewList() throws Exception {
		return sqlSession.selectList("reviewMapper.reviewList");
	}

	/* 게시판 작성 */
	@Override
	public void reviewWrite(ReviewVO reviewVO) throws Exception {
		sqlSession.insert("reviewMapper.reviewWrite", reviewVO);
	}

	/* 게시판 상세 */
	@Override
	public ReviewVO reviewDetail(int reviewId) throws Exception {
		return sqlSession.selectOne("reviewMapper.reviewDetail", reviewId);
	}
	
	/* 게시판 수정 */
	@Override
	public int reviewRevise(ReviewVO reviewVO) throws Exception {
		return sqlSession.update("reviewMapper.reviewRevise", reviewVO);
	}

	/* 게시판 삭제 */
	@Override
	public void reviewDelete(ReviewVO reviewVO) throws Exception {
		sqlSession.update("reviewMapper.reviewDelete", reviewVO);
	}

	/* 조회수 증가 */
	@Override
	public void reviewViews(int reviewId) throws Exception {
		sqlSession.update("reviewMapper.reviewViews", reviewId);
	}
	
	/* 게시판 목록 + 페이징 */
	@Override
	public List<ReviewVO> reviewListPaging(Criteria cri) throws Exception {
		return sqlSession.selectList("reviewMapper.reviewListPaging", cri);
	}
	
	/* 게시판 총 개수 */
	@Override
	public int reviewTotal(Criteria cri) throws Exception {
		return sqlSession.selectOne("reviewMapper.reviewTotal", cri);
	}

}
