package com.mycompany.myapp.vo;

import java.sql.Date;
import java.sql.Timestamp;

import org.springframework.stereotype.Component;

@Component("postVO")
public class PostVO {
	private int postId;
	private String uid;
	private String title;
	private String content;
	private int maxMember;
	private String image;
	private int price;
	private int deliveryFee;
	private String category;
	private String deadline;
	private int isTogether;
	private Date postedDate;
	private boolean isRevised;
	private Date revisedDate;
	private boolean isDeleted;
	private Date deletedDate;
	private int viewCount;
	
	
	public Date getRevisedDate() {
		return revisedDate;
	}


	public void setRevisedDate(Date revisedDate) {
		this.revisedDate = revisedDate;
	}


	public void setUid(String uid) {
		this.uid = uid;
	}


	public PostVO() {
	}


	public int getPostId() {
		return postId;
	}


	public void setPostId(int postId) {
		this.postId = postId;
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


	public int isTogether() {
		return isTogether;
	}


	public void setTogether(int isTogether) {
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


	
}
