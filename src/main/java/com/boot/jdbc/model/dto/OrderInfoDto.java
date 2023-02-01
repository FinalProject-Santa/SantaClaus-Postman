package com.boot.jdbc.model.dto;

import java.util.Date;
import java.util.List;

public class OrderInfoDto {
	private String order_no;
	private Date order_date;
	private String letter_name;
	private String letter_img;
	private List<String> option_name;
	private List<String> option_img;
	private int total_price;
	private int review_no;
	public OrderInfoDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public OrderInfoDto(String order_no, Date order_date, String letter_name, String letter_img,
			List<String> option_name, List<String> option_img, int total_price, int review_no) {
		super();
		this.order_no = order_no;
		this.order_date = order_date;
		this.letter_name = letter_name;
		this.letter_img = letter_img;
		this.option_name = option_name;
		this.option_img = option_img;
		this.total_price = total_price;
		this.review_no = review_no;
	}
	public String getOrder_no() {
		return order_no;
	}
	public void setOrder_no(String order_no) {
		this.order_no = order_no;
	}
	public Date getOrder_date() {
		return order_date;
	}
	public void setOrder_date(Date order_date) {
		this.order_date = order_date;
	}
	public String getLetter_name() {
		return letter_name;
	}
	public void setLetter_name(String letter_name) {
		this.letter_name = letter_name;
	}
	public String getLetter_img() {
		return letter_img;
	}
	public void setLetter_img(String letter_img) {
		this.letter_img = letter_img;
	}
	public List<String> getOption_name() {
		return option_name;
	}
	public void setOption_name(List<String> option_name) {
		this.option_name = option_name;
	}
	public List<String> getOption_img() {
		return option_img;
	}
	public void setOption_img(List<String> option_img) {
		this.option_img = option_img;
	}
	public int getTotal_price() {
		return total_price;
	}
	public void setTotal_price(int total_price) {
		this.total_price = total_price;
	}
	public int getReview_no() {
		return review_no;
	}
	public void setReview_no(int review_no) {
		this.review_no = review_no;
	}
	
	
	
		
}
