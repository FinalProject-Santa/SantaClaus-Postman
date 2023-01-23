package com.boot.jdbc.model.dto;

public class rFileDto {
	private int rf_no;
    private int review_no;
    private String rfile_name;     //저장할 파일
    private String rfile_oriname;  //실제 파일
    private String rfile_url;
	public rFileDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public rFileDto(int rf_no, int review_no, String rfile_name, String rfile_oriname, String rfile_url) {
		super();
		this.rf_no = rf_no;
		this.review_no = review_no;
		this.rfile_name = rfile_name;
		this.rfile_oriname = rfile_oriname;
		this.rfile_url = rfile_url;
	}
	public int getRf_no() {
		return rf_no;
	}
	public void setRf_no(int rf_no) {
		this.rf_no = rf_no;
	}
	public int getReview_no() {
		return review_no;
	}
	public void setReview_no(int review_no) {
		this.review_no = review_no;
	}
	public String getRfile_name() {
		return rfile_name;
	}
	public void setRfile_name(String rfile_name) {
		this.rfile_name = rfile_name;
	}
	public String getRfile_oriname() {
		return rfile_oriname;
	}
	public void setRfile_oriname(String rfile_oriname) {
		this.rfile_oriname = rfile_oriname;
	}
	public String getRfile_url() {
		return rfile_url;
	}
	public void setRfile_url(String rfile_url) {
		this.rfile_url = rfile_url;
	}

	
}
