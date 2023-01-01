<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table border="1">
<tr>
<th>작성자</th>
<td>${qna_dto.writer }</td>
</tr>
<tr>
<th>제목</th>
<td>${qna_dto.title }</td>
</tr>
<tr>
<th>내용</th>
<td><textarea rows="10" cols="40" readonly="readonly">${qna_dto.content }</textarea>
</td></tr>
<tr>
<td colspan="2">
<input type="button" value="목록" onclick="location.href='/customer/notice'">

</td>
</table>

</body>
</html>