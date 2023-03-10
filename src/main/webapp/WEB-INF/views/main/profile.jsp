<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<title>Profile</title>
<link rel="shortcut icon" href="/resources/image/kids/favicon.ico">
<link rel="stylesheet" href="/resources/css/main/profile.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("#menu").css("color","white");
		
	});
</script>
<body>
	<!-- header, 고객센터 -->
	<%@include file="../include/header.jsp" %>
	<%@include file="../include/floatingMenu.jsp" %>
	
	<div class="inner">
		<div class="profiles">
			<h1 id="title">프로필 계정을 선택 해주세요!</h1>
			<div class="parentProfile">
				<h3 id="p">•부모 계정•</h3>
				<a href="/main/login?name=${memberDto.name }">
					<img src="/resources/files/${memberDto.rfileName}"><br>
				</a>
				<span id="pname">${memberDto.name }</span>
			</div>
			<div class="childrenProfile">
				<c:forEach var="dto" items="${kidsDto }">
				<c:if test="${!empty dto.kids_nickname  } ">
					<h3 id="c">•어린이 계정•</h3>
				</c:if>
					<ul class="child">
						<li>
							<a href="/main/login?name=${dto.kids_nickname }">
								<img src="/resources/files/${dto.kids_thumbnail}"><br>
								<span id="cname">${dto.kids_nickname}</span>
							</a>
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

