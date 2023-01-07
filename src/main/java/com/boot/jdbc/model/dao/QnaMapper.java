package com.boot.jdbc.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.springframework.web.multipart.MultipartFile;

import com.boot.jdbc.model.dto.QnaDto;

@Mapper
public interface QnaMapper {
	
	@Insert("INSERT INTO QNA(USER_ID, QNA_TYPE, QNA_TITLE, QNA_DATE, QNA_CONTENT) VALUES (#{user_id}, #{qna_type}, #{qna_title}, NOW(), #{qna_content}), null")
	int insert(QnaDto dto);
	
	@Insert("INSERT INTO QNA(USER_ID, QNA_TYPE, QNA_TITLE, QNA_DATE, QNA_CONTENT) VALUES (#{user_id}, #{qna_type}, #{qna_title}, NOW(), #{qna_content}, #{files})")
	int insert(Map<String, Object> param, MultipartFile mFile, QnaDto dto);
	
	
	
	@Select("SELECT * FROM QNA ORDER BY QNA_NO DESC")
	List<QnaDto> selectList();

	@Select("SELECT * FROM QNA WHERE QNA_NO=#{qna_no}")
	QnaDto selectOne(Integer qna_no);

	

	

}
