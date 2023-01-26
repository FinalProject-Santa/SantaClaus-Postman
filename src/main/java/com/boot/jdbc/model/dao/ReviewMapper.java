package com.boot.jdbc.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.boot.jdbc.model.dto.Criteria;
import com.boot.jdbc.model.dto.ReviewDto;
import com.boot.jdbc.model.dto.rFileDto;

@Mapper
public interface ReviewMapper {
	
	@Select("SELECT * FROM REVIEW ORDER BY REVIEW_NO DESC LIMIT #{pageStart}, #{perPageNum}")
	List<Map<String, Object>> reviewList(Criteria cri);
	
	@Select("SELECT COUNT(*) FROM REVIEW")
	int countBoardList();
	
	
	@Select("SELECT * FROM REVIEW WHERE REVIEW_NO=#{review_no}")
	ReviewDto reviewDetail(int review_no);

	@Select("SELECT * FROM RFILES WHERE REVIEW_NO=#{review_no}")
	rFileDto rfileDetail(int review_no);
	
	@Insert("INSERT INTO REVIEW VALUES(NULL, #{user_id}, #{review_title}, #{review_best}, #{review_content}, #{review_count}, NOW(), #{rimg})")
	@Options(useGeneratedKeys = true, keyProperty = "review_no")
	int reviewInsert(ReviewDto reviewdto);
	
	@Insert("INSERT INTO RFILES (RF_NO, REVIEW_NO, RFILE_NAME, RFILE_ORINAME, RFILE_URL) VALUES (NULL,#{review_no},#{rfile_name},#{rfile_oriname},#{rfile_url})")
	int fileInsert(rFileDto file);
	
	@Update("UPDATE REVIEW SET REVIEW_TITLE=#{review_title}, REVIEW_BEST=#{review_best}, REVIEW_CONTENT=#{review_content} WHERE REVIEW_NO=#{review_no} ")
	int reviewUpdate(ReviewDto reviewdto);

	@Update("UPDATE RFILES SET RFILE_NAME=#{rfile_name}, RFILE_ORINAME=#{rfile_oriname} WHERE REVIEW_NO=#{review_no}")
	int rfileUpdate(rFileDto rfiledto);
	
	//조회수 증가
	@Update("UPDATE REVIEW SET REVIEW_COUNT=REVIEW_COUNT+1 WHERE REVIEW_NO=#{review_no}")
	int reviewCountUpdate(int review_no);
	
	@Delete("DELETE FROM REVIEW WHERE REVIEW_NO=#{review_no}")
	int reviewDelete(int review_no);
	
	@Delete("DELETE FROM RFILES WHERE REVIEW_NO=#{review_no}")	
	int rfileDelete(int review_no);
//	 review_no;
//	 user_id;
//	 review_title;
//	 review_best;
//	 review_content;
//	 review_count;
//	 review_date;
}
