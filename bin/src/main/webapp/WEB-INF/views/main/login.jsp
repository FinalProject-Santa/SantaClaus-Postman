<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link href="/resources/css/main/login.css" rel="stylesheet">
<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.9.0/jquery.js"></script>
<script>
   $(function(){
      rememberId();
      $("#errorid").hide();
      $("#errorpw").hide();
      
   });
   
   function loginsubmit(){
      saveId();
      let memberid = $("#memberid").val().trim();
      let memberpw = $("#memberpw").val().trim();
      
      if(memberid == null || memberid == "" || memberpw == null || memberpw == ""){
         $("#errorid").show();
         $("#errorpw").show();
         return false;
      }    
   };
   
   function rememberId(){
        var cookieid = getCookie("saveId");
        if(cookieid !=""){
            $("input:checkbox[id='remember-check']").prop("checked", true);
            $("#memberid").val(cookieid);
        }
    }    
 
    function setCookie(name, value, expiredays) {
        var todayDate = new Date();
        todayDate.setTime(todayDate.getTime() + 0);
        if(todayDate > expiredays){
            document.cookie = name + "=" + escape(value) + "; path=/; expires=" + expiredays + ";";
        }else if(todayDate < expiredays){
            todayDate.setDate(todayDate.getDate() + expiredays);
            document.cookie = name + "=" + escape(value) + "; path=/; expires=" + todayDate.toGMTString() + ";";
        }
       
    }
 
    function getCookie(Name) {
        var search = Name + "=";
        
        if (document.cookie.length > 0) {
            offset = document.cookie.indexOf(search);
            if (offset != -1) {
                offset += search.length;
                end = document.cookie.indexOf(";", offset);
                if (end == -1)
                    end = document.cookie.length;
                
                return unescape(document.cookie.substring(offset, end));
            }
        }
        
        return "";
    }
 
    function saveId() {
        var expdate = new Date();
        if ($("#remember-check").is(":checked")){
            expdate.setTime(expdate.getTime() + 1000 * 3600 * 24 * 30);
            setCookie("saveId", $("#memberid").val(), expdate);
            }else{
           expdate.setTime(expdate.getTime() - 1000 * 3600 * 24 * 30);
            setCookie("saveId", $("#memberid").val(), expdate);
        }
    }
    
    
</script>
</head>
<body>
   <div class="login">
        <div class="title">
            <h2>Login</h2>
            </div>
            <div class="closebutton">
            <input type="button" value="x" id="closebutton" onclick="history.back()">
           </div>
        <form id="login-form" action="/main/login" method="post" onsubmit="return loginsubmit();">
            <input type="text" name="user_id" id="memberid" class="memberinfo" placeholder="아이디*">
                <span id="errorid">아이디를 입력해 주세요.</span>
            <input type="password" name="password" id="memberpw" class="memberinfo" placeholder="패스워드*">
                <span id="errorpw">비밀번호를 입력해 주세요.</span>
                <p class="checkid">
                <label for="remember-check" class="chk_box">
                    <input type="checkbox" class="save_id" name="check_id" id="remember-check"/>
                    <span class="on"></span>
                    <span class="saveid">아이디 저장하기</span>
                </label>
                </p>
                <p class="register"><a href="/main/signUpForm">회원가입</a></p>
            <input type="submit" value="로그인">
            <c:if test="${result==0 }">
               <span id="errorlogin">아이디 또는 패스워드를 잘못 입력하셨습니다.</span>
            </c:if>
                <p class="findInfo"><a href="/main/findIdForm">아이디 찾기</a> ㅣ <a href="/main/findPwForm">비밀번호 찾기</a></p>
        </form>
    </div>
</body>
</html>