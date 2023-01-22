<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
html{
   margin: 0;
}
body {
    height: auto;
    margin: 0;
    font-family: 'Nanum Myeongjo', serif;
}
.header{
    position: fixed;
    width: 100%;
    height: 70px;
    background-color: white;
    z-index: 1;
    border-bottom: solid 0.5px lightgray;
}
#logo{
    position: relative;
    font-weight: bold;
    font-size: 40px;
    left: 480px;
    top: 12px;
    cursor: pointer;
}
#sidemenu{
    position: relative;
    list-style: none;
    float: right;
    cursor: pointer;
    right: 30px;
    top: 14px;
}
#sidemenu li{
    float: left;
    margin-right: 20px;
    font-size: 16px;
}
#menu{
    position: relative;
    float: left;
    font-size: 16px;
    cursor: pointer;
    top: 30px;
    left: 40px;
    width: 80px;
    height: 50px;
}
#menubox{
    position: absolute;
    top: 40.5px;
    /* left: -40px; */
    left: -265px;
    width: 225px;
    height: 749px;
    background-color: white;
    transition: left .3s;
    /* display: none; */
    border-right: solid 0.5px lightgray;
}
#menubar{
    position: fixed;
    list-style: none;
    cursor: pointer;
}
#menubar li{
    position: relative;
    font-size: 16px;
    margin-bottom: 30px;
    top: 40px;
    left: 10px;
}
#menu:hover > #menubox{
    left: -40px;
}
</style>
</head>
<body>
	<!-- header -->
    <div class="header">
        <span id="logo"><a href="/">Dear Santa</a></span>
        <ul id="sidemenu">
            <li onclick="location.href='/main/loginForm'">Login</li>
            <li><a href="../kids/main">Kids</a></li>
        </ul>
        <span id="menu">= Menu
        <div id="menubox">
                <ul id="menubar">
                    <li><a href="../letter/letterList">&nbsp;Letter</a></li>
                    <li>&nbsp;Tree</li>
                    <li><a href="../review/reviewList">&nbsp;Review</a></li>
                    <li><a href="../mypage/main">&nbsp;My Page</a></li>
                    <br>
                    <br>
                    <li><a href="#aboutmsg" id="scroll_move">&nbsp;About</a></li>
                </ul>
            </div>
        </span>
    </div>
</body>
</html>