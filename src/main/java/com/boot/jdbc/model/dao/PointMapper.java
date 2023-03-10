package com.boot.jdbc.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.boot.jdbc.model.dto.Criteria;
import com.boot.jdbc.model.dto.MemberDto;
import com.boot.jdbc.model.dto.PointDto;

@Mapper
public interface PointMapper {
   // 회원가입 축하 포인트 적립
   @Insert("INSERT INTO POINT VALUES(NULL, '', #{user_id}, +2000, NOW(), '회원가입 축하 포인트','적립', 2000)")
   int signUpPoint(String user_id);
   
   // 현재 포인트 가져오기
   @Select("SELECT POINT_ALL FROM `POINT` WHERE USER_ID=#{user_id} ORDER BY POINT_NO DESC limit 1")
   int pointAll(String user_id);

//   @Select(" SELECT * FROM POINT ORDER BY ORDER_NO DESC ")
//   List<PointDto> selectList();

   @Select(" SELECT COUNT(*) FROM POINT ")
   int countBoardList();

   @Select(" SELECT * FROM `POINT` WHERE USER_ID=#{memberDto.user_id} ORDER BY POINT_NO DESC LIMIT #{cri.pageStart}, #{cri.perPageNum} ")
   List<PointDto> selectList(@Param("memberDto")MemberDto memberDto, @Param("cri")Criteria cri);

   @Insert("INSERT INTO POINT VALUES(NULL, #{order_no}, #{user_id}, #{point}, NOW(), #{point_content}, #{point_purpose}, #{point_all})")
   int insertPoint(PointDto pointDto);

   @Select(" SELECT * FROM POINT WHERE USER_ID=#{user_id} ORDER BY POINT_NO DESC ")
   PointDto selectpoint(String user_id);

   @Delete(" DELETE FROM POINT WHERE USER_ID=#{user_id} ")
   void deletePoint(String user_id);
}