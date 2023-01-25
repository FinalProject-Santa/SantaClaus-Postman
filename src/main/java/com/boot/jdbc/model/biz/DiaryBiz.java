package com.boot.jdbc.model.biz;

import java.time.LocalDate;

import com.boot.jdbc.model.dto.DiaryDto;

public interface DiaryBiz {

	public int insert(DiaryDto dto);
	public int saveDiary(String userId, int kidsNo, String filePath, String userEmail);
	public int fillDiary(String userId, int kidsNo, String filePath, LocalDate localdate, String userEmail);
	
	public String selectPath(String user_id);
	
	public void sendMail(String userEmail, String filePath);
	
	public String selectDate(String userId, LocalDate now);
	public String fillDate(String userId, LocalDate localdate);
	
	//게임포인트
	public int insertPoint(int kidsNo);
	
	
}
