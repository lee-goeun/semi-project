package com.mycompany.myapp.common;

public class PostPageMaker {

	private int startPage;		// 화면에 보이는 시작 페이지
	private int endPage;		// 화면에 보이는 마지막 페이지
	private boolean prev;		// 이전 페이지 유무
	private boolean next;		// 다음 페이지 유무
	private int total;			// 전체 게시물 수
	private PostCriteria cri;	// 현재 페이지, 페이지 당 게시물 수 정보

	public PostPageMaker(PostCriteria cri, int total) {
		this.cri = cri;
		this.total = total;

		this.endPage = (int) (Math.ceil(cri.getPageNum() / 10.0)) * 10;	// 화면에 보이는 시작 페이지
		this.startPage = this.endPage - 9;								// 화면에 보이는 마지막 페이지
		int realEnd = (int) (Math.ceil(total * 1.0 / cri.getAmount()));	// 전체 마지막 페이지

		// 전체 마지막 페이지(realEnd)가 화면에 보이는 마지막페이지(endPage)보다 작은 경우, 화면에 보이는 페이지(endPage) 값 조정
		if (realEnd < this.endPage) {
			this.endPage = realEnd;
		}

		// 화면에 보이는 시작 페이지(startPage)가 1보다 큰 경우 true (이전 페이지 유무)
		this.prev = this.startPage > 1;
		// 화면에 보이는 마지막 페이지(endPage)가 전체 마지막 페이지보다 작은 경우 true (다음 페이지 유무)
		this.next = this.endPage < realEnd;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public PostCriteria getCri() {
		return cri;
	}

	public void setCri(PostCriteria cri) {
		this.cri = cri;
	}
	
}
