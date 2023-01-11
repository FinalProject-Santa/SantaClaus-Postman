<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body{
	width: 100%;
	height: 100%;
}
.main_view{
	margin:  0px;
	text-align: center;
	width:100%;
	height:900px;
}
.main_view{overflow:hidden;background-repeat: no-repeat;}
.main_view ul{width:calc(100% * 3);display:flex;animation:slide 8s infinite;} /* slide를 8초동안 진행하며 무한반복 함 */
.main_view li{width:calc(100% / 3);height:300px;}
    
@keyframes slide {
	0% {margin-left:0;} /* 0 ~ 10  : 정지 */
	10% {margin-left:0;} /* 10 ~ 25 : 변이 */
	25% {margin-left:-100%;} /* 25 ~ 35 : 정지 */
	35% {margin-left:-100%;} /* 35 ~ 50 : 변이 */
	50% {margin-left:-200%;}
	60% {margin-left:-200%;}
	100% {margin-left:0;}
}

.main_view{
	background-image: url("/resources/image/main/main_img.png");
}

.about_img{
	width:500px;
	height: 1500px;
}
</style>
</head>
<body>
	<!-- 헤더 -->
    <%@include file="./main/header.jsp" %>
    
    
    <div class="main_view">
    	
    </div>
    
    <div class="about">
    	<div class="about_img">
    		<img src="/resources/image/main/about.jpg">
    	</div>
    </div>
    
    
    <!-- 푸터 -->
    <%-- <%@include file="./footer.jsp" %> --%>
</body>
</html>