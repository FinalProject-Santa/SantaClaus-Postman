package com.boot.jdbc.model.biz;

import java.util.List;

import com.boot.jdbc.model.dto.LetterDto;
import com.boot.jdbc.model.dto.OrderDto;
import com.boot.jdbc.model.dto.OrderInfoDto;
import com.boot.jdbc.model.dto.ReviewDto;


public interface OrderInfoBiz {
//	public List<OrderDto> orderList(@Param("user_id")String user_id, @Param("startdate")String startdate, @Param("enddate")String enddate);
	public List<OrderDto> orderList(String user_id, String startdate, String enddate);
//	public List<OrderDto> selectOrder();
//	public LetterTemplateDto templateDetail(int template_no);
//	public OptionDto optionDetail(int option_no);
	
//	//결제 창에서 결제하기 눌렀을 때 삽입 실행
//	public int orderInsert(OrderDto orderdto);
	
	public List<OrderDto> orderDtoList(String user_id);
	public OrderDto orderdto(String user_id);
	
	//리뷰 작성 버튼 기능(조회수 가져오기)
	public ReviewDto selectReview(String order_no);

	public List<OrderInfoDto> selectOption(String option_name);
	public LetterDto selectLetter(String letter_name);
}
