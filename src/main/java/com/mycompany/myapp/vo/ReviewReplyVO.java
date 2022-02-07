package com.mycompany.myapp.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("reviewReplyVO")
public class ReviewReplyVO {
	
	private int replyId;			// 댓글 식별자
	private int reviewId;			// 게시글 식별자
	private String uid;				// 댓글 작성자 아이디
	private String replyContent;	// 댓글 내용
	private Date repliedDate;		// 댓글 작성일
	private Date revisedDate;		// 댓글 수정일
	private Date deletedDate;		// 댓글 삭제일
	private boolean isRevised;		// 댓글 수정여부
	private boolean isDeleted;		// 댓글 삭제여부
	
	/* userTbl에서 가져옴 */
	private String nickname;		// 댓글 작성자 닉네임
	private String address;			// 댓글 작성자 주소
	private String region1;			// 지역(시도)
	private String region2;			// 지역(시도)
	private String region3;			// 지역(시도)
	
	public int getReplyId() {
		return replyId;
	}
	
	public void setReplyId(int replyId) {
		this.replyId = replyId;
	}
	
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
	
	public String getReplyContent() {
		return replyContent;
	}
	
	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}
	
	public Date getRepliedDate() {
		return repliedDate;
	}
	
	public void setRepliedDate(Date repliedDate) {
		this.repliedDate = repliedDate;
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
	
	public boolean isRevised() {
		return isRevised;
	}
	
	public void setRevised(boolean isRevised) {
		this.isRevised = isRevised;
	}
	
	public boolean isDeleted() {
		return isDeleted;
	}
	
	public void setDeleted(boolean isDeleted) {
		this.isDeleted = isDeleted;
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

	public String getRegion1() {
		return region1;
	}

	public void setRegion1(String region1) {
		this.region1 = region1;
	}

	public String getRegion2() {
		return region2;
	}

	public void setRegion2(String region2) {
		this.region2 = region2;
	}

	public String getRegion3() {
		return region3;
	}

	public void setRegion3(String region3) {
		this.region3 = region3;
	}

}

