package com.mycompany.myapp.vo;

import org.springframework.stereotype.Component;

@Component("memberVO")
public class MemberVO {
	private String uid;
	private String upass;
	private String uname;
	private String email;
	private String address;
	private int signupDate;
	private int authority;
	private int grade;
	
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
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
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
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
	@Override
	public String toString() {
		return "MemberVO [uid=" + uid + ", upass=" + upass + ", uname=" + uname + ", email=" + email + ", address="
				+ address + ", signupDate=" + signupDate + ", authority=" + authority + ", grade=" + grade + "]";
	}
	
	
	

	
	
	
	
	
}
