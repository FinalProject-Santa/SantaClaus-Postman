<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link href="/resources/css/main/findPwResult.css" rel="stylesheet">
</head>
<body>
	<div class="findPw">
		<div id="title">
			<h2>비밀번호 찾기</h2>
		</div>
		<div id="findPw-Result">
			<p id="PwResult">
				회원님의 비밀번호는 <b><c:out value="${pw }"/></b> 입니다.
			</p>
			<div id="buttongroup">
				<p id="Pw">
					<input type="button" id="loginbutton" value="로그인" onclick="location.href='/main/loginForm'">
				</p>
			</div>
		</div>
	</div>
</body>
</html>