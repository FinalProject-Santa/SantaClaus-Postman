package com.boot.jdbc.model.biz;

import com.boot.jdbc.model.dto.MemberDto;
import com.boot.jdbc.model.dto.OrderDto;
import com.boot.jdbc.model.dto.TreeOrderDto;

public interface OrderBiz {
	//회원정보 가져오기
	public MemberDto memberInfo(String user_id);
	//엽서, 옵션상품 구매
	public int payment(OrderDto orderDto);
	//트리장식품 구매
	public int treePayment(TreeOrderDto orderDto);
}
