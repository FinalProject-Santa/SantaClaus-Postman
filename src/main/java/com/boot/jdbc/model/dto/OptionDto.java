package com.boot.jdbc.model.dto;

import java.util.List;

public class OptionDto {	
	private int option_no;
	private String option_name;
	private int option_price;
	private String option_img;
	private int option_quantity;
	public List<OptionDto> optionDtoList;
	
	public OptionDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public OptionDto(int option_no, String option_name, int option_price, String option_img, int option_quantity) {
		super();
		this.option_no = option_no;
		this.option_name = option_name;
		this.option_price = option_price;
		this.option_img = option_img;
		this.option_quantity = option_quantity;
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

	public int getoption_quantity() {
		return option_quantity;
	}

	public void setoption_quantity(int option_quantity) {
		this.option_quantity = option_quantity;
	}

	public List<OptionDto> getOptionDtoList() {
		return optionDtoList;
	}

	public void setOptionDtoList(List<OptionDto> optionDtoList) {
		this.optionDtoList = optionDtoList;
	}

}
