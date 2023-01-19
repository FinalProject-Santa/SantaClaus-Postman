<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<style>

.img-box{
    padding-top: 20px;
    width: 200px;
    height: 200px;
}   

.card{
    background-color: bisque;
    padding: 40px;
    width: 300px;
    height: 400px;
} 

a {
    text-decoration: none;
    color:black;
}

.row{
    display: flex;
    -ms-flex-wrap: wrap;
    flex-wrap: nowrap;
    margin-right: -15px;
    margin-left: -15px;
    flex-direction: row;
}

body{
	margin-top:20px;
	background:white
}

.inner-card {
	height: auto;
	background-color: #ffffff;
	-webkit-transition: all 0.5s cubic-bezier(0.68, -0.55, 0.27, 1.55) 0s;
	transition: all 0.5s cubic-bezier(0.68, -0.55, 0.27, 1.55) 0s;
	font-size: 18px;
	text-align: center;
}


.nick:hover {
    color: #0061ea !important;
}


.inner-card:hover {
  	-webkit-transform: translateY(-7px);
          transform: translateY(-7px);
 	-webkit-box-shadow: 0 0 5px rgba(0, 0, 0, 0.15);
          box-shadow: 0 0 5px rgba(0, 0, 0, 0.15);
}


.shadow {
    -webkit-box-shadow: 0 0 5px rgba(0, 0, 0, 0.15) !important;
    box-shadow: 0 0 5px rgba(0, 0, 0, 0.15) !important;
}

.message {
    color: rgb(200, 200,200) !important;
    font-size: 15px;
    text-align: center;
}


.flex-container{
    margin: 100px;
    display: flex;
    justify-content: center;
}

.nick{
    font-size: 20px;
    font-weight: bold;
}


.content{
    margin: 20px;
}

p{
   	padding-bottom: 20px;
}
</style>

<body>

<div class="big-container">
        <div class="kid-setting">
        <h1>키즈계정</h1> 
        <hr>
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
            
                       		 <img src="/resources/image/kids-account/user-account.png" class="img-box" alt="프로필 사진">
                    	</div>
                        <div class="content">
                            <span><a href="form" class="nick">계정 추가하기</a></span>
                            <p class="message">슬롯 1</p>                    
                       </div>
                          
                           </c:when>
                           
                           
                           <c:when test="${!empty list[0]}">
                          
                           
                           	<div class="kid-img">            
                       	<img src="/resources/files/${list[0].kids_thumbnail}" class="img-box" alt="프로필 사진">
                    	
                    	</div>
                        <div class="content">
                            <span><a href="form" class="nick">${list[0].kids_nickname}</a></span>
                            <p class="message">상태메세지</p>                    
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
            
                       		 <img src="/resources/image/kids-account/user-account.png" class="img-box" alt="프로필 사진">
                    	
                    	</div>
                        <div class="content">
                            <span><a href="form" class="nick">계정 추가하기</a></span>
                            <p class="message">슬롯 2</p>                    
                       </div>
                          
                           </c:when>
                           
                          
                           <c:when test="${!empty list[1]}">
                          
                           
                           	<div class="kid-img"> 
                           	     
                        	<img src="/resources/files/${list[1].kids_thumbnail}" class="img-box" alt="프로필 사진">
                    
                    	</div>
                        <div class="content">
                            <span><a href="form" class="nick">${list[1].kids_nickname}</a></span>
                            <p class="message">상태메세지</p>                    
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
            					
                       		 <img src="/resources/image/kids-account/user-account.png" class="img-box" alt="프로필 사진">
                    	</div>
                        <div class="content">
                            <span><a href="form" class="nick">계정 추가하기</a></span>
                            <p class="message">슬롯 3</p>                    
                       </div>
                          
                           </c:when>
                           
                           
                           <c:when test="${!empty list[2]}">
                          
                           
                           	<div class="kid-img">            
                         	<img src="/resources/files/${list[2].kids_thumbnail}" class="img-box" alt="프로필 사진">
                    	</div>
                        <div class="content">
                            <span><a href="form" class="nick">${list[2].kids_nickname}</a></span>
                            <p class="message">상태메세지</p>                    
                       </div>
                           </c:when>
                		 </c:choose>     	
                </div><!--inner-card-->
            </div><!--card-->

    </div><!--row-->
</div><!--container-->

</div><!-- big container -->
</body>
</html>