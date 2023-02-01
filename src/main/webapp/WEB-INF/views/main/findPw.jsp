<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<title>Find Pw</title>
<link rel="shortcut icon" href="/resources/image/kids/favicon.ico">
<link href="/resources/css/main/findPw.css" rel="stylesheet">
<%@include file="../include/header.jsp"%>
<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.9.0/jquery.js"></script>
<script>
   $(function(){
      $("#errorid").hide();
      $("#erroremail").hide();
   });
   
   function findPw(){
      let id = $("#memberid").val().trim();
      let email = $("#memberemail").val().trim();
   
      if(id == null || id == "" || email == null || email == ""){
         $("#errorid").show();
         $("#erroremail").show();   
      }else{
         $.ajax({
            url:"/main/findPw",
            type:"post",
            data:{
            	"user_id" : id, 
                "email" : email
            },
            success:function(data){
               if(data!=null){
                  location.href="/main/findPwResult?pw=" + data;
               }else{
                  alert("일치하는 회원의 정보가 없습니다.");
                  $("#memberid").val("");
                  $("#memberemail").val("");
               }
            },
            error:function(){
               alert("통신실패");
            }
         });
      }

}
   
/*    function sendEmail(){
	   let id = $("#memberid").val().trim();
	   let email = $("#memberemail").val().trim();
	   
	      if(id == null || id == "" || email == null || email == ""){
	         $("#errorid").show();
	         $("#erroremail").show();   
	      }else{
	         $.ajax({
	            url:"/main/sendEmail",
	            type:"post",
	            data:{
	            	"user_id" : id, 
	                "email" : email
	            },
	            success:function(data){
	               console.log('성공');
	            },
	            error:function(){
	               alert("통신실패");
	            }
	         });
	      }

	} */

</script>


<body>

	<div class="inner">
    <div class="findPw">
        <div class="title">
        <h2>비밀번호 찾기</h2>
        </div>
        <div class="closebutton">
        <input type="button" value="x" id="closebutton" onclick="history.back()">
        </div>
        <form method="post" action="/main/sendEmail">
        <div id="findPw-form">
           <input type="text" name="user_id" id="memberid" class="memberinfo" placeholder="아이디*" style="border-bottom: 1px solid #c7c4c4; margin-bottom:21px;">
                <span id="errorid">아이디을 입력하세요.</span>
            <input type="text" name="email" id="memberemail" class="memberinfo" placeholder="이메일*" style="border-bottom: 1px solid #c7c4c4;">
                <span id="erroremail">이메일을 입력하세요.</span>
            <input type="submit" id="sendbutton" value="인증번호 전송">
        </div>
        </form>
    </div>
    </div>
    
    <%@include file="../include/footer.jsp" %>
