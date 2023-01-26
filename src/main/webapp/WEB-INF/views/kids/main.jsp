<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="/resources/css/kids/main.css">
</head>
<body>

	<!-- header -->
	<%@include file="../include/kidsheader.jsp" %>
    
    
    <!-- main Img -->
    <div id="body-wrapper">
        <div>
            <div class="main-fullwidth" style="background: url(&quot;/resources/image/kids/main/1.jpg&quot;)
            center center / cover no-repeat; color: rgb(0, 0, 0); height: 930px;">
            </div>
        </div>
    </div><!--body-wrapper-->

	<div class="inner">
	    <!-- box -->
	    <p id="boxtitle">무엇을 하고 놀까요?</p>
	
	    <div class="flex_container">
	    <ul id="boximg">
	        <li><img src="/resources/image/kids/main/img1.png" id="img1" onclick="location.href='/kids/puzzle'">
	            <div id="minidiv"><b>미니게임</b><br>재밌는 퍼즐 맞추기와<br>같은 그림 찾기를 해봐요</div></li>
	        <li><img src="/resources/image/kids/main/img2.png" id="img2" onclick="location.href='/kids/diary'">
	            <div><b>그림일기</b><br>오늘 있었던 일을<br>그림으로 그려봐요</div></li>
	        <li><img src="/resources/image/kids/main/img3.png" id="img3" onclick="location.href='/kids/mainsticker'">
	            <div><b>칭찬 스티커</b><br>내가 모은 칭찬 스티커를<br>확인해봐요</div></li>
	        <li><img src="/resources/image/kids/main/img4.png" id="img4">
	            <div><b>산타 우편함</b><br>내 편지가 산타마을에<br>전해 졌을까요?</div></li>
	    </ul>
	    </div> <!-- flex_container --> 
	
	    <div id="down">
	        <img src="/resources/image/kids/main/down.png" id="downImg">
	        <!-- autoplay -->
	        <audio controls class="audio">
	            <source src="/resources/audio/we-wish-you-a-merry-christmas-125995.mp3" type="audio/mp3">
	        </audio>
	    </div>
	</div>
	    
	    
    <!-- footer -->
    <%@include file="../include/kidsfooter.jsp" %>
    
</body>
</html>