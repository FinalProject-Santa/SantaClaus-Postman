<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>sdfsdf</title>
</head>
<body>

	<img alt="" src="${myimg }"> 
		<c:forEach items="${dtolist}" var="dto">
			<p>${dto.or_id }</p>
			<p>${dto.or_price }</p>
			<p>${dto.or_img }</p>
			<p>${dto.or_name }</p>
		</c:forEach>
	
<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.9.0/jquery.js"></script>
<script type="text/javascript">

</script>

</body>
</html>