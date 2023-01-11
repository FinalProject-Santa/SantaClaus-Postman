package com.boot.jdbc.model.biz;

import java.util.List;

import com.boot.jdbc.model.dto.PointDto;

public interface PointBiz {
	public int pointAll(String user_id);
	public List<PointDto> selectList();
//	public pointDto pointsave(pointDto dto);
//	public pointDto pointUse(pointDto dto);
}
