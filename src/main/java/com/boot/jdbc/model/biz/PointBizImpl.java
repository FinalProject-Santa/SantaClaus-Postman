package com.boot.jdbc.model.biz;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boot.jdbc.model.dao.PointMapper;
import com.boot.jdbc.model.dto.Criteria;
import com.boot.jdbc.model.dto.MemberDto;
import com.boot.jdbc.model.dto.PointDto;

@Service
public class PointBizImpl implements PointBiz{
	
	@Autowired
	private PointMapper pointMapper;

	@Override
	public int signUpPoint(String user_id) {
		return pointMapper.signUpPoint(user_id);
	}

	@Override
	public int pointAll(String user_id) {
		return pointMapper.pointAll(user_id);
	}

	@Override
	public int countBoardListTotal() {
		// TODO Auto-generated method stub
		return pointMapper.countBoardList();
	}

	@Override
	public List<PointDto> selectList(@Param("memberDto")MemberDto memberDto, @Param("cri")Criteria cri) {
		// TODO Auto-generated method stub
		return pointMapper.selectList(memberDto, cri);
	}

	@Override
	public int insertPoint(PointDto pointDto) {
		return pointMapper.insertPoint(pointDto);
	}

	@Override
	public PointDto selectpoint(String user_id) {
		return pointMapper.selectpoint(user_id);
	}
	

	
	//결제 창에서 결제하기 눌렀을 때 삽입 실행
//	@Override
//	public pointDto pointsave(pointDto dto) {
//		return pointMapper.pointsave(dto);
//	}
//
//	@Override
//	public pointDto pointUse(pointDto dto) {
//		return pointMapper.pointUse(dto);
//	}
	
	
	
}
