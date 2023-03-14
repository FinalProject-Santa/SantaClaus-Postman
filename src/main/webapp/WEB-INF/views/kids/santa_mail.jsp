<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<title>산타 우편함</title>
<link rel="shortcut icon" href="/resources/image/kids/favicon.ico">
<link rel="stylesheet" href="/resources/css/kids/santa_mail.css">
<link rel="stylesheet" href="/resources/css/kids/santa_mail2.css">
<link rel="stylesheet" href="/resources/css/kids/snow.css">

<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.9.0/jquery.js"></script>
<script>
	
	$(function(){
		$('.main2').hide();
	});
	
</script>
<body>


	<%@include file="../include/kidsheader.jsp" %>
	
	<!-- snow -->
	<div class="snowflake"></div>
    <div class="snowflake"></div>
    <div class="snowflake"></div>
    <div class="snowflake"></div>
    <div class="snowflake"></div>
    <div class="snowflake"></div>
    <div class="snowflake"></div>
    <div class="snowflake"></div>
    <div class="snowflake"></div>
    <div class="snowflake"></div>
    <div class="snowflake"></div>
    <div class="snowflake"></div>
    <div class="snowflake"></div>
    <div class="snowflake"></div>
    <div class="snowflake"></div>
    <div class="snowflake"></div>
    <div class="snowflake"></div>
    <div class="snowflake"></div>
    <div class="snowflake"></div>
    <div class="snowflake"></div>
    <div class="snowflake"></div>
    <div class="snowflake"></div>
    <div class="snowflake"></div>
    <div class="snowflake"></div>
    <div class="snowflake"></div>
    <div class="snowflake"></div>
    <div class="snowflake"></div>
    <div class="snowflake"></div>
    <div class="snowflake"></div>
    <div class="snowflake"></div>
    <div class="snowflake"></div>
    <div class="snowflake"></div>
    <div class="snowflake"></div>
    <div class="snowflake"></div>
    <div class="snowflake"></div>
    <div class="snowflake"></div>
    <div class="snowflake"></div>
    <div class="snowflake"></div>
    <div class="snowflake"></div>
    <div class="snowflake"></div>
    <div class="snowflake"></div>
    <div class="snowflake"></div>
    <div class="snowflake"></div>
    <div class="snowflake"></div>
    <div class="snowflake"></div>
    <div class="snowflake"></div>
    <div class="snowflake"></div>
    <div class="snowflake"></div>
    <div class="snowflake"></div>
    <div class="snowflake"></div>
    
    
    
	<!-- main -->
	<div class="inner">
	    <div class="main">
	
	    <div class="mailImg">
	        <img src="/resources/image/kids/mail/letter.png" id="img" onclick="mail();">
	    </div>
	    <p id="text">편지를 열어보세요!</p>
	
	    </div> <!-- main -->
	    
	    <div class="main2">
		
		    <div class="mailImg2">
		        <img src="/resources/files/${kids.kids_letter_img}" id="img2">
		    </div>
		    <h1>산타마을에서 편지가 도착했어요!</h1>
		    <div class="message">
		        안녕 ${kids.kids_nickname }야!<br>
		        보내준 편지 잘 받았어 고마워<br>
		        크리스마스에 선물 들고 찾아갈게<br>
		        그때 만나자 조금만 기다려줘 ~
		        <p class="from">산타할아버지가</p>
		    </div>  
	
	    </div> <!-- main2 -->
	    
	</div>
	
	
	
	<%@include file="../include/kidsfooter.jsp" %>
	
	<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.9.0/jquery.js"></script>
	<script>
		
		function mail(){
			$('.main').hide();
			$('.main2').show();
		};
		
	</script>
</body>
</html>