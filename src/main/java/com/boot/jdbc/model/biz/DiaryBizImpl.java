package com.boot.jdbc.model.biz;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boot.jdbc.model.dao.DiaryMapper;
import com.boot.jdbc.model.dto.DiaryDto;

@Service
public class DiaryBizImpl implements DiaryBiz{
	
	@Autowired
	private DiaryMapper diaryMapper;

	@Override
	public int insert(DiaryDto dto) {
		
		return 0;
	}
	
	
}
