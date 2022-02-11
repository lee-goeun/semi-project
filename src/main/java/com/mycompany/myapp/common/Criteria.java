package com.mycompany.myapp.common;

import java.util.Arrays;

public class Criteria {

	private int pageNum;		// 현재 페이지
	private int amount;			// 한 페이지 당 게시물 수
	private int skip;			// 스킵할 게시물 수
	
	private String keyword;		// 검색 키워드
	private String type;		// 검색 타입
	private String[] typeArr;	// 검색 타입 배열 변환
	
	/* 기본 셋팅 */
	public Criteria() {
		this(1, 6);	// pageNum = 1, amount = 6
		this.skip = 0;
	}
	
	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
		this.skip = (pageNum - 1) * amount;
	}

	public int getPageNum() {
		return pageNum;
	}
	
	public void setPageNum(int pageNum) {
		this.skip = (pageNum - 1) * this.amount;
		this.pageNum = pageNum;
	}
	
	public int getAmount() {
		return amount;
	}
	
	public void setAmount(int amount) {
		this.skip = (this.pageNum - 1) * amount;
		this.amount = amount;
	}
	
	public int getSkip() {
		return skip;
	}
	
	public void setSkip(int skip) {
		this.skip = skip;
	}
	
	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
		this.typeArr = type.split("");
	}

	public String[] getTypeArr() {
		return typeArr;
	}

	public void setTypeArr(String[] typeArr) {
		this.typeArr = typeArr;
	}
	
}
