<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<title>Find ID</title>
<link rel="shortcut icon" href="/resources/image/kids/favicon.ico">
<link href="/resources/css/main/findId.css" rel="stylesheet">
<%@include file="../include/header.jsp"%>
<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.9.0/jquery.js"></script>
<script>
   $(function(){
      $("#errorname").hide();
      $("#erroremail").hide();
   });
   
   function findId(){
      let name = $("#membername").val().trim();
      let email = $("#memberemail").val().trim();
      
      if(name == null || name == "" || email == null || email == ""){
         $("#errorname").show();
         $("#erroremail").show();   
      }else{
         $.ajax({
            url:"/main/findId",
            type:"post",
            data: {
            	"name" : name,
                "email" : email
            },
            success:function(data){
               if(data!=null){
                  location.href="/main/findIdResult?id=" + data;
               }else{
                  alert("일치하는 회원의 정보가 없습니다.");
                  $("#membername").val("");
                  $("#memberemail").val("");
               }
            },
            error:function(){
               alert("통신실패");
            }
         });
      }
}

</script>
</head>
<body>

	<div class="inner">
   <div class="findId">
        <div class="title">
        <h2>아이디 찾기</h2>
        </div>
        <div class="closebutton">
        <input type="button" value="x" id="closebutton" onclick="history.back()">
        </div>    
        <div id="findId-form">
            <input type="text" name="user_id" id="membername" class="memberinfo" placeholder="이름*"style="border-bottom: 1px solid #c7c4c4; margin-bottom:21px;" >
                <span id="errorname">이름을 입력하세요.</span>
            <input type="text" name="email" id="memberemail" class="memberinfo" placeholder="이메일*" style="border-bottom: 1px solid #c7c4c4;">
                <span id="erroremail">이메일을 입력하세요.</span>
            <input type="button" id="checkbutton" value="확인" onclick="findId();">
        </div>
    </div>
    </div>
    
<%@include file="../include/footer.jsp" %>