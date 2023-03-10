package com.boot.jdbc.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.boot.jdbc.model.dto.QnaDto;
import com.boot.jdbc.model.dto.QnaFileDto;

@Mapper
public interface QnaMapper {
	
	//새로운 글 insert
	@Insert("INSERT INTO QNA VALUES (#{qna_no},#{user_id}, #{qna_type},#{qna_title},NOW(), #{qna_content},#{secret},0,0,0)")
	@Options(useGeneratedKeys = true, keyProperty = "qna_no")
	int insert(QnaDto dto);
	
	@Select("WITH RECURSIVE CTE AS\r\n"
			+ "(\r\n"
			+ "SELECT QNA_NO, USER_ID, QNA_TYPE, QNA_TITLE, QNA_DATE,QNA_CONTENT,ORIGIN_NO,GROUPORD,DEP,SECRET,\r\n"
			+ "QNA_NO AS PATH, 1 AS LEVEL FROM QNA\r\n"
			+ "WHERE ORIGIN_NO=0\r\n"
			+ "UNION ALL\r\n"
			+ "SELECT B.QNA_NO, B.USER_ID, B.QNA_TYPE, B.QNA_TITLE, B.QNA_DATE,B.QNA_CONTENT,B.ORIGIN_NO,B.GROUPORD,B.DEP,B.SECRET,\r\n"
			+ "CONCAT(C.PATH,\".\",B.QNA_NO) AS PATH,\r\n"
			+ "C.LEVEL+1 AS LEVEL\r\n"
			+ "FROM CTE C JOIN QNA B ON C.QNA_NO = B.ORIGIN_NO\r\n"
			+ ")\r\n"
			+ "SELECT QNA_NO, USER_ID ,QNA_TYPE , CONCAT(REPEAT(\" \", LEVEL*4), QNA_TITLE) QNA_TITLE ,QNA_DATE, QNA_CONTENT, \r\n"
			+ "ORIGIN_NO,DEP,SECRET, PATH, LEVEL FROM CTE ORDER BY PATH DESC;\r\n"
			+ "")
	List<QnaDto> selectList();
	
	
	
	@Select("SELECT * FROM QNA WHERE QNA_NO=#{qna_no}")
	QnaDto selectOne(Integer qna_no);

	
	@Select("SELECT * FROM QNA_FILE WHERE QNA_NO=#{qna_no}")
	QnaDto getPicture(Integer qna_no);

	@Select("SELECT * FROM QNA_FILE")
	QnaDto selectAll();

	@Insert("INSERT INTO QNA_FILE(qna_no, file_no, file_oname,file_name,file_path) VALUES (#{qna_no}, #{file_no}, #{file_oname},#{file_name},#{file_path})")
	@Options(useGeneratedKeys = true, keyProperty = "file_no")
	int insertFile(QnaFileDto file);

	@Select("SELECT * FROM QNA_FILE WHERE QNA_NO=#{qna_no}")
	QnaFileDto selectFile(Integer qna_no);

	
	//답글 insert
	@Insert("INSERT INTO QNA VALUES (#{qna_no},'ADMIN', #{qna_type}, #{qna_title}, NOW(), #{qna_content},#{secret},#{origin_no},1,1)")
	int insertReply(QnaDto dto);

	@Delete("DELETE FROM QNA WHERE QNA_NO=#{qna_no}")
	int deleteQna(int qna_no);
	
	@Delete("DELETE FROM QNA_FILE WHERE QNA_NO=#{qna_no}")
	int deleteQnafile(int qna_no);
	
	@Update("UPDATE QNA SET QNA_TITLE=#{qna_title}, QNA_CONTENT = #{qna_content}, SECRET=#{secret} WHERE QNA_NO=#{qna_no}")
	int updateQna(String qna_title, String qna_content, String secret, int qna_no);
	
	@Update("UPDATE QNA_FILE SET file_oname = #{file_oname}, file_name=#{file_name} "
			+ "WHERE QNA_NO=#{qna_no}")
	@Options(useGeneratedKeys = true, keyProperty = "file_no")
	int updateQnafile(QnaFileDto dto);
	
}
