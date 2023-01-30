package com.boot.jdbc.model.biz;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boot.jdbc.model.dao.OrderInfoMapper;
import com.boot.jdbc.model.dto.LetterDto;
import com.boot.jdbc.model.dto.MemberDto;
import com.boot.jdbc.model.dto.OrderDto;
import com.boot.jdbc.model.dto.OrderInfoDto;

@Service
public class OrderInfoBizImpl implements OrderInfoBiz{

	@Autowired
	private OrderInfoMapper orderMapper;
	
	@Override
	public List<OrderInfoDto> orderList(@Param("memberDto")MemberDto memberDto, @Param("startdate")String startdate, @Param("enddate")String enddate) {
		return orderMapper.orderList(memberDto, startdate, enddate);
	}

	@Override
	public List<OrderDto> orderDtoList(String user_id) {
		return orderMapper.orderDtoList(user_id);
	}

//	@Override
//	public List<OrderDto> selectOrder() {
//		
//		return orderMapper.selectOrder();
//	}

//	@Override
//	public LetterTemplateDto templateDetail(int template_no) {
//		// TODO Auto-generated method stub
//		return null;
//	}

//	@Override
//	public OptionDto optionDetail(int option_no) {
//		// TODO Auto-generated method stub
//		return null;
//	}

	
	//결제 창에서 결제하기 눌렀을 때 삽입 실행
//	@Override
//	public int orderInsert(OrderDto orderdto) {
//		// TODO Auto-generated method stub
//		return 0;
//	}


}
