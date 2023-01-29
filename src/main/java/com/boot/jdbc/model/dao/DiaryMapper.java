package com.boot.jdbc.model.dao;

import java.time.LocalDate;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.boot.jdbc.model.dto.DiaryDto;

@Mapper
public interface DiaryMapper {
	
	@Insert("INSERT INTO DIARY VALUES(NULL,#{user_id},#{kids_no},#{diary_content},NOW(),#{phone})")
	int insert(DiaryDto dto);
	
	@Insert("INSERT INTO DIARY VALUES(NULL,#{userId},#{kidsNo},#{filePath},NOW(),#{userEmail})")
	int saveDiary(String userId, int kidsNo, String filePath, String userEmail);
	
	@Insert("INSERT INTO DIARY VALUES(NULL,#{userId},#{kidsNo},#{filePath},#{localdate},#{userEmail})")
	int fillDiary(String userId, int kidsNo, String filePath, LocalDate localdate, String userEmail);
	
	@Select("SELECT DIARY_CONTENT FROM DIARY WHERE USER_ID=#{user_id}")
	String selectPath(String user_id);
	
	@Select("SELECT WRITE_DATE FROM DIARY WHERE USER_ID=#{userId} AND WRITE_DATE=#{now}")
	String selectDate(String userId, LocalDate now);
	
	@Select("SELECT WRITE_DATE FROM DIARY WHERE USER_ID=#{userId} AND WRITE_DATE=#{localdate}")
	String fillDate(String userId, LocalDate localdate);
	
	//게임포인트
	@Update("UPDATE KIDS_SETTING SET KIDS_POINT=KIDS_POINT+5 WHERE KIDS_NO=${kidsNo}")
	int insertPoint(int kidsNo);
}
//UPDATE KIDS_SETTING SET KIDS_POINT=KIDS_POINT+5 WHERE KIDS_NO=1;
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
