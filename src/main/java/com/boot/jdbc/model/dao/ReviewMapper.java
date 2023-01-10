package com.boot.jdbc.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.boot.jdbc.model.dto.ReviewDto;
import com.boot.jdbc.model.dto.rFileDto;

@Mapper
public interface ReviewMapper {
	
	@Select("SELECT * FROM REVIEW ORDER BY REVIEW_NO DESC")
	List<ReviewDto> reviewList();

	@Select("SELECT * FROM REVIEW WHERE REVIEW_NO=#{review_no}")
	ReviewDto reviewDetail(int review_no);

	@Select("SELECT * FROM RFILES WHERE REVIEW_NO=#{review_no}")
	rFileDto rfileDetail(int review_no);
	
	@Insert("INSERT INTO REVIEW VALUES(#{review_no}, #{user_id}, #{review_title}, #{review_best}, #{review_content}, #{review_count}, NOW())")
	@Options(useGeneratedKeys = true, keyProperty = "review_no")
	int reviewInsert(ReviewDto reviewdto);
	
	@Insert("INSERT INTO RFILES (RFNO, REVIEW_NO, RFILENAME, RFILEORINAME, RFILEURL) VALUES (#{rfno},#{review_no},#{rfileName},#{rfileOriName},#{rfileUrl})")
	int fileInsert(rFileDto file);
	
	@Update("UPDATE REVIEW SET REVIEW_TITLE=#{review_title}, REVIEW_BEST=#{review_best}, REVIEW_CONTENT=#{review_content} WHERE REVIEW_NO=#{review_no} ")
	int reviewUpdate(ReviewDto reviewdto);
	
	@Delete(value = { "" })
	int reviewDelete(int review_no);
	
//	 review_no;
//	 user_id;
//	 review_title;
//	 review_best;
//	 review_content;
//	 review_count;
//	 review_date;
}
