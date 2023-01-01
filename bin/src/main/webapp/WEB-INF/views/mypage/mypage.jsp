<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>마이페이지</title>
    <link rel="stylesheet" href="/resources/css/mypage/mypage.css">
</head>
<body>
    <div class="wrapper">
        <nav>
            <h1>마이페이지</h1>
            <hr>
            <span>$(dto.memberid)님 안녕하세요!</span>
            <button onclick="location.href='infoUpdateform'">회원정보 수정</button>
        </nav>
        <section>
            <div class="section1"><p><img src="/resources/image/mypage/bill.jpg"
             onclick="location.href='/mypage/order'"><a href="/mypage/order" id="order">주문 정보</a></p></div>
            <div class="section2"><p><img src="/resources/image/mypage/cart.png"
             onclick="location.href='/mypage/cart'"><a href="/mypage/cart"> 장바구니</a></p></div>
            <div class="section3"><p><img src="/resources/image/mypage/kids.jpg"
             onclick="location.href='/mypage/kids'"><a href="/mypage/"> 키즈 모드</a></p></div>
            <div class="section4"><p><img src="/resources/image/mypage/coin.png"
             onclick="location.href='/mypage/point'"><a href="/mypage/point"> 마이 포인트</a></p></div>
        </section>
    </div>
</body>
</html>