<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <title>My Page</title>
 <link rel="shortcut icon" href="/resources/image/kids/favicon.ico">
<body>
	<!-- header -->
	<%@include file="../include/header.jsp" %>
	<%@include file="../include/floatingMenu.jsp" %>
	<div id="aio">
 		<p class="headCategory" style="text-align: right">
			<a href="/" style="text-decoration:none; color:black;">Home</a> > My Page
		</p>
	    <div class="wrapper">
	            <h1>마이페이지</h1>
	            <hr>
	            
	      		<p id="name">
	      			<b>${memberdto.name }</b>님 반갑습니다
	      		</p> 
		      	<a href="/mypage/infoUpdateform" id="btn">
		      		<b>회원정보 수정/탈퇴</b>
		      	</a>
	            <img id="profile" src="/resources/files/${memberdto.rfileName} "></img>
	            
	            
	            <div id="section1" class="section">
	            	<p>
	            		<img src="/resources/image/mypage/bill.png" onclick="location.href='/mypage/myorder'">
	           			<!-- <a href="/mypage/order" class="list">주문 정보</a> -->
	           		</p>
	       		</div>
	            <div id="section2" class="section">
	           		<p>
	           			<img src="/resources/image/mypage/cart.png" onclick="location.href='/mypage/mycart'">
	           			<!-- <a href="/cart/cartpage" class="list"> 장바구니</a> -->
	            	</p>
	            </div>
	            <div id="section3" class="section">
	            	<p>
	         			<img src="/resources/image/mypage/kids.png" onclick="location.href='/kidsaccount/main'">
	           			<!-- <a href="/kidsaccount/main" class="list"> 키즈 모드</a> -->
	             	</p>
	             </div>
	            <div id="section4" class="section">
	            	<p>
	            		<img src="/resources/image/mypage/coin.png" onclick="location.href='/mypage/point'">
	           			<!-- <a href="/mypage/point" class="list"> 마이 포인트</a> -->
	             	</p>
	             </div>
	    </div>
    </div>
    <link rel="stylesheet" href="/resources/css/mypage/mypage.css">
	<!-- footer -->
   
	<%@include file="../include/footer.jsp" %>
</body>
