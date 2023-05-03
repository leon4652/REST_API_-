package com.ssafy.enjoytrip.board.model;

public class PageResult {

	//현재 페이지 번호
	private int pageNo;
	//전체 게시물  개수
	private int count;
	//보여질 아래 버튼의 사이즈 
	private int tabSize;
	//보여질 게시물의 사이즈
	private int listSize;
	//탭의 시작 번호 
	private int beginPage;
	//탭의 끝 번호
	private int endPage;
	//이전 페이지가 있는지 여부
	private boolean prev;
	//다음 페이지가 있는지 여부 
	private boolean next;
	
	//기본 적으로 listSize랑 tabSize를 10으로 
	public PageResult(int pageNo, int count) {
		this(pageNo, count, 10, 10);
	}
	
	public PageResult(int pageNo, int count, int listSize, int tabSize) {
		this.pageNo = pageNo;
		this.count = count;
		this.listSize = listSize;
		this.tabSize = tabSize;	
		
		
		//마지막 페이지 번호  올림 연산 (게시물의 개수를 10으로 나눈후 1을 올린다 - 페이지는 0부터 시작) d 의 경우 double로 변환
		int lastPage = (int)Math.ceil(count / 10d);
		//탭의 번호 ( 1 ~ 10 사이라면 ) =  currTab이  1 / ( 11 ~ 20 사이라면 ) currTab이 2 ...
 		int currTab = (pageNo - 1)/tabSize + 1;
 		//탭에 보여질 시작 번호
 		this.beginPage = (currTab-1) * tabSize + 1;
 		//탭에 보여질 끝 번호  (끝번호가 - currTab * tabSize 가 끝나느 번호보다 크다면) 
 		this.endPage = (currTab * tabSize > lastPage) ? lastPage : currTab * tabSize; 
 		//이전 여부
 		this.prev = beginPage != 1;
 		//다음 여부
 		this.next = endPage != lastPage;
		
	}

	public int getPageNo() {
		return pageNo;
	}

	public int getCount() {
		return count;
	}

	public int getTabSize() {
		return tabSize;
	}

	public int getListSize() {
		return listSize;
	}

	public int getBeginPage() {
		return beginPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public boolean isPrev() {
		return prev;
	}

	public boolean isNext() {
		return next;
	}
	
}
