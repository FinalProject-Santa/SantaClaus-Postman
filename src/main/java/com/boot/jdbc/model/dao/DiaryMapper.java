package com.boot.jdbc.model.dao;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.boot.jdbc.model.dto.DiaryDto;

@Mapper
public interface DiaryMapper {
	
	@Insert("INSERT INTO DIARY VALUES(NULL,#{user_id},#{kids_no},#{diary_content},NOW(),#{phone})")
	int insert(DiaryDto dto);
	
	@Insert("INSERT INTO DIARY VALUES(NULL,#{userID},#{kidsNO},#{filePath},NOW(),#{userEmail})")
	int saveDiary(Map<Object, Object> param);
	
	@Insert("INSERT INTO DIARY VALUES(NULL,#{userID},#{kidsNO},#{filePath},#{localdate},#{userEmail})")
	int fillDiary(Map<Object, Object> param);
	
	@Select("SELECT DIARY_CONTENT FROM DIARY WHERE USER_ID=#{user_id}")
	String selectPath(String user_id);
	
	@Select("SELECT WRITE_DATE FROM DIARY WHERE USER_ID=#{userId} AND WRITE_DATE=#{now}")
	String selectDate(String userId, LocalDate now);
	
	@Select("SELECT WRITE_DATE FROM DIARY WHERE USER_ID=#{userId} AND WRITE_DATE=#{localdate}")
	String fillDate(String userId, LocalDate localdate);
	
	@Select("SELECT WRITE_DATE FROM DIARY WHERE USER_ID=#{userId}")
	ArrayList<String> selectStickerDate(String userId);
	
	@Select("SELECT COUNT(*) FROM DIARY WHERE USER_ID=#{userId}")
	int selectDiary(String userId);
	
	@Delete("DELETE FROM STICKER WHERE USER_ID=#{userId}")
	int deleteSticker(String userId);
	
	@Insert("INSERT INTO STICKER VALUES(#{userId},#{stickerCount})")
	int insertSticker(String userId, int stickerCount);
}

//AND WRITE_DATE<='2022-12-31'
//"userID":userId,
//"kidsNO":kidsNo,
//"phoneNum":phone
//private int diary_no;
//private String user_id;
//private int kids_no;
//private String diary_content;
//private Date write_date;
//private String phone;
