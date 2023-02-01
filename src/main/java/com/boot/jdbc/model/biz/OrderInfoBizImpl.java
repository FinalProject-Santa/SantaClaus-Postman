package com.boot.jdbc.model.biz;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boot.jdbc.model.dao.OrderInfoMapper;
import com.boot.jdbc.model.dto.LetterDto;
import com.boot.jdbc.model.dto.MemberDto;
import com.boot.jdbc.model.dto.OptionDto;
import com.boot.jdbc.model.dto.OrderDto;
import com.boot.jdbc.model.dto.ReviewDto;

@Service
public class OrderInfoBizImpl implements OrderInfoBiz{

	@Autowired
	private OrderInfoMapper orderMapper;
	
//	@Override
//	public List<OrderDto> orderList(@Param("user_id")String user_id, @Param("startdate")String startdate, @Param("enddate")String enddate) {
//		return orderMapper.orderList(user_id, startdate, enddate);
//	}
	@Override
	public List<OrderDto> orderList(String user_id, String startdate, String enddate) {
		return orderMapper.orderList(user_id, startdate, enddate);
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

	@Override
	public OptionDto selectOption(String option_name) {
		return orderMapper.selectOption(option_name);
	}

	@Override
	public LetterDto selectLetter(String letter_name) {
		return orderMapper.selectLetter(letter_name);
	}




}
