package com.mycompany.myapp.vo;

import org.springframework.stereotype.Component;

@Component("memberVO")
public class MemberVO {
	private String uid;
	private String nickname;
	private String upass;
	private String name;
	private String email;
	private String postCode;
	private String address;
	private String addressSpecific;
	private int signupDate;
	private int authority;
	private int grade;
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public String getUpass() {
		return upass;
	}
	public void setUpass(String upass) {
		this.upass = upass;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPostCode() {
		return postCode;
	}
	public void setPostCode(String postCode) {
		this.postCode = postCode;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getAddressSpecific() {
		return addressSpecific;
	}
	public void setAddressSpecific(String addressSpecific) {
		this.addressSpecific = addressSpecific;
	}
	public int getSignupDate() {
		return signupDate;
	}
	public void setSignupDate(int signupDate) {
		this.signupDate = signupDate;
	}
	public int getAuthority() {
		return authority;
	}
	public void setAuthority(int authority) {
		this.authority = authority;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	
	
}
