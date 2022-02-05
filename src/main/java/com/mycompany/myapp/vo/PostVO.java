package com.mycompany.myapp.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("postVO")
public class PostVO {
	
	private int postId;			// 모집글 식별자
	private String uid;			// 모집글 작성자
	private String title;		// 모집글 제목
	private String content;		// 모집글 내용
	private int maxMember;		// 최대 모집인원 수
	private String image;		// 모집글 이미지 파일 경로
	private int price;			// 음식 가격
	private int deliveryFee;	// 음식 배달요금
	private String category;	// 음식 카테고리
	private String deadline;	// 모집글 마감기한
	private int postState;		// 모집글 마감 상태	(마감X-0/마감O-1)
	private int isTogether;		// 같이(1)/따로(0) 먹어요
	private Date postedDate;	// 모집글 등록일
	private boolean isRevised;	// 모집글 수정여부
	private Date revisedDate;	// 모집글 수정일
	private boolean isDeleted;	// 모집글 삭제여부
	private Date deletedDate;	// 모집글 삭제일
	private int viewCount;		// 모집글 조회수

	/* userTbl에서 가져옴 */
	private String nickname;	// 모집글 작성자 닉네임
	private String address;		// 모집글 작성자 주소
	
	public PostVO() {
		
	}

	public int getPostId() {
		return postId;
	}

	public void setPostId(int postId) {
		this.postId = postId;
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

	public int getMaxMember() {
		return maxMember;
	}

	public void setMaxMember(int maxMember) {
		this.maxMember = maxMember;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getDeliveryFee() {
		return deliveryFee;
	}

	public void setDeliveryFee(int deliveryFee) {
		this.deliveryFee = deliveryFee;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getDeadline() {
		return deadline;
	}

	public void setDeadline(String deadline) {
		this.deadline = deadline;
	}

	public int getPostState() {
		return postState;
	}

	public void setPostState(int postState) {
		this.postState = postState;
	}

	public int getIsTogether() {
		return isTogether;
	}

	public void setIsTogether(int isTogether) {
		this.isTogether = isTogether;
	}

	public Date getPostedDate() {
		return postedDate;
	}

	public void setPostedDate(Date postedDate) {
		this.postedDate = postedDate;
	}

	public boolean isRevised() {
		return isRevised;
	}

	public void setRevised(boolean isRevised) {
		this.isRevised = isRevised;
	}

	public Date getRevisedDate() {
		return revisedDate;
	}

	public void setRevisedDate(Date revisedDate) {
		this.revisedDate = revisedDate;
	}

	public boolean isDeleted() {
		return isDeleted;
	}

	public void setDeleted(boolean isDeleted) {
		this.isDeleted = isDeleted;
	}

	public Date getDeletedDate() {
		return deletedDate;
	}

	public void setDeletedDate(Date deletedDate) {
		this.deletedDate = deletedDate;
	}

	public int getViewCount() {
		return viewCount;
	}

	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
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
	
}
