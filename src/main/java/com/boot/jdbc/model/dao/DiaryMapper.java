package com.boot.jdbc.model.dao;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;

import com.boot.jdbc.model.dto.DiaryDto;

@Mapper
public interface DiaryMapper {
	
	@Insert("INSERT INTO DIARY VALUES(NULL,#{user_id},#{kids_no},#{diary_content},NOW(),#{phone})")
	int insert(DiaryDto dto);
}

//private int diary_no;
//private String user_id;
//private int kids_no;
//private String diary_content;
//private Date write_date;
//private String phone;
