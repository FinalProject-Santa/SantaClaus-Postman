package com.boot.jdbc.model.biz;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boot.jdbc.model.dao.QnaMapper;
import com.boot.jdbc.model.dto.QnaDto;

@Service
public class QnaBizImpl implements QnaBiz {
	
	@Autowired QnaMapper qnaMapper;
	
	@Override
	public int insert(QnaDto dto) {
		return qnaMapper.insert(dto);
	};
	
}
