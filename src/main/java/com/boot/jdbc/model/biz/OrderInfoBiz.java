package com.boot.jdbc.model.biz;

import java.util.List;

import com.boot.jdbc.model.dto.LetterDto;
import com.boot.jdbc.model.dto.OrderInfoDto;


public interface OrderInfoBiz {
	public List<OrderInfoDto> orderList();
//	public List<OrderDto> selectOrder();
//	public LetterTemplateDto templateDetail(int template_no);
//	public OptionDto optionDetail(int option_no);
	
//	//결제 창에서 결제하기 눌렀을 때 삽입 실행
//	public int orderInsert(OrderDto orderdto);


}
