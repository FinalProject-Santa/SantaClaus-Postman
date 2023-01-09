package com.boot.jdbc.model.biz;

import java.time.LocalDate;
import java.util.Map;

import com.boot.jdbc.model.dto.DiaryDto;

public interface DiaryBiz {

	public int insert(DiaryDto dto);
	//public void method(Map<Object, Object> map);
	public int saveImg(Map<Object, Object> param);
	public String selectPath(String user_id);
	
	public void sendMail(String userEmail, String filePath);
	public String selectDate(String userId, LocalDate now);
	
	
}
