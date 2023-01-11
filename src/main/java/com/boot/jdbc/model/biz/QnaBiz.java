package com.boot.jdbc.model.biz;

import java.util.List;

import com.boot.jdbc.model.dto.QnaDto;
import com.boot.jdbc.model.dto.QnaFileDto;

public interface QnaBiz {
	List<QnaDto> selectList(); //문의목록
	int insert(QnaDto dto); //문의글 쓰기
	int insertFile(QnaFileDto file); //파일넣기
	QnaDto selectOne(Integer qna_no); //글상세보기
	QnaFileDto selectFile(Integer qna_no);
}