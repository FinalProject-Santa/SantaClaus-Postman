<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>키즈메인</title>
<link rel="stylesheet" href="/resources/css/kids/main.css">
</head>
<body>
	<p>무엇을 하고 놀까요?</p>
    <div class="flex_container">
    <div class="kids_main" id="puzzle">
        <img src="/resources/image/kids/img1.png" id="img1" onclick="location.href='/kids/puzzle'">
        <div id="text1">
            <b>퍼즐 맞추기</b><br>
            <span>신나는 퍼즐 맞추기</span>
            </div>
    </div>
    <div class="kids_main" id="draw">
        <img src="/resources/image/kids/img2.png" id="img2" onclick="location.href='/kids/diary'">
        <div id="text2">
            <b>그림일기</b><br>
            <span>오늘 있었던 일을<br>그림으로 그려봐요</span>
            </div>
    </div>
    <div class="kids_main" id="sticker">
        <img src="/resources/image/kids/img3.png" id="img3" onclick="location.href='/kids/sticker'">
        <div id="text3">
            <b>칭찬 스티커</b><br>
            <span>내가 모은 칭찬 스티커</span>
            </div>
    </div>
    <div class="kids_main" id="mail">
        <img src="/resources/image/kids/img4.png" id="img4">
        <div id="text4">
            <b>산타 편지함</b><br>
            <span>내 편지가 산타할아버지께<br>전해 졌을까요?</span>
            </div>
    </div>
    </div>
</body>
</html>