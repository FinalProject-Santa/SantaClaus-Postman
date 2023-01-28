<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="/resources/css/letter/letterList.css">

<body>
	<!-- header, 고객센터 -->
	<%@include file="../include/header.jsp" %>
	<%@include file="../include/floatingMenu.jsp" %>
	
	<div class="inner">
		<h1>프로필 계정을 선택 해주세요!</h1>
		<h3>부모 계정</h3>
		<div class="parentProfile">
			<a href="#">
				<img src="/resources/image/member-account/${memberDto.rfileName}"><br>
			</a>
			<span>${memberDto.name }</span>
		</div>
		<h3>어린이 계정</h3>
		<div class="childrenProfile" style="display: flex; background-repeat: no-repeat;">
			<c:forEach var="dto" items="${kidsDto }">
				<div class="child">
					<a href="#">
						<img src="dto.kids_thumbnail"><br>
					</a>
					<span>dto.kids_nickname</span>
				</div>
			</c:forEach>
		</div>
	</div>
</body>
</html>

