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
<tr>
	<th></th>	
		<td><img src="/resources/files/${files.file_name}"></td>
</tr>

<tr>
	<td colspan="2">	
	<input type="button" value="목록" onclick="location.href='/customer/qnalist'">
	</td>
	
</table>
</div>
</body>
</html>
