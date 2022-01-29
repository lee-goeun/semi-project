package com.mycompany.myapp.dao;

import java.util.List;

import com.mycompany.myapp.common.Criteria;
import com.mycompany.myapp.vo.ReviewVO;

public interface ReviewDAO {

	/* 게시판 목록 */
	public List<ReviewVO> reviewList() throws Exception;

	/* 게시판 작성 */
	public void reviewWrite(ReviewVO reviewVO) throws Exception;

	/* 게시판 상세 */
	public ReviewVO reviewDetail(int reviewId) throws Exception;

	/* 게시판 수정 */
	public int reviewRevise(ReviewVO reviewVO) throws Exception;
	
	/* 게시판 삭제 */
	public void reviewDelete(ReviewVO reviewVO) throws Exception;
	
	/* 조회수 증가 */
	public void reviewViews(int reviewId) throws Exception;
	
	/* 게시판 목록 + 페이징 */
	public List<ReviewVO> reviewListPaging(Criteria cri) throws Exception;
	
	/* 개시물 총 개수 */
	public int reviewTotal(Criteria cri) throws Exception;
	
	/* 게시물 댓글 수 갱신 */
	public void replyCountUpdate(int reviewId) throws Exception;

}
