package com.mycompany.myapp.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("reviewVO")
public class ReviewVO {
	
	private int reviewId;		// 게시글 번호
	private String uid;			// 게시글 작성자
	private String title;		// 게시글 제목
	private String content;		// 게시글 내용
	private int viewCount;		// 게시글 조회수
	private Date reviewedDate;	// 게시글 등록일
	private Date revisedDate;	// 게시글 수정일
	private Date deletedDate;	// 게시글 삭제일
	private int isRevised;		// 게시글 수정 여부
	private int isDeleted;		// 게시글 삭제 여부
	private int replyCount;		// 게시글 댓글수
	
	/* userTbl에서 가져옴 */
	private String nickname;	// 작성자 닉네임
	private String address;		// 작성자 주소
	
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
	
	public int getViewCount() {
		return viewCount;
	}
	
	public void setViewCount(int viewCount) {
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
	
	public int getReplyCount() {
		return replyCount;
	}

	public void setReplyCount(int replyCount) {
		this.replyCount = replyCount;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	@Override
	public String toString() {
		return "ReviewVO [reviewId=" + reviewId + ", uid=" + uid + ", title=" + title + ", content=" + content
				+ ", viewCount=" + viewCount + ", reviewedDate=" + reviewedDate + ", revisedDate=" + revisedDate
				+ ", deletedDate=" + deletedDate + ", isRevised=" + isRevised + ", isDeleted=" + isDeleted
				+ ", replyCount=" + replyCount + ", nickname=" + nickname + ", address=" + address + "]";
	}

}
