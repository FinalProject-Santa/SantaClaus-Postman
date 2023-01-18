package com.boot.jdbc.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boot.jdbc.model.dao.OrderInfoMapper;
import com.boot.jdbc.model.dto.LetterDto;
import com.boot.jdbc.model.dto.OrderInfoDto;

@Service
public class OrderBizInfoImpl implements OrderInfoBiz{

	@Autowired
	private OrderInfoMapper orderMapper;
	
	@Override
	public List<OrderInfoDto> orderList() {
		return orderMapper.orderList();
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
