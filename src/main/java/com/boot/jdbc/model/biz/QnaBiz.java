package com.boot.jdbc.model.biz;

import java.io.IOException;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.boot.jdbc.model.dto.QnaDto;

public interface QnaBiz {
	List<QnaDto> selectList();
	int insert(MultipartFile file, QnaDto dto) throws IllegalStateException, IOException;
	QnaDto selectOne(Integer qna_no);
		
}