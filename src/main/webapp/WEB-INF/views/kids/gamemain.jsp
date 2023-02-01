<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<title>미니게임</title>
<link rel="shortcut icon" href="/resources/image/kids/favicon.ico">
<link rel="stylesheet" href="/resources/css/kids/puzzle.css">

<body>
	<%@include file="../include/kidsheader.jsp" %>
	
	<!-- main -->
	<div class="inner">
	
	    <div class="mainbody">
	        <p id="boxtitle">
	            <b style="color:rgb(222, 2, 2);" class="btag">게</b><b style="color:green;" class="btag">임</b>을 골라보세요!
	        </p>
	    <div class="gamebody">
	        <div class="santa_puzzle">
	            <img src="/resources/image/kids/game/puzzle.png" class="puzzleimg">
	            <p id="puzzletitle" class="title">퍼즐 맞추기</p>
	            <p class="msg">
	                <span style="color:rgb(222, 2, 2);">•</span>단계별로 나눠져있어요<span style="color:rgb(222, 2, 2);">•</span>
	            </p>
	            <input type="button" class="level1-btn" value="1단계 시작" onclick="location.href='/kids/onelevel'">
	            <input type="button" class="level2-btn" value="2단계 시작" onclick="location.href='/kids/twolevel'">
	        </div>
	
	        <div class="same_game">
	            <img src="/resources/image/kids/game/socks.png" class="sameimg">
	            <p id="sametitle" class="title">같은 그림 찾기</p>
	            <p class="msg">
	                <span style="color:rgb(3, 174, 3);">•</span>성공 시 5포인트가 적립돼요<span style="color:rgb(3, 174, 3);">•</span>
	            </p>
	            <input type="button" class="same_btn" value="게임 시작" onclick="location.href='/kids/samegame'">
	        </div>
	    </div>
	
	    </div> <!-- mainbody -->
	
	</div>
	
    <%@include file="../include/kidsfooter.jsp" %>
</body>
</html>