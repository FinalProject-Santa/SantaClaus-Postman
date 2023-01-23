<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <header class="top-header">
		<nav class="navbar header-nav navbar-expand-lg">
            <div class="container">
				<a class="navbar-brand" href="index.html"><img src="/resources/image/main/logo.png" alt="image"></a>
				<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar-wd" aria-controls="navbar-wd" aria-expanded="false" aria-label="Toggle navigation">
					<span></span>
					<span></span>
					<span></span>
				</button>
                <div class="collapse navbar-collapse justify-content-end" id="navbar-wd">
                    <ul class="navbar-nav">
                    	<c:choose>
					      	<c:when test="${sessionScope.member != null }">
						      	<li class=""><span>${member.name }님</span> 반갑습니다</li>
						      	<li class=""></li>
						      	<input type="button" value="로그아웃" onclick="location.href='#">
		                    	<li><a href="../mypage/main">마이 페이지</a></li>
					      	</c:when>
					      	<c:otherwise>
					      		<li class="" onclick="location.href='/main/loginForm'">로그인</li>
					      	</c:otherwise>
					    </c:choose>
	                    <li><a href="../letter/letterList">엽서 목록</a></li>
	                    <li><a href="#">트리 꾸미기</a></li>
	                    <li><a href="../newyear/ny">연하장 전송</a></li>
	                    <li><a href="../review/reviewList">리뷰 게시판</a></li>
	                    <li><a href="../kids/main">키즈 페이지</a></li>
						<li><a href="../customer/floatingMenu">고객센터</a></li>
                    </ul>
                </div>
            </div>
        </nav>
	</header>
</body>
</html>