<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    display: flex;
    width: 100%;
    height: 75px;
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
    font-size: 48px;
    cursor: pointer;
    padding-left: 100px;
}
#sidemenu{
    list-style: none;
    display: flex;
    cursor: pointer;
    padding-top: 10px;
}
#sidemenu li{
    margin-right: 20px;
    font-size: 25px;
}
#menu{
    position: relative;
    font-size: 25px;
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
    margin-top: 9.5px;
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
    margin-left: 18px;
}
#menubar li{
    font-size: 22.5px;
    margin-bottom: 40px;
}
#nbsp{
	padding-bottom: 35px;
}
.atag{
	text-decoration: none;
    color: black;
}
.header2, .footer2{
    display: flex;
    justify-content: space-between;
    align-items: center;
}
</style>
</head>
<body>
	
    <!-- header -->
    <div class="header">
        <div class="header2">
        <div style="position: relative;">
	            <div id="menu"onclick="maintoggle();">= 메뉴
	            <div id="menubox">
                    <ul id="menubar">
                        <li onclick="location.href='/kids/gamemain'" class="atag">미니게임</li>
                    	<li onclick="location.href='/kids/diary'" class="atag">그림일기</li>
                    	<li onclick="location.href='/kids/mainsticker'" class="atag">칭찬 스티커</li>
                    	<li onclick="location.href='/kids/santamail'" class="atag" id="nbsp">산타 우편함</li>
                        <li class="atag" onclick="location.href='/main/kidsprofile'">프로필 선택</li>
                    </ul>
                </div>
                </div>
        </div>
		</form>
		
        <h1  onclick="location.href='/kids/main'" class="atag" id="logo">Dear Santa</h1>

        <ul id="sidemenu">
             <li>${kids.kids_nickname }야 만나서 반가워!</li>
        </ul>
        </div>
    </div>
<!-- header end -->