package com.boot.jdbc.model.biz;

import com.boot.jdbc.model.dto.MemberDto;

public interface OrderBiz {
	public MemberDto memberInfo(String user_id);
}
