package com.boot.jdbc.model.dto;

public class LetterDto {
	private int letter_no;
	private String letter_name;
	private int letter_price;
	private String letter_img;
	private String child_name;
	private String address;
	private String ps;
	
	public LetterDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public LetterDto(int letter_no, String letter_name, int letter_price, String letter_img, String child_name,
			String address, String ps) {
		super();
		this.letter_no = letter_no;
		this.letter_name = letter_name;
		this.letter_price = letter_price;
		this.letter_img = letter_img;
		this.child_name = child_name;
		this.address = address;
		this.ps = ps;
	}

	public int getLetter_no() {
		return letter_no;
	}

	public void setLetter_no(int letter_no) {
		this.letter_no = letter_no;
	}

	public String getLetter_name() {
		return letter_name;
	}

	public void setLetter_name(String letter_name) {
		this.letter_name = letter_name;
	}

	public int getLetter_price() {
		return letter_price;
	}

	public void setLetter_price(int letter_price) {
		this.letter_price = letter_price;
	}

	public String getLetter_img() {
		return letter_img;
	}

	public void setLetter_img(String letter_img) {
		this.letter_img = letter_img;
	}

	public String getChild_name() {
		return child_name;
	}

	public void setChild_name(String child_name) {
		this.child_name = child_name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPs() {
		return ps;
	}

	public void setPs(String ps) {
		this.ps = ps;
	}
}
