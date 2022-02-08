package com.mycompany.myapp.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;


@Component("chatVO")
public class ChatVO {
	private int chatId;
	private int postId;
	private String uid;
	private String name;
	private Date chatDate;
	private int isDeleted;
	private Date deletedDate; 
	private String msg;
	private MessageType type;
	
	public ChatVO() {
	}
	
	public ChatVO( int postId, String uid, MessageType type) {
		this.postId = postId;
		this.uid = uid;
		this.type = type;
	}
	
	public int getChatId() {
		return chatId;
	}

	public void setChatId(int chatId) {
		this.chatId = chatId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Date getRepliedDate() {
		return chatDate;
	}

	public void setRepliedDate(Date chatDate) {
		this.chatDate = chatDate;
	}

	public int getIsDeleted() {
		return isDeleted;
	}

	public void setIsDeleted(int isDeleted) {
		this.isDeleted = isDeleted;
	}

	public Date getDeletedDate() {
		return deletedDate;
	}

	public void setDeletedDate(Date deletedDate) {
		this.deletedDate = deletedDate;
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

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public MessageType getType() {
		return type;
	}

	public void setType(MessageType type) {
		this.type = type;
	}

	
}
