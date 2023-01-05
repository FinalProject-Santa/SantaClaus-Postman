package com.boot.jdbc.model.dto;

public class FileDto {


private int file_id; //시퀀스
private Integer qna_no;
private String file_oname; // 오리지널 이름 
private String file_lname; //서버 올라갔을때 파일이름
private String file_lpath; //서버 경로
private String file_ext; //파일확장자
private int file_size;


public FileDto(int file_id, Integer qna_no, String file_oname, String file_lname, String file_lpath, String file_ext,
		int file_size) {
	super();
	this.file_id = file_id;
	this.qna_no = qna_no;
	this.file_oname = file_oname;
	this.file_lname = file_lname;
	this.file_lpath = file_lpath;
	this.file_ext = file_ext;
	this.file_size = file_size;
}


public int getFile_id() {
	return file_id;
}


public void setFile_id(int file_id) {
	this.file_id = file_id;
}


public Integer getQna_no() {
	return qna_no;
}


public void setQna_no(Integer qna_no) {
	this.qna_no = qna_no;
}


public String getFile_oname() {
	return file_oname;
}


public void setFile_oname(String file_oname) {
	this.file_oname = file_oname;
}


public String getFile_lname() {
	return file_lname;
}


public void setFile_lname(String file_lname) {
	this.file_lname = file_lname;
}


public String getFile_lpath() {
	return file_lpath;
}


public void setFile_lpath(String file_lpath) {
	this.file_lpath = file_lpath;
}


public String getFile_ext() {
	return file_ext;
}


public void setFile_ext(String file_ext) {
	this.file_ext = file_ext;
}


public int getFile_size() {
	return file_size;
}


public void setFile_size(int file_size) {
	this.file_size = file_size;
}





}
