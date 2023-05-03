package com.ssafy.enjoytrip.attraction.model;

public class Attraction {
	private int contentId;
	private String title;
	private int contentTypeId;
	private String addr1;
	private String firstImage;
	private int sidoCode;
	private int gugunCode;
	private double latitude;
	private double longitude;
	private String overview;
	
	public Attraction() {
	}

	public Attraction(int contentId, String title, int contentTypeId, String addr1, String firstImage, int sidoCode,
			int gugunCode, double latitude, double longitude, String overview) {
		this.contentId = contentId;
		this.title = title;
		this.contentTypeId = contentTypeId;
		this.addr1 = addr1;
		this.firstImage = firstImage;
		this.sidoCode = sidoCode;
		this.gugunCode = gugunCode;
		this.latitude = latitude;
		this.longitude = longitude;
		this.overview = overview;
	}

	public int getContentId() {
		return contentId;
	}

	public void setContentId(int contentId) {
		this.contentId = contentId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getContentTypeId() {
		return contentTypeId;
	}

	public void setContentTypeId(int contentTypeId) {
		this.contentTypeId = contentTypeId;
	}

	public String getAddr1() {
		return addr1;
	}

	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}

	public String getFirstImage() {
		return firstImage;
	}

	public void setFirstImage(String firstImage) {
		this.firstImage = firstImage;
	}

	public int getSidoCode() {
		return sidoCode;
	}

	public void setSidoCode(int sidoCode) {
		this.sidoCode = sidoCode;
	}

	public int getGugunCode() {
		return gugunCode;
	}

	public void setGugunCode(int gugunCode) {
		this.gugunCode = gugunCode;
	}

	public double getLatitude() {
		return latitude;
	}

	public void setLatitude(double latitude) {
		this.latitude = latitude;
	}

	public double getLongitude() {
		return longitude;
	}

	public void setLongitude(double longitude) {
		this.longitude = longitude;
	}

	public String getOverview() {
		return overview;
	}

	public void setOverview(String overview) {
		this.overview = overview;
	}

	@Override
	public String toString() {
		return "Attraction [contentId=" + contentId + ", title=" + title + ", contentTypeId=" + contentTypeId
				+ ", addr1=" + addr1 + ", firstImage=" + firstImage + ", sidoCode=" + sidoCode + ", gugunCode="
				+ gugunCode + ", latitude=" + latitude + ", longitude=" + longitude + ", overview=" + overview + "]";
	}
	
	
}
