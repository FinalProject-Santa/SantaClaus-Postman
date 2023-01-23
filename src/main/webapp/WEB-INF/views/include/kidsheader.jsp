<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
@import url('https://fonts.googleapis.com/css2?family=Gaegu:wght@300;400;700&family=Hi+Melody&display=swap');
html{
    margin: 0;
}
body {
    height: auto;
    margin: 0;
    font-family: 'Gaegu', cursive;
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
    font-size: 45px;
    left: 535px;
    top: 9px;
    cursor: pointer;
}
#sidemenu{
    position: relative;
    list-style: none;
    float: right;
    cursor: pointer;
    right: 15px;
    top: 14px;
}
#sidemenu li{
    float: left;
    margin-right: 20px;
    font-size: 22px;
}
#menu{
    position: relative;
    float: left;
    font-size: 23px;
    cursor: pointer;
    top: 26px;
    left: 40px;
    width: 80px;
    height: 50px;
}
#menubox{
    position: absolute;
    top: 44.7px;
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
    font-size: 20px;
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
        <span id="logo"><a href="./main">Dear Santa</a></span>
        <ul id="sidemenu">
            <li>oo야 만나서 반가워!</li>
            <!-- <li>Cart</li> -->
        </ul>
        <span id="menu">= 메뉴
        <div id="menubox">
                <ul id="menubar">
                    <li onclick="location.href='/kids/puzzle'">&nbsp;미니게임</li>
                    <li onclick="location.href='/kids/diary'">&nbsp;그림일기</li>
                    <li onclick="location.href='/kids/sticker'">&nbsp;칭찬 스티커</li>
                    <li><a href="">&nbsp;산타 우편함</a></li>
                    <br>
                    <br>
                    <li><a>&nbsp;프로필 선택</a></li>
                </ul>
            </div>
        </span>
    </div>
</body>
</html>