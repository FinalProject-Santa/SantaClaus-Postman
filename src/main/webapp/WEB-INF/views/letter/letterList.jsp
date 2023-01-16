<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

.content {
	display: grid;
	grid-template-columns: repeat(4, 1fr);
	column-gap: 30px;
	row-gap: 30px;
}
</style>
</head>
<body>
	<h2>엽서 템플릿 리스트</h2>
	<div class="content">
		<c:forEach var="list" items="${letterList }">
			<div>
				<a href="/letter/detail/${list.letter_no }?letterName=${list.letter_name }&letterImg=${list.letter_img }&letterPrice=${list.letter_price}">
					<img class="img-fluid" src="${list.letter_img }" alt="single image">
				</a>
			</div>
		</c:forEach>
	</div>
</body>
</html>