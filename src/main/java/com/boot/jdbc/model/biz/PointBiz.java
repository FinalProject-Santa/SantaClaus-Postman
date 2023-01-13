package com.boot.jdbc.model.biz;

import java.util.List;

import com.boot.jdbc.model.dto.PointDto;

public interface PointBiz {
	public int pointAll(String user_id);
	public List<PointDto> selectList();
	
	//결제 창에서 결제하기 눌렀을 때 삽입 실행
//	public pointDto pointsave(pointDto dto);
//	public pointDto pointUse(pointDto dto);
}
