package com.boot.jdbc.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boot.jdbc.model.dao.PointMapper;
import com.boot.jdbc.model.dto.PointDto;

@Service
public class PointBizImpl implements PointBiz{
	
	@Autowired
	private PointMapper pointMapper;

	@Override
	public int pointAll(String user_id) {
		return pointMapper.pointAll(user_id);
	}

	@Override
	public List<PointDto> selectList() {
		return pointMapper.selectList();
	}

	
	//결제 창에서 결제하기 눌렀을 때 삽입 실행
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
