<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link rel="stylesheet" href="/resources/css/kids/puzzle.css">

<body>
	<%@include file="../include/header.jsp" %>
	<div class="santa_puzzle">
        <span>산타</span><br>
        <span>퍼즐 맞추기</span>
    </div>
    <div class="start_button">
    <input type="button" class="level1-button" value="1단계 시작" 
    												onclick="location.href='/kids/onelevel'">
    <input type="button" class="level2-button" value="같은 그림" 
    												onclick="location.href='/kids/samegame'">
    </div>
    <p>
    <img>
    </p>
</body>
</html>