<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Myeongjo&display=swap" rel="stylesheet">
<style>
html{
    margin: 0;
}
body {
    height: auto;
    margin: 0;
    font-family: 'Nanum Myeongjo', serif;
}
.inner{
    width: 1400px;
    margin: 0 auto;
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
    padding-left: 10px;
}

/* 여기 수정하세요 */
#menubox{
    position: absolute;
    width: 225px;
    height: 860px;
    margin-top: -9.5px;
    margin-left: -30px;
    /* display: none; */
    background-color: white;
    transition: left .3s;
    border-right: solid 0.5px lightgray;
}
#menubar{
    position: fixed;
    list-style: none;
    cursor: pointer;
    margin-top: 55px;
    margin-left: 55px;
}
#menubar li{
    font-size: 16px;
    margin-bottom: 40px;
}
/* #menu:hover > #menubox{
    display: block;
} */
/* 여기까지 */

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
            <p id="menu">= Menu</p>
            <div id="menubox">
                    <ul id="menubar">
                        <li><a href="../letter/letterList">Letter</a></li>
                    	<li><a href="../tree/decotree">Tree</a></li>
                    	<li><a href="../review/reviewList">Review</a></li>
                    	<li><a href="../mypage/main">My Page</a></li>
                        <p>&nbsp;</p>
                        <p>&nbsp;</p>
                        <li><a href="#about" id="scroll_move">About</a></li>
                    </ul>
                </div>
        </div>

        <h1 id="logo"><a href="/">Dear Santa</a></h1>

        <ul id="sidemenu">
            <li>Login</li>
            <li>Kids</li>
        </ul>
        </div>
    </div>
    
</body>
</html>