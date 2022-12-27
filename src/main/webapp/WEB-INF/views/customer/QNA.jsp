<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FAQ</title>
</head>
<style>
    h1{display: inline;}
    section{margin-left: 30%; margin-right: 30%;}


    .faq {position:absolute;top:30%;left:50%;transform:translateX(-50%);width:750px;}
    input[id*="answer"]{display: none ;}
    input[id*="answer"] + label {
        display: block;
        padding: 20px;
        border: 1px solid rgb(211, 207, 207);
        border-bottom: 0;
        color: black;
        font-weight: 900;
        background: rgb(211, 207, 207);
        cursor: pointer;
        position: relative;
    }

    input[id*="answer"] + label em {
        position:absolute;
        top:50%;
        right:10px;
        width:30px;
        height:30px;
        margin-top:-15px;
        display:inline-block;
        background:url('./img/arrow.png') 0 0 no-repeat;}


    input[id*="answer"] + label + div{
        max-height: 0;
        transition: all .35s;
        overflow:hidden;
    }

    input[id*="answer"] + label + div p {display:inline-block;padding:20px;}
    input[id*="answer"]:checked + label + div {max-height: 100px;}
    input[id*="answer"]:checked + label em {background-position: 0 -30px;}

    </style> 
    <body>
        <h1>고객센터</h1>
        <button>공지사항</button>
        <button>Q&A</button>
        <button>FAQ</button>
   
        <div class="faq">
            <input type="checkbox"id="answer01">
            <label for="answer01">자주묻는 질문1<em></em></label>
            <div><p>그런 질문 하지 마십시오.</p></div>
            <input type="checkbox" id="answer02">
            <label for="answer02">자주묻는 질문2<em></em></label>
            <div><p>저도 몰라요 고객님.</p></div>
            <input type="checkbox" id="answer03">
            <label for="answer03">자주묻는 질문3<em></em></label>
            <div><p>꾸꾸리삥뽕</p></div>
            <input type="checkbox" id="answer04">
            <label for="answer04">자주묻는 질문4<em></em></label>
            <div><p>동해물과 백두산이 마르고 닳도록 하나님이 보우하사 우리나라 만세</p></div>
        </div>
</body>
</html>