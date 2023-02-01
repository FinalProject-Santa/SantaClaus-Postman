<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<title>퍼즐 맞추기 [1단계]</title>
<link rel="shortcut icon" href="/resources/image/kids/favicon.ico">
<link rel="stylesheet" href="/resources/css/kids/puzzle_1level.css">

<body>
	<%@include file="../include/kidsheader.jsp" %>
    
    <!-- main -->
    <div class="inner">
        <div class="wrap-all">
            <div class="puzzle_text">
                <p id="text_1">
                    <span style="color: rgb(232, 3, 3);">퍼</span><span style="color: rgb(255, 140, 0);">즐</span><span style="color: rgb(255, 196, 0);">을</span>
                    <span style="color: green;"> 맞</span><span style="color: rgb(43, 43, 240);">춰</span><span style="color: rgb(2, 2, 161);">보</span><span style="color: rgb(131, 21, 234);">세</span><span style="color: black;">요</span>
                </p>
                <p id="text_2">5초 뒤에 퍼즐이 섞여요!</p>
            </div>
            <ul class="image-container">
            </ul>
            <div id="progressDiv">
            <progress value="0" max="5" id="progressBar"></progress>
            </div>
            <span class="game-text">성공!</span>
            <div class="button-group">
                <button class="mix-button">섞기</button>
                <button class="restart-button">재시작</button>
                <button class="main-button" onclick="location.href='/kids/gamemain'">게임 홈</button>
            </div>
        </div> <!-- wrap-all -->

    </div>
    
    <%@include file="../include/kidsfooter.jsp" %>
    
    <script src="/resources/js/kids/puzzle_1level.js"></script>
    
</body>
</html>