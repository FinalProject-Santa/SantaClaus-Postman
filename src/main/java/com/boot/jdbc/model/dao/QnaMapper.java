package com.boot.jdbc.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.boot.jdbc.model.dto.QnaDto;

@Mapper
public interface QnaMapper {
	
	@Insert("INSERT INTO QNA(USER_ID, QNA_TYPE, QNA_TITLE, QNA_DATE, QNA_CONTENT) VALUES (#{user_id}, #{qna_type}, #{qna_title}, NOW(), #{qna_content})")
	int insert(QnaDto dto);
	
	@Select("SELECT * FROM QNA ORDER BY QNA_NO DESC")
	List<QnaDto> selectList();

	@Select("SELECT * FROM QNA WHERE QNA_NO=#{qna_no}")
	QnaDto selectOne(Integer qna_no);	



}
