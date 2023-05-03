package com.ssafy.enjoytrip.board.model;

public class Page {

	private int pageNo;
	private int listSize;
	
	//기본 default 값
	public Page() {
		this(1, 10);
	}
	
	public Page(int pageNo) {
		this(pageNo, 10);
	}
	
	public Page(int pageNo, int listSize) {
		this.pageNo = pageNo;
		this.listSize = listSize;
	}

	public int getPageNo() {
		return pageNo;
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}

	public int getListSize() {
		return listSize;
	}

	public void setListSize(int listSize) {
		this.listSize = listSize;
	}
	
	//페이지의 시작 번호
	public int getBegin() {
		return (pageNo - 1) *listSize;
	}
}
