<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<link href="/resources/css/main/findPw.css" rel="stylesheet">
<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.9.0/jquery.js"></script>
<script>
   $(function(){
      $("#errorid").hide();
      $("#errorname").hide();
      $("#erroremail").hide();
   });
   
   function findPw(){
      let memberid = $("#memberid").val().trim();
      let membername = $("#membername").val().trim();
      let memberemail = $("#memberemail").val().trim();
   
      let findPwVal = {
         "memberid":memberid,
         "membername":membername,
         "memberemail":memberemail
   };
      
      if(memberid == null || memberid == "" || membername == null || membername == "" || 
                                    memberemail == null || memberemail == ""){
         $("#errorid").show();
         $("#errorname").show();
         $("#erroremail").show();   
      }else{
         $.ajax({
            url:"/main/findPw",
            type:"post",
            data:JSON.stringify(findPwVal),
            contentType:"application/json",
            dataType:"json",
            success:function(msg){
               console.log(msg);
               if(msg.check==true){
                  location.href="/main/findPwResult"
               }else{
                  alert("일치하는 회원의 정보가 없습니다.");
                  $("#memberid").val("");
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
   <div class="findPw">
        <div class="title">
        <h2>비밀번호 찾기</h2>
        </div>
        <div class="closebutton">
        <input type="button" value="x" id="closebutton" onclick="history.back()">
        </div>    
        <div id="findPw-form">
           <input type="text" name="user_id" id="memberid" class="memberinfo" placeholder="아이디*">
                <span id="errorid">아이디을 입력하세요.</span>
            <input type="text" name="name" id="membername" class="memberinfo" placeholder="이름*">
                <span id="errorname">이름을 입력하세요.</span>
            <input type="text" name="email" id="memberemail" class="memberinfo" placeholder="이메일*">
                <span id="erroremail">이메일을 입력하세요.</span>
            <input type="button" id="checkbutton" value="확인" onclick="findPw();">
        </div>
    </div>
</body>
</html>