package com.boot.jdbc.model.biz;

import java.util.List;

import com.boot.jdbc.model.dto.CartDto;

public interface CartBiz {

	List<CartDto> cartList(String user_id, int letterNo, String optionNo);
	int delete(String user_id, int cart_no);
}
