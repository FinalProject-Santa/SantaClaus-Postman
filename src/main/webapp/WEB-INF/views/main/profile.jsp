<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="/resources/css/main/profile.css">

<body>
	<!-- header, 고객센터 -->
	<%@include file="../include/header.jsp" %>
	<%@include file="../include/floatingMenu.jsp" %>
	
	<div class="inner">
		<div class="profiles">
			<h1>프로필 계정을 선택 해주세요!</h1>
			<div class="parentProfile">
				<h3>부모 계정</h3>
				<a href="/main/login?name=${memberDto.name }">
					<img src="/resources/image/member-account/${memberDto.rfileName}"><br>
				</a>
				<span>${memberDto.name }</span>
			</div>
			<h3>어린이 계정</h3>
			<div class="childrenProfile">
				<c:forEach var="dto" items="${kidsDto }">
					<ul class="child">
						<li>
							<a href="/main/login?name=${dto.kids_nickname }">
								<img src="/resources/image/kids-account/${dto.kids_thumbnail}"><br>
							</a>
							<span>${dto.kids_nickname}</span>
						</li>
					</ul>
				</c:forEach>
			</div>
		</div>
	</div>
	
	
	<!-- footer -->
	<%@include file="../include/footer.jsp" %>
</body>
</html>

