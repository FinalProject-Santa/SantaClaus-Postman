<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Floating Button</title>
    <link rel="stylesheet" href="/resources/css/customer/floatingMenu.css">
    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>

   <script>    
    function chatbot_click(){
        $('.menu').toggle();
    }
    </script>
    
</head>

<body>
    <div class="floating-parent" onclick="chatbot_click();">
    <div class="right-button"></div>
    <span class="widgetlabel">고객센터</span>
    </div>

    <div class="menu-parent">
    <div class="menu">
        <p>안녕하세요!<br><b>챗봇 루돌피</b>입니다 😀
        <br>원하시는 메뉴를<br>클릭하세요!
        </p>
        

        <div class="buttons">
        <button onclick="location.href='notice';">공지사항</button>
    	<button onclick="location.href='qnainsertform';">1:1문의</button>
    	<button onclick="location.href='faq';">자주묻는질문</button>
        </div>
    </div> 
</div>
    
</body>
</html>