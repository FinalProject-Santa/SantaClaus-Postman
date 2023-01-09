package com.boot.jdbc.model.dto;

import java.util.Date;

public class ReviewDto {
	private int review_no;
	private String user_id;
	private String review_title;
	private int review_best;
	private String review_content;
	private int review_count;
	private Date review_date;



	public ReviewDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ReviewDto(int review_no, String user_id, String review_title, int review_best, String review_content,
			int review_count, Date review_date) {
		super();
		this.review_no = review_no;
		this.user_id = user_id;
		this.review_title = review_title;
		this.review_best = review_best;
		this.review_content = review_content;
		this.review_count = review_count;
		this.review_date = review_date;
	}
	public int getReview_no() {
		return review_no;
	}
	public void setReview_no(int review_no) {
		this.review_no = review_no;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getReview_title() {
		return review_title;
	}
	public void setReview_title(String review_title) {
		this.review_title = review_title;
	}

	public int getReview_best() {
		return review_best;
	}
	public void setReview_best(int review_best) {
		this.review_best = review_best;
	}
	public String getReview_content() {
		return review_content;
	}
	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}
	public int getReview_count() {
		return review_count;
	}
	public void setReview_count(int review_count) {
		this.review_count = review_count;
	}
	public Date getReview_date() {
		return review_date;
	}
	public void setReview_date(Date review_date) {
		this.review_date = review_date;
	}

}
