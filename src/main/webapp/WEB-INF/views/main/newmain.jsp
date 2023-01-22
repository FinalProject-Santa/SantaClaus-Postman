<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="/resources/css/main/newmain.css">
	<link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Myeongjo&display=swap" rel="stylesheet">
</head>
<body>
<!-- header -->
    <div class="header">
        <span id="logo"><a href="/">Dear Santa</a></span>
        <ul id="sidemenu">
            <li>Login</li>
            <li>Cart</li>
        </ul>
        <span id="menu">= Menu
        <div id="menubox">
                <ul id="menubar">
                    <li>&nbsp;Letter</li>
                    <li>&nbsp;Tree</li>
                    <li>&nbsp;Review</li>
                    <li>&nbsp;My Page</li>
                    <br>
                    <br>
                    <li><a href="#aboutmsg" id="scroll_move">&nbsp;About</a></li>
                </ul>
            </div>
        </span>
    </div>

    <!-- main Img -->
    <div id="body-wrapper">
        <div>
    <div class="main-fullwidth" style="background: url(&quot;/resources/image/main/winter.jpg&quot;)
    center center / cover no-repeat; color: rgb(0, 0, 0); height: 749px;">
    </div>
        </div>
    </div><!--bodywrapper-->

    <!-- about -->
    <div id="about">
        <div id="img_box">
            <img src="/resources/image/main/about_img.jpg" id="img">
        </div>

    <div id="aboutmsg">
        <div id="message">
            <span id="title">Dear Santa</span><br><br>
            <span id="content">Dear Santa는 아이들의 동심을<br>지켜주기 위한 브랜드입니다.<br>
            아이들을 위하는 부모님의 마음으로,<br>모두에게 잊지 못할 값진 순간을<br>
            선물하는 것이 저희의 목표입니다.</span>
        </div>

        <hr style="border-width:1px 0 0 0; border-color:#fff;"> 

        <div id="Help">
            <span id="title2">Help Center</span><br><br>
            <span id="content2">1234-5678<br>
            AM 10:00 ~ PM 17:00 (토,일,공휴일 휴무)</span>
        </div>

        <div id="Insta">
            <span id="title3">Instagram</span><br><br>
            <span id="content3"><a href="https://www.instagram.com/dearsanta_official/?next=%2F&hl=ko" target='_blank'>@dearsanta_official</a></span>
        </div>

    </div>
    </div>

    <!-- letter -->
    <div id="letterbox">
        <div>
        <ul id="letter">
            <li><a><img src="/resources/image/main/letter1.jpg"><div>케빈엽서<br>\2,000</div></a></li>
            <li><a><img src="/resources/image/main/letter1.jpg"><div>케빈엽서<br>\2,000</div></a></li>
            <li><a><img src="/resources/image/main/letter1.jpg"><div>케빈엽서<br>\2,000</div></a></li>
            <li><a><img src="/resources/image/main/letter1.jpg"><div>케빈엽서<br>\2,000</div></a></li>
        </ul>
        </div>
    </div>

    <!-- letter more -->
    <div id="lettermore">
        <img src="/resources/image/main/cake3.jpg" id="moreImg">
        <div id="moremsg">
        <span><br>더 다양한 엽서가 준비되어 있습니다.<br>
        행복한 추억을 선물해 보세요.</span><br>
        <button id="more_btn">Letter More</button>
        </div>
    </div>

    <!-- footer -->
    <footer>
        <div id="footer1">
            <b>(주)디어산타</b><br>
            Team: 산타국 우체부<br>
            221206, 서울특별시 산타구 우체동 12-25 2층<br><br>
            Copyright © 2022 Dear Santa. All rights reserved.
        </div>
        <div id="footer2">
            CONTACT<br><br>
            T.02212061225 | am 10 ~ pm 5 , sat/sun/holiday off<br>
            business mail _ dearsanta@gmail.com<br>
            Instagram _ @dearsanta_official<br>
        </div>
    </footer>

</body>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script>
    $(document).ready(function($) {

    $(".scroll_move").click(function(event){         

        event.preventDefault();

        $('html,body').animate({scrollTop:$(this.hash).offset().top}, 400);

    });

    });

</script>
</body>
</html>