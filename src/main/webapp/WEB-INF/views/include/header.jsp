<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<!-- <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css" /> -->
	<link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Myeongjo&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/5f55d70e54.js" crossorigin="anonymous"></script>
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
    display: flex;
    width: 100%;
    height: 70px;
    background-color: white;
    z-index: 9;
    border-bottom: solid 0.5px lightgray;
}
.header2{
    padding: 30px;
    width: 100%;
}
#logo{
    font-weight: bold;
    font-size: 40px;
    cursor: pointer;
}
#sidemenu{
    list-style: none;
    display: flex;
    cursor: pointer;
    padding-top: 10px;
}
#sidemenu li{
    margin-right: 20px;
    font-size: 16px;
}
#menu{
    position: relative;
    font-size: 16px;
    cursor: pointer;
    line-height: 50px;
    width: 150px;
    height: 50px;
    padding-top: 8px;
    padding-left: 20px;
}
#menubox{
    position: absolute;
    width: 225px;
    height: 860px;
    margin-top: 7px;
    margin-left: -50px;
    display: none;
    background-color: white;
    border-right: solid 0.5px lightgray;
}
#menubar{
    position: fixed;
    list-style: none;
    cursor: pointer;
    margin-top: 55px;
    margin-left: 25px;
}
#menubar li{
    font-size: 16px;
    margin-bottom: 40px;
}
#nbsp{
	padding-bottom: 35px;
}
.header2, .footer2{
    display: flex;
    justify-content: space-between;
    align-items: center;
}
.atag{
	text-decoration: none;
    color: black;
}
</style>
</head>

<body>
	<!-- header -->
    <div class="header">
        <div class="header2">
       
        <div style="position: relative;">
            <div id="menu"onclick="maintoggle();">= Menu
            <div id="menubox">
                    <ul id="menubar">
                        <li><a href="../letter/letterList" class="atag">Letter</a></li>
                    	<li><a href="../tree/decotree" class="atag">Tree</a></li>
                    	<li><a href="../review/reviewList" class="atag">Review</a></li>
                    	<li id="nbsp"><a href="../mypage/main" class="atag">My Page</a></li>
                        <li><a href="#about" id="scroll_move" class="atag">About</a></li>
                    </ul>
                </div>
                </div>
        </div>

        <h1 id="logo"><a href="/" class="atag">Dear Santa</a></h1>

        <ul id="sidemenu">
             <li onclick="location.href='/main/loginForm'">Login</li>
            <li><a href="../kids/main" class="atag">Kids</a></li>
        </ul>
        </div>
    </div>
<!-- header end -->
