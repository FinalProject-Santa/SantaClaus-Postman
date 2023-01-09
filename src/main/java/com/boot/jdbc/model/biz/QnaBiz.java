package com.boot.jdbc.model.biz;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.boot.jdbc.model.dto.QnaDto;

public interface QnaBiz {
	List<QnaDto> selectList(); //문의목록
	int insert(QnaDto dto); //문의글 쓰기
	String getPicture(Integer qna_no); //파일업로드
	QnaDto selectOne(Integer qna_no); //글상세보기
		
}