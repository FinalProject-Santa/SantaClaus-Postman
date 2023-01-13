<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
* {
	padding: 0;
	margin: 0;
}

body{
	width: 1000px;
	height: 2000px;
}
.content {
	display: grid; /*항상 일정한 비율로 개수가 정렬이 되도록 */
    grid-template-columns: repeat(4, 1fr);
}
</style>
</head>
<body>
	<h2>엽서 상세 페이지</h2>
	<%-- <div class="content">
		<div class="card1">
			<img src="/resources/image/letter/card${letterNo }.JPG">
		</div>
	</div> --%>
	<div class="content">
		<div class="card1">
			<img src="/resources/image/letter/card${letterNo }.JPG">
		</div>
	</div>
</body>
</html>