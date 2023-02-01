<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<title>프로필 선택</title>
<link rel="shortcut icon" href="/resources/image/kids/favicon.ico">
<link rel="stylesheet" href="/resources/css/kids/kidsprofile.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("#menu").css("color","white");
		
	});
</script>
<body>

	<%@include file="../include/kidsheader.jsp" %>
	
	<div class="inner">
	
		<div class="profiles">
		
			<h1 id="title">프로필 계정을 선택 해주세요!</h1>
			<div class="childrenProfile">
				<c:forEach var="dto" items="${kidsDto }">
					<ul class="child">
						<li>
							<a href="/main/login?name=${dto.kids_nickname }">
								<img src="/resources/image/LJYFiles/${dto.kids_thumbnail}"><br>
							</a>
							<span id="nickname">${dto.kids_nickname}</span>
						</li>
					</ul>
				</c:forEach>
			</div>
			
		</div> <!-- profiles -->
		
	</div> <!-- inner -->
	
	
	<!-- footer -->
	<%@include file="../include/kidsfooter.jsp" %>
</body>
</html>

