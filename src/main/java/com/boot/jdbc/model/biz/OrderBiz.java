package com.boot.jdbc.model.biz;

import com.boot.jdbc.model.dto.MemberDto;
import com.boot.jdbc.model.dto.OrderDto;

public interface OrderBiz {
	public MemberDto memberInfo(String user_id);
	public int payment(OrderDto orderDto);
}
