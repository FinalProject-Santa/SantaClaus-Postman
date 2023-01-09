package com.boot.jdbc.model.dto;

public class rFileDto {
	private int rfno;
    private int review_no;
    private String rfileName;     //저장할 파일
    private String rfileOriName;  //실제 파일
    private String rfileUrl;
	public rFileDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public rFileDto(int rfno, int review_no, String rfileName, String rfileOriName, String rfileUrl) {
		super();
		this.rfno = rfno;
		this.review_no = review_no;
		this.rfileName = rfileName;
		this.rfileOriName = rfileOriName;
		this.rfileUrl = rfileUrl;
	}
	public int getRfno() {
		return rfno;
	}
	public void setRfno(int rfno) {
		this.rfno = rfno;
	}
	public int getReview_no() {
		return review_no;
	}
	public void setReview_no(int review_no) {
		this.review_no = review_no;
	}
	public String getRfileName() {
		return rfileName;
	}
	public void setRfileName(String rfileName) {
		this.rfileName = rfileName;
	}
	public String getRfileOriName() {
		return rfileOriName;
	}
	public void setRfileOriName(String rfileOriName) {
		this.rfileOriName = rfileOriName;
	}
	public String getRfileUrl() {
		return rfileUrl;
	}
	public void setRfileUrl(String rfileUrl) {
		this.rfileUrl = rfileUrl;
	}

}
