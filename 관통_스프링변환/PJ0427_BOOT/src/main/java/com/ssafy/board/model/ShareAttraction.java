package com.ssafy.board.model;

public class ShareAttraction {
	private int shareNo;
	private String attractionId;
	private String registerTime;
	private String updateDate;
	private String removeDate;
	
	
	public String getRegisterTime() {
		return registerTime;
	}
	public void setRegisterTime(String registerTime) {
		this.registerTime = registerTime;
	}
	public String getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(String updateDate) {
		this.updateDate = updateDate;
	}
	public String getRemoveDate() {
		return removeDate;
	}
	public void setRemoveDate(String removeDate) {
		this.removeDate = removeDate;
	}
	public int getShareNo() {
		return shareNo;
	}
	public void setShareNo(int shareNo) {
		this.shareNo = shareNo;
	}
	public String getAttractionId() {
		return attractionId;
	}
	public void setAttractionId(String attractionId) {
		this.attractionId = attractionId;
	}
}
