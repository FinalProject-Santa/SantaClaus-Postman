package com.boot.jdbc.model.dao;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;

import com.boot.jdbc.model.dto.QnaDto;

@Mapper
public interface QnaMapper {
	@Insert("INSERT INTO QNA(#{null}, #{user_id}, #{qna_type}, #{qna_title}, #{qna_date}, #{qna_content}")
	int insert(QnaDto dto);
	

}
