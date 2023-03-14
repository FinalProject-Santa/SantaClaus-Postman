package com.boot.jdbc.model.biz;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.boot.jdbc.model.dto.Criteria;
import com.boot.jdbc.model.dto.MemberDto;
import com.boot.jdbc.model.dto.PointDto;

public interface PointBiz {
	public int signUpPoint(String user_id);
	public int pointAll(String user_id);
//	public List<PointDto> selectList();
	public int countBoardListTotal();
	public List<PointDto> selectList(@Param("memberDto")MemberDto memberDto, @Param("cri")Criteria cri);
	public int insertPoint(PointDto pointDto);
	public PointDto selectpoint(String user_id);
	public void deletePoint(String user_id);
	//결제 창에서 결제하기 눌렀을 때 삽입 실행
//	public pointDto pointsave(pointDto dto);
//	public pointDto pointUse(pointDto dto);
}
