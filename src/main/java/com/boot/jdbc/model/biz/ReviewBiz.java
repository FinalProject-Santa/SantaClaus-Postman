package com.boot.jdbc.model.biz;

import java.util.List;

import com.boot.jdbc.model.dto.ReviewDto;

public interface ReviewBiz {
	List<ReviewDto> rselectList();
	int insert(ReviewDto dto);
	ReviewDto rselectOne(int Review_no);
}
