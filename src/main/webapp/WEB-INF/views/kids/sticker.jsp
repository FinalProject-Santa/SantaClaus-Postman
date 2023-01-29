<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="/resources/css/kids/sticker.css">

    <script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.9.0/jquery.js"></script>
    <script>
    
    	$(function(){
    		$('.sticker_Jan').hide();
    		$('#month2').hide();
    	});
    	
    </script>

<body>

	<%@include file="../include/kidsheader.jsp" %>
	
	
	<!-- main -->
	<div class="inner">
	
	    <div class="stickerbody">
	
	        <p id="kids"><span style="color: rgb(255, 225, 0);">${kids.kids_nickname }의</span> <span style="color: rgb(252, 0, 126); font-size: 75px;">칭찬</span><span style="color: rgb(49, 172, 254);">스티커판</span></p>
	    <div class="main">
	    
	        <div id="month"><p class="title" style="color: rgb(252, 0, 126);">12월</p>
	        <p class="text" style="color: rgb(49, 172, 254);">칭찬스티커 개수: 15개</p> <!-- ${DecSize } --></div>
	        
			<div id="month2"><p class="title2" style="color: rgb(252, 0, 126);">1월</p>
	        <p class="text2" style="color: rgb(49, 172, 254);">칭찬스티커 개수: ${JanSize }개</p></div>


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
	      
	    </div> <!-- sticker_Dec -->
	    
	    
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
	    
	    </div> <!-- sticker_Jan -->
	    
        <div class="btn_group">
            <button id="Dec_btn">12월</button>
            <button id="Jan_btn">1월</button>
        </div>
        
        </div> <!-- stickerbody -->

</div>
    
    
    <%@include file="../include/kidsfooter.jsp" %>
    
    
    <script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.9.0/jquery.js"></script>
	<script>
	$("#Dec_btn").on("click",function(){
		$(".sticker_Jan").hide();
		$(".sticker_Dec").show();
		$('#month').show();
		$('#month2').hide();

	});
	
	$("#Jan_btn").on("click",function(){
		$(".sticker_Dec").hide();
		$(".sticker_Jan").show();
		$('#month').hide();
		$('#month2').show();
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