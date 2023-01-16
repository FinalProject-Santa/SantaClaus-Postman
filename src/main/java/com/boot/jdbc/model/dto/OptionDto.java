package com.boot.jdbc.model.dto;

public class OptionDto {	
	private int option_no;
	private String option_name;
	private int option_price;
	private String option_img;
	
	public OptionDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public OptionDto(int option_no, String option_name, int option_price, String option_img) {
		super();
		this.option_no = option_no;
		this.option_name = option_name;
		this.option_price = option_price;
		this.option_img = option_img;
	}

	public int getOption_no() {
		return option_no;
	}

	public void setOption_no(int option_no) {
		this.option_no = option_no;
	}

	public String getOption_name() {
		return option_name;
	}

	public void setOption_name(String option_name) {
		this.option_name = option_name;
	}

	public int getOption_price() {
		return option_price;
	}

	public void setOption_price(int option_price) {
		this.option_price = option_price;
	}

	public String getOption_img() {
		return option_img;
	}

	public void setOption_img(String option_img) {
		this.option_img = option_img;
	}
	

}
