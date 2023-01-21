package com.boot.jdbc.model.dto;

public class StickerDto {
	private int kids_no;
	private int sticker_count;
	
	
	public StickerDto() {}
	public StickerDto(int kids_no, int sticker_count) {
		super();
		this.kids_no = kids_no;
		this.sticker_count = sticker_count;
	}
	
	
	public int getKids_no() {
		return kids_no;
	}
	public void setKids_no(int kids_no) {
		this.kids_no = kids_no;
	}
	public int getSticker_count() {
		return sticker_count;
	}
	public void setSticker_count(int sticker_count) {
		this.sticker_count = sticker_count;
	}
	
	@Override
	public String toString() {
		return "StickerDto [kids_no=" + kids_no + ", sticker_count=" + sticker_count + "]";
	}


	
	 
}
