package com.boot.jdbc.model.biz;

import com.boot.jdbc.model.dto.MemberDto;
import com.boot.jdbc.model.dto.pointDto;

public interface pointBiz {
	public int pointAll(String user_id);
	public pointDto pointsave(pointDto dto);
	public pointDto pointUse(pointDto dto);
}
