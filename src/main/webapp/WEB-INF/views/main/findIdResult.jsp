<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Find ID Result</title>
<link rel="shortcut icon" href="/resources/image/kids/favicon.ico">
<link href="/resources/css/main/findIdResult.css" rel="stylesheet">
</head>
<body>
	<div class="findId">
		<div class="closebutton">
			<div id="title">
				<h2>아이디 찾기</h2>
			</div>
			<p id="button">
				<input type="button" value="x" id="closebutton">
			</p>
		</div>
		<div id="findId-Result">
			<p id="IdResult">
				회원님의 아이디는 <b><c:out value="${id }"/></b> 입니다.
			</p>
			<div id="buttongroup">
				<p id="id">
					<input type="button" id="loginbutton" value="로그인" onclick="location.href='/main/loginForm'">
				</p>
				<p id="password">
					<input type="button" id="pwbutton" value="비밀번호 찾기" onclick="location.href='/main/findPwForm'">
				</p>
			</div>
		</div>
	</div>
</body>
</html>