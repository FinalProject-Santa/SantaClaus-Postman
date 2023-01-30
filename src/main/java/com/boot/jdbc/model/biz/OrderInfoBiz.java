package com.boot.jdbc.model.biz;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.boot.jdbc.model.dto.LetterDto;
import com.boot.jdbc.model.dto.MemberDto;
import com.boot.jdbc.model.dto.OrderDto;
import com.boot.jdbc.model.dto.OrderInfoDto;


public interface OrderInfoBiz {
	public List<OrderInfoDto> orderList(@Param("memberDto")MemberDto memberDto, @Param("startdate")String startdate, @Param("enddate")String enddate);
//	public List<OrderDto> selectOrder();
//	public LetterTemplateDto templateDetail(int template_no);
//	public OptionDto optionDetail(int option_no);
	
//	//결제 창에서 결제하기 눌렀을 때 삽입 실행
//	public int orderInsert(OrderDto orderdto);
	
	public List<OrderDto> orderDtoList(String user_id);


}
