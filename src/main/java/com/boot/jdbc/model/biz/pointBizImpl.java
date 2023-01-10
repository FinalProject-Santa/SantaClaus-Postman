package com.boot.jdbc.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boot.jdbc.model.dao.pointMapper;
import com.boot.jdbc.model.dto.pointDto;

@Service
public class pointBizImpl implements pointBiz{
	
	@Autowired
	private pointMapper pointMapper;

//	@Override
//	public int pointAll(String user_id) {
//		return pointMapper.pointAll(user_id);
//	}

	@Override
	public List<pointDto> selectList() {
		return pointMapper.selectList();
	}

//	@Override
//	public pointDto pointsave(pointDto dto) {
//		return pointMapper.pointsave(dto);
//	}
//
//	@Override
//	public pointDto pointUse(pointDto dto) {
//		return pointMapper.pointUse(dto);
//	}
}
