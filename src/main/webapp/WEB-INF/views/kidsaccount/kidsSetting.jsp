<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@include file="../include/header.jsp"%>
<%@include file="../include/floatingMenu.jsp"%>

<link rel="stylesheet" href="/resources/css/kidsAccount/kidsSetting.css">

<body>

<div class="inner">

        <div class="kid-setting">
        <c:choose>
		      	<c:when test="${name != null }">
		      		<p class="login_text"><span>${name }님</span>의 키즈 계정 입니다.</p>
		      	</c:when>
	      	</c:choose>
         
        </div>
    <div class="flex-container">
       <div class="row">
           <div class="card">
                <div class="inner-card">
                   		 
                   		<c:choose>
                    
                    	   <c:when test="${empty list[0] }">  	 
                    
                    	<div class="kid-img">
            
                       		 <img src="/resources/image/kids-account/user-account.png" class="img-box" alt="프로필 사진" onclick="location.href='/kidsaccount/form'">
                    	</div>
                        <div class="content">
                            <span><a href="form" class="nick">계정 추가하기</a></span>
                       </div>
                          
                           </c:when>
                           
                           
                           <c:when test="${!empty list[0]}">
                          
                           
                           	<div class="kid-img">     
                        
                           	<c:if test="${!empty list[0].kids_thumbnail}">                              	
                       	<img src="/resources/files/${list[0].kids_thumbnail}" class="img-box" alt="프로필 사진" onclick="location.href='/kidsaccount/modify?no=1'">
                    		</c:if>
                    	
                    		<c:if test="${empty list[0].kids_thumbnail}">  
                    	<img src="/resources/image/customer/SnowSculptures.jpg" class="img-box" alt="프로필 사진" onclick="location.href='/kidsaccount/modify?no=1'">
                    		</c:if>	
                    	
                    	</div>
                        <div class="content">
                            <span><a href="modify?no=1" class="nick" >${list[0].kids_nickname}</a></span>
                       </div>
                      </c:when>
                		 </c:choose>     	
                 </div><!--end inner-card-->
            </div><!--end card-->
        
            <div class="card">
                <div class="inner-card">
                
                    	 
                   		<c:choose>
                    
                    	   <c:when test="${empty list[1] }">  	 
                    
                    	<div class="kid-img">
            
                       		 <img src="/resources/image/kids-account/user-account.png" class="img-box" alt="프로필 사진" onclick="location.href='/kidsaccount/form'">
                    	
                    	</div>
                        <div class="content">
                            <span><a href="form" class="nick">계정 추가하기</a></span>
                       </div>
                          
                           </c:when>
                           
                          
                           <c:when test="${!empty list[1]}">
                          
                           
                           	<div class="kid-img"> 
                           	     
 								<c:if test="${!empty list[1].kids_thumbnail}">       
                       				<img src="/resources/files/${list[1].kids_thumbnail}" class="img-box" alt="프로필 사진" onclick="location.href='/kidsaccount/modify?no=2'">
                    			</c:if>
                    	
                    			<c:if test="${empty list[1].kids_thumbnail}">  
                    				<img src="/resources/image/customer/SnowSculptures.jpg"  class="img-box" alt="프로필 사진" onclick="location.href='/kidsaccount/modify?no=2'">
                    			</c:if>	           
                    	</div>
                    	
                    	
                        <div class="content">
                        	
                            <span><a href="modify?no=2" class="nick">${list[1].kids_nickname}</a></span>
                           
                       </div>
                           </c:when>
                		 </c:choose>     	
                </div><!--end inner-card-->
            </div><!--end card-->
    
            <div class="card">
                <div class="inner-card">
                  	 
                   		<c:choose>
                    
                    	   <c:when test="${empty list[2] }">  	 
                    
                    	<div class="kid-img">
            					
                       		 <img src="/resources/image/kids-account/user-account.png" class="img-box" alt="프로필 사진" onclick="location.href='/kidsaccount/form'">
                    	</div>
                        <div class="content">
                            <span><a href="form" class="nick">계정 추가하기</a></span>
                       </div>
                          
                           </c:when>
                           
                           
                           <c:when test="${!empty list[2]}">
                          
                           
                           	<div class="kid-img">            
 								<c:if test="${!empty list[2].kids_thumbnail}">       
                       				<img src="/resources/files/${list[2].kids_thumbnail}" class="img-box" alt="프로필 사진" onclick="location.href='/kidsaccount/modify?no=3'">
                    			</c:if>
                    	
                    			<c:if test="${empty list[2].kids_thumbnail}">  
                    				<img src="/resources/image/customer/SnowSculptures.jpg"  class="img-box" alt="프로필 사진" onclick="location.href='/kidsaccount/modify?no=3'">
                    			</c:if>
                    				                    	
                    		</div>
                       
                        <div class="content">
                            <span><a href="modify?no=3" class="nick">${list[2].kids_nickname}</a></span>
                       </div>
                           </c:when>
                		 </c:choose>     	
                </div><!--inner-card-->
            </div><!--card-->

    </div><!--row-->
</div><!--container-->

</div><!-- big container -->

<%@include file="../include/footer.jsp"%>
