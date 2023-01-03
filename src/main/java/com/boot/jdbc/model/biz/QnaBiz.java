package com.boot.jdbc.model.biz;

import java.util.List;

import com.boot.jdbc.model.dto.QnaDto;

public interface QnaBiz {
	List<QnaDto> selectList();
	int insert(QnaDto dto);
	QnaDto selectOne(Integer qna_no);
		
}