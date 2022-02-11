package com.mycompany.myapp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.myapp.common.Criteria;
import com.mycompany.myapp.dao.ReviewDAO;
import com.mycompany.myapp.vo.ReviewVO;

@Service("reviewService")
public class ReviewServiceImpl implements ReviewService {
	
	@Autowired
	private ReviewDAO reviewDAO;

	/* 게시판 목록 */
	@Override
	public List<ReviewVO> reviewList() throws Exception {
		return reviewDAO.reviewList();
	}

	/* 게시판 작성 */
	@Override
	public void reviewWrite(ReviewVO reviewVO) throws Exception {
		reviewDAO.reviewWrite(reviewVO);
	}

	/* 게시판 상세 */
	@Override
	public ReviewVO reviewDetail(int reviewId) throws Exception {
		/* 댓글수 갱신 */
		reviewDAO.replyCountUpdate(reviewId);

		return reviewDAO.reviewDetail(reviewId);
	}

	/* 게시판 수정 */
	@Override
	public int reviewRevise(ReviewVO reviewVO) throws Exception {
		return reviewDAO.reviewRevise(reviewVO);
	}

	/* 게시판 삭제 */
	@Override
	public void reviewDelete(ReviewVO reviewVO) throws Exception {
		reviewDAO.reviewDelete(reviewVO);
	}
	
	/* 조회수 증가 */
	@Override
	public void reviewViews(int reviewId) throws Exception {
		reviewDAO.reviewViews(reviewId);
	}
	
	/* 게시판 목록 + 페이징 */
	@Override
	public List<ReviewVO> reviewListPaging(Criteria cri) throws Exception {
		return reviewDAO.reviewListPaging(cri);
	}
	
	/* 개시물 총 개수 */
	@Override
	public int reviewTotal(Criteria cri) throws Exception{
		return reviewDAO.reviewTotal(cri);
	}

}
