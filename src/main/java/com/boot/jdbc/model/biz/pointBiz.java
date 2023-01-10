package com.boot.jdbc.model.biz;

import java.util.List;

import com.boot.jdbc.model.dto.pointDto;

public interface pointBiz {
//	public int pointAll(String user_id);
	public List<pointDto> selectList();
//	public pointDto pointsave(pointDto dto);
//	public pointDto pointUse(pointDto dto);
}
