package com.boot.jdbc.model.dto;

public class KidFileDto {
	private int file_id;
	private String file_path;
	private String file_oname;
	private String file_name;
	private int kids_no;
	private int file_type;
	
	public KidFileDto() {}
	public KidFileDto(int file_id, String file_path, String file_oname, String file_name, int kids_no, int file_type) {
		super();
		this.file_id = file_id;
		this.file_path = file_path;
		this.file_oname = file_oname;
		this.file_name = file_name;
		this.kids_no = kids_no;
		this.file_type = file_type;
	}
	public int getFile_id() {
		return file_id;
	}
	public void setFile_id(int file_id) {
		this.file_id = file_id;
	}
	public String getFile_path() {
		return file_path;
	}
	public void setFile_path(String file_path) {
		this.file_path = file_path;
	}
	public String getFile_oname() {
		return file_oname;
	}
	public void setFile_oname(String file_oname) {
		this.file_oname = file_oname;
	}
	public String getFile_name() {
		return file_name;
	}
	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}
	public int getKids_no() {
		return kids_no;
	}
	public void setKids_no(int kids_no) {
		this.kids_no = kids_no;
	}
	
	public int getFile_type() {
		return file_type;
	}
	public void setFile_type(int file_type) {
		this.file_type = file_type;
	}
	
	

}
