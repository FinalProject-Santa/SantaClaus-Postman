package com.boot.jdbc.model.biz;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.boot.jdbc.model.dao.QnaMapper;
import com.boot.jdbc.model.dto.QnaDto;

@Service
public class QnaBizImpl implements QnaBiz {
	
	@Autowired QnaMapper qnaMapper;
	
	@Override
	public int insert(MultipartFile files,QnaDto dto) throws IllegalStateException, IOException {
		files.transferTo(new File("C:\\Download"+files.getOriginalFilename()));;
		return qnaMapper.insert(files,dto);
	}

	@Override
	public List<QnaDto> selectList() {
		return qnaMapper.selectList();
	}

	@Override
	public QnaDto selectOne(Integer qna_no) {
		return qnaMapper.selectOne(qna_no);
	}
	
}
