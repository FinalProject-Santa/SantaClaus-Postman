package com.boot.jdbc.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boot.jdbc.model.dao.CartMapper;
import com.boot.jdbc.model.dto.CartDto;

@Service
public class CartBizImpl implements CartBiz{
	
	@Autowired
	private CartMapper cartmapper;

	@Override
	public List<CartDto> cartList(String user_id) {
		return cartmapper.cartList(user_id);
	}

	@Override
	public int delete(String user_id, int cart_no) {
		return cartmapper.delete(user_id, cart_no);
	}
	
	
	
	
	
	
}
