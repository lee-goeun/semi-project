package com.mycompany.myapp.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("reviewVO")
public class ReviewVO {
	
	private int reviewId;		// 게시글 번호
	private String uid;			// 게시글 작성자
	private String title;		// 게시글 제목
	private String content;		// 게시글 내용
	private String viewCount;	// 게시글 조회수
	private Date reviewedDate;	// 게시글 등록일
	private Date revisedDate;	// 게시글 수정일
	private Date deletedDate;	// 게시글 삭제일
	private int isRevised;		// 게시글 수정 여부
	private int isDeleted;		// 게시글 삭제 여부
	
	public int getReviewId() {
		return reviewId;
	}
	
	public void setReviewId(int reviewId) {
		this.reviewId = reviewId;
	}
	
	public String getUid() {
		return uid;
	}
	
	public void setUid(String uid) {
		this.uid = uid;
	}
	
	public String getTitle() {
		return title;
	}
	
	public void setTitle(String title) {
		this.title = title;
	}
	
	public String getContent() {
		return content;
	}
	
	public void setContent(String content) {
		this.content = content;
	}
	
	public String getViewCount() {
		return viewCount;
	}
	
	public void setViewCount(String viewCount) {
		this.viewCount = viewCount;
	}
	
	public Date getReviewedDate() {
		return reviewedDate;
	}
	
	public void setReviewedDate(Date reviewedDate) {
		this.reviewedDate = reviewedDate;
	}
	
	public Date getRevisedDate() {
		return revisedDate;
	}
	
	public void setRevisedDate(Date revisedDate) {
		this.revisedDate = revisedDate;
	}
	
	public Date getDeletedDate() {
		return deletedDate;
	}
	
	public void setDeletedDate(Date deletedDate) {
		this.deletedDate = deletedDate;
	}
	
	public int getIsRevised() {
		return isRevised;
	}
	
	public void setIsRevised(int isRevised) {
		this.isRevised = isRevised;
	}
	
	public int getIsDeleted() {
		return isDeleted;
	}
	
	public void setIsDeleted(int isDeleted) {
		this.isDeleted = isDeleted;
	}
	
}
