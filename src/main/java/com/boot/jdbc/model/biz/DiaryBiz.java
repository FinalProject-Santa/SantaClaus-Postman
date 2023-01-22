package com.boot.jdbc.model.biz;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Map;

import com.boot.jdbc.model.dto.DiaryDto;

public interface DiaryBiz {

	public int insert(DiaryDto dto);
	//public void method(Map<Object, Object> map);
	public int saveDiary(Map<Object, Object> param);
	public int fillDiary(Map<Object, Object> param);
	
	public String selectPath(String user_id);
	
	public void sendMail(String userEmail, String filePath);
	
	public String selectDate(String userId, LocalDate now);
	public String fillDate(String userId, LocalDate localdate);
	
	//칭찬스티커
	public ArrayList<String> selectStickerDate(String userId);
	public int selectDiary(String kidsNo);
	public int deleteSticker(String kidsNo);
	public int insertSticker(String kidsNo, int stickerCount);
	
	//포인트
	public int insertPoint(int kidsNO);
	
	
}
