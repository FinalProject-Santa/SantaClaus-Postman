package com.boot.jdbc.model.dto;

public class QnaFileDto {
	private int qna_no;
	private int file_id;
	private String file_oname;
	private String file_name;
	private String file_path;
	
	public QnaFileDto() {}
	public QnaFileDto(int qna_no, int file_id, String file_oname, String file_name, String file_path) {
		super();
		this.qna_no = qna_no;
		this.file_id = file_id;
		this.file_oname = file_oname;
		this.file_name = file_name;
		this.file_path = file_path;
	}  


	public int getQna_no() {
		return qna_no;
	}

	public void setQna_no(int qna_no) {
		this.qna_no = qna_no;
	}

	public int getFile_id() {
		return file_id;
	}

	public void setFile_id(int file_id) {
		this.file_id = file_id;
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

	public String getFile_path() {
		return file_path;
	}

	public void setFile_path(String file_path) {
		this.file_path = file_path;
	}
	
	
	

}
