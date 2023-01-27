package com.boot.jdbc.model.biz;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boot.jdbc.model.dao.OrderMapper;
import com.boot.jdbc.model.dto.MemberDto;
import com.boot.jdbc.model.dto.OrderDto;
import com.boot.jdbc.model.dto.TreeOrderDto;

@Service
public class OrderBizImpl implements OrderBiz{

	@Autowired
	private OrderMapper orderMapper;

	@Override
	public MemberDto memberInfo(String user_id) {
		return orderMapper.memberInfo(user_id);
	}

	@Override
	public int payment(OrderDto orderDto) {
		return orderMapper.payment(orderDto);
	}

	@Override
	public int treePayment(TreeOrderDto orderDto) {
		// TODO Auto-generated method stub
		return orderMapper.treePayment(orderDto);
	}


}
