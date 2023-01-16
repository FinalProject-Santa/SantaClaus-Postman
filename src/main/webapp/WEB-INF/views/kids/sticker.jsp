<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/kids/sticker.css">
    <script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.9.0/jquery.js"></script>
	<script>
	
		$(function(){
			$("#Jan").hide();
			$(".sticker_Jan").hide();
		});
		
	</script>  
</head>
<body>
   <div class="santa_img" id="month">
        <img id="santa" src="/resources/image/kids/img6.png">
    </div>
    <div class="btn_group">
    <button id="Dec_btn">12월</button>
    <button id="Jan_btn">1월</button>
    </div>
    <div id="Dec">12월</div>
    <c:out value="${DecSize }"></c:out>
    <div class="sticker_Dec">
    	<c:set var="j" value="0"/>
       	<c:forEach var="i" items="${totalDay }">
        <c:choose>
         <c:when test="${i == DecDay[j] }">
	         <div class="num" style="background-color: yellow;">
	            ${i }
	         </div>
	         <c:set var="j" value="${j+1 }"/>
         </c:when>
         <c:otherwise>
         	<div class="Dec_num" style="background-color: white;" id="${i }">
            	${i }
            </div>
         </c:otherwise>
         </c:choose>
      </c:forEach>
    </div>
    <div id="Jan">1월</div>
    <c:out value="${JanSize }"></c:out>
    <div class="sticker_Jan">
    	<c:set var="j" value="0"/>
       	<c:forEach var="i" items="${totalDay }">
        <c:choose>
         <c:when test="${i == JanDay[j] }">
	         <div class="num" style="background-color: yellow;">
	            ${i }
	         </div>
	         <c:set var="j" value="${j+1 }"/>
         </c:when>
         <c:otherwise>
         	<div class="Jan_num" style="background-color: white;" id="${i }">
            	${i }
            </div>
         </c:otherwise>
         </c:choose>
      </c:forEach>
    </div>
    <script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.9.0/jquery.js"></script>
	<script>
	

	$("#Dec_btn").on("click",function(){
		$(".sticker_Jan").hide();
		$("#Jan").hide();
		$(".sticker_Dec").show();
		$("#Dec").show();
	});
	
	$("#Jan_btn").on("click",function(){
		$(".sticker_Jan").show();
		$("#Jan").show();
		$(".sticker_Dec").hide();
		$("#Dec").hide();
	});
	
	$(".Dec_num").on("click",function(){
		var id = $(this).attr('id');
		var Date = "202212"+id;
		location.href="/kids/FillSticker?write_date="+Date;
	});
	
	$(".Jan_num").on("click",function(){
		var id = $(this).attr('id');
		var Date = "202301"+id;
		location.href="/kids/FillSticker?write_date="+Date;
	});
	
	</script>
</body>
</html>