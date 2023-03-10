<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<title>Find Pw</title>
<link rel="shortcut icon" href="/resources/image/kids/favicon.ico">
<link href="/resources/css/main/findPwResult.css" rel="stylesheet">
</head>
<body>

	<%@include file="../include/header.jsp" %>
	
	<div class='inner'>
	
	<div class="findPw">
		<div id="title">
			<h2>비밀번호 찾기</h2>
		</div>
		<div id="findPw-Result">
			<form method="post" action="/main/findpw">
           	<input type="text" name="number" id="number" class="memberinfo" placeholder="인증번호 입력*" style="border:none; border-bottom: 1px solid #c7c4c4;">
            <input type="hidden" name="temp" id="temp" class="memberinfo" value="${tempkey }">
            <input type="hidden" name="userId" id="userId" class="memberinfo" value="${userId }">
            <input type="submit" id="sendbutton" value="인증하기">
            </form>
			<c:choose>
            <c:when test="${!empty pw}">
			<p id="PwResult">
				회원님의 비밀번호는 <b><c:out value="${pw }"/></b> 입니다.
			</p>
			</c:when>
			<c:when test="${no eq 'no'}">
			<p>인증번호가 맞지 않습니다. 다시 입력해주세요.</p>
			</c:when>
			</c:choose>
			<div id="buttongroup">
				<p id="Pw">
					<input type="button" id="loginbutton" value="로그인" onclick="location.href='/main/loginForm'">
				</p>
			</div>
		</div>
	</div>
	
	</div>
	<%@include file="../include/footer.jsp" %>
	
</body>
</html>