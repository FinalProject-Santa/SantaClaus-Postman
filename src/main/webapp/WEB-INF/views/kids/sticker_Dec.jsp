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
	
</script>
</head>
<body>
   <div class="santa_img" id="month">
        <img id="santa" src="/resources/image/kids/img6.png">
    </div>
    <div class="sticker">
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
         	<div class="num" style="background-color: white;">
            	${i }
            </div>
         </c:otherwise>
         </c:choose>
      </c:forEach>
    </div>	      
</body>
</html>