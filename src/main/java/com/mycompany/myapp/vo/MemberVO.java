package com.mycompany.myapp.vo;

import org.springframework.stereotype.Component;

@Component("memberVO")
public class MemberVO {

	private String uid;					// 아이디
	private String upass;				// 비밀번호
	private String nickname;			// 닉네임
	private String name;				// 이름
	private String email;				// 이메일
	private String postCode;			// 우편번호
	private String address;				// 도로명주소
	private String addressSpecific;		// 상세주소
	private String region1;				// 지역(시도)
	private String region2;				// 지역(구)
	private String region3;				// 지역(동)
	private int signupDate;				// 가입일
	private int authority;				// 권한 (0-관리자 / 1-회원)
	private int grade;					// 등급

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

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
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

}
