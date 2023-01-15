<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="refresh">
<title>Insert title here</title>
</head>


<script type="text/javascript">

/* function fn_qnaReply(url,origin_no){
	
	var form = document.createElement("form");
	form.setAttribute("action",url); //전달된 요청을 form 태그 action 속성값에 저장
	form.setAttribute("method","post");
	var origin_no_input = document.createElement("input");
	
	origin_no_input.setAttribute("type","hidden");
	origin_no_input.setAttribute("name","origin_no");
	origin_no_input.setAttribute("value",origin_no);
	
	form.appendChild(origin_no_input);
	document.body.appendChild(form);
	form.submit();	 
} */

</script>

<style>
  h1{display: inline;}
  div {
	margin-left: 30%;
	margin-right: 30%;
		}
  </style>
  
<body>
<div class="container">
<table border="1">
<tr>
	<th>작성자</th>
		<td>${dto.user_id}</td>
</tr>
<tr>
	<th>문의유형</th>
		<td>${dto.qna_type}
</tr>
<tr>
	<th>제목</th>
		<td>${dto.qna_title}</td>
</tr>
<tr>
	<th>내용</th>
		<td><textarea rows="10" cols="40" readonly="readonly">${dto.qna_content }</textarea></td>
</tr>

<c:if test="${not empty files.file_oname && files.file_oname != 'null'}">
<tr>
	<th></th>	
		<td><img src="/resources/files/${files.file_name}"></td>
</tr>
</c:if>
<tr>
	<td colspan="2">	
	<input type="button" value="목록" onclick="location.href='/customer/qnalist'">
	<input type="button" value="답글쓰기" onclick="location.href='/customer/qnaReply?qna_no=${dto.qna_no}&qna_type=${dto.qna_type}&secret=${dto.secret}'">
	</td>
	
</table>
</div>
</body>
</html>
