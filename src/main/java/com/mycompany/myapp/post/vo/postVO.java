package com.mycompany.myapp.post.vo;

import java.util.Date;

import org.springframework.stereotype.Component;

@Component("postVO")
public class postVO {
	private int post_id;
	private String user_id;
	private Date post_date;
	private String category;
	private int price; //배달료 제외 주문가격
	private int delivery_fee;
	private Date deadline;
	private int MAX_member;
	private String title;
	private String image;
	private Boolean isTogether;
	private Date revision_date;
	private Boolean isDeleted;
	private Boolean isRevised;
	
	public postVO() {
	}

	public int getPost_id() {
		return post_id;
	}

	public void setPost_id(int post_id) {
		this.post_id = post_id;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public Date getPost_date() {
		return post_date;
	}

	public void setPost_date(Date post_date) {
		this.post_date = post_date;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getDelivery_fee() {
		return delivery_fee;
	}

	public void setDelivery_fee(int delivery_fee) {
		this.delivery_fee = delivery_fee;
	}

	public Date getDeadline() {
		return deadline;
	}

	public void setDeadline(Date deadline) {
		this.deadline = deadline;
	}

	public int getMAX_member() {
		return MAX_member;
	}

	public void setMAX_member(int mAX_member) {
		MAX_member = mAX_member;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public Boolean getIsTogether() {
		return isTogether;
	}

	public void setIsTogether(Boolean isTogether) {
		this.isTogether = isTogether;
	}

	public Date getRevision_date() {
		return revision_date;
	}

	public void setRevision_date(Date revision_date) {
		this.revision_date = revision_date;
	}

	public Boolean getIsDeleted() {
		return isDeleted;
	}

	public void setIsDeleted(Boolean isDeleted) {
		this.isDeleted = isDeleted;
	}

	public Boolean getIsRevised() {
		return isRevised;
	}

	public void setIsRevised(Boolean isRevised) {
		this.isRevised = isRevised;
	}
	
	
	
}
