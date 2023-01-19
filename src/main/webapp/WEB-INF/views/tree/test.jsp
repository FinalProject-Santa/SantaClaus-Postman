<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>

	
		<c:forEach items="${dtolist}" var="dto">
			<p>${dto.or_id }</p>
			<p>${dto.or_price }</p>
			<p>${dto.or_img }</p>
			<p>${dto.or_name }</p>
		</c:forEach>
	


</body>
</html>