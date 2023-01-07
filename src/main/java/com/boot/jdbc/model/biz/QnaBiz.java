package com.boot.jdbc.model.biz;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.boot.jdbc.model.dto.QnaDto;

public interface QnaBiz {
	List<QnaDto> selectList();
	int insert(QnaDto dto); //첨부파일 없는 글 insert
	int insert(Map<String, Object> param ,MultipartFile mFile,QnaDto dto); //첨부파일이 있는 글 insert
	QnaDto selectOne(Integer qna_no);
		
}