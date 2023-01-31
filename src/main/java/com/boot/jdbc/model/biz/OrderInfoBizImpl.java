package com.boot.jdbc.model.biz;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boot.jdbc.model.dao.OrderInfoMapper;
import com.boot.jdbc.model.dto.MemberDto;
import com.boot.jdbc.model.dto.OrderDto;
import com.boot.jdbc.model.dto.ReviewDto;

@Service
public class OrderInfoBizImpl implements OrderInfoBiz{

	@Autowired
	private OrderInfoMapper orderMapper;
	
	@Override
	public List<OrderDto> orderList(@Param("memberDto")MemberDto memberDto, @Param("startdate")String startdate, @Param("enddate")String enddate) {
		return orderMapper.orderList(memberDto, startdate, enddate);
	}

	@Override
	public List<OrderDto> orderDtoList(String user_id) {
		return orderMapper.orderDtoList(user_id);
	}

	@Override
	public OrderDto orderdto(String user_id) {
		return orderMapper.orderdto(user_id);
	}

	@Override
	public ReviewDto selectReview(String order_no) {
		return orderMapper.selectReview(order_no);
	}




}
