package com.boot.jdbc.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.boot.jdbc.model.dto.KidFileDto;
import com.boot.jdbc.model.dto.KidsDto;
import com.boot.jdbc.model.dto.StickerDto;

@Mapper
public interface KidsMapper {
	
	//Select : 프로필 사진 뿌려줄때 file_type=1 로 가져오고 , 산타메일은 file_type=2
	
	
	//계정 만들때
	@Insert("INSERT INTO KIDS_SETTING(KIDS_POINT, KIDS_NICKNAME, KIDS_THUMBNAIL, USER_ID) VALUES (0,#{kids_nickname},#{kids_thumbnail},#{user_id})")
	@Options(useGeneratedKeys = true, keyProperty = "kids_no")
	int add(KidsDto dto);
	
	//편지 스트링 데이터 넣을때
	@Insert("INSERT INTO KIDS_SETTING(KIDS_LETTER_IMG) VALUES(#{kids_letter_img) WHERE KIDS_NO=#{kids_no}")
	int addmail(KidsDto dto);
	
	//프로필계정사진 (file_type = 1)
	@Insert("INSERT INTO KIDS_FILE(FILE_PATH, FILE_ONAME, FILE_NAME ,KIDS_NO, FILE_TYPE) VALUES(#{file_path},#{file_oname},#{file_name},#{kids_no},1)")
	@Options(useGeneratedKeys = true, keyProperty = "file_id")
	int addFile(KidFileDto file);
	
	//산타편지사진 (file_type = 2)
	@Insert("INSERT INTO KIDS_FILE(FILE_PATH, FILE_ONAME, FILE_NAME, KIDS_NO, FILE_TYPE) VALUES(#{file_path},#{file_oname},#{file_name},#{kids_no},2)")
	@Options(useGeneratedKeys = true, keyProperty = "file_id")
	int addFile2(KidFileDto file);
	
	@Select("SELECT * FROM KIDS_SETTING")
	List<KidsDto> allKids();
	
	@Select("SELECT * FROM STICKER")
	List<StickerDto> sticker();
	
	//계정 닉네임/썸네일 변경
	@Update("UPDATE KIDS_SETTING SET KIDS_THUMBNAIL = #{kids_thumbnail} , KIDS_NICKNAME = #{kids_nickname}) WHERE USER_ID=#{user_id}")
	int update(KidsDto dto);

	@Delete("DELETE FROM KIDS_FILE WHERE KIDS_NO=#{kids_no}")
	int deletefile(KidFileDto dto);
	
	@Delete("DELETE FROM KIDS_SETTING WHERE KIDS_NO=#{kids_no}")
	int delete(KidsDto dto);
	
	@Delete("DELETE FROM STICKER WHERE KIDS_NO=#{kids_no}")
	int deletesticker(StickerDto dto);

	
	

}