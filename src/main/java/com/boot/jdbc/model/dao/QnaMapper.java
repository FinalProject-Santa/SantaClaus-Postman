package com.boot.jdbc.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Select;

import com.boot.jdbc.model.dto.QnaDto;
import com.boot.jdbc.model.dto.QnaFileDto;

@Mapper
public interface QnaMapper {
	
	@Insert("INSERT INTO QNA VALUES (#{qna_no},#{user_id}, #{qna_type}, #{qna_title}, NOW(), #{qna_content} )")
	@Options(useGeneratedKeys = true, keyProperty = "qna_no")
	int insert(QnaDto dto);
	
	@Select("SELECT * FROM QNA ORDER BY QNA_NO DESC")
	List<QnaDto> selectList();

	@Select("SELECT * FROM QNA WHERE QNA_NO=#{qna_no}")
	QnaDto selectOne(Integer qna_no);

	
	@Select("SELECT * FROM qnaFile WHERE QNA_NO=#{qna_no}")
	QnaDto getPicture(Integer qna_no);

	@Select("SELECT * FROM qnaFile")
	QnaDto selectAll();

	@Insert("INSERT INTO qnaFile(qna_no, file_id, file_oname,file_name,file_path) VALUES (#{qna_no}, #{file_id}, #{file_oname},#{file_name},#{file_path})")
	@Options(useGeneratedKeys = true, keyProperty = "file_id")
	int insertFile(QnaFileDto file);

	@Select("SELECT * FROM qnaFile WHERE QNA_NO=#{qna_no}")
	QnaFileDto selectFile(Integer qna_no);
}
