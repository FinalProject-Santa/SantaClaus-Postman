<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<style>
h1{display: inline;}
section{margin-left: 30%; margin-right: 30%;}
</style>
<body>
    <h1>고객센터</h1>
    <button onclick="location.href='notice';">공지사항</button>
    <button onclick="location.href='qna';">Q&A</button>
    <button onclick="location.href='faq';">FAQ</button>
    
    <section id="sec_qna">
        <h3>1:1문의</h3>
        <form name="qna" action="#" method="post">
        <label for="title">제목</label>
        <input type="text" name="title" id="title"><br>
        <span>문의유형</span>
        <select name="category">
            <option>배송문의</option>
            <option>상품문의</option>
            <option>기타문의</option>
        </select>
        <br>
        <textarea cols="80px" rows="20px" name="content"></textarea><br>
        <input type="file"><br>
        <input type="submit" value="등록">
    </form>
    </section>  

    <section id="sec_myqna">
    <h3>내 문의내역</h3>
    <table border=1>
        <tr>
            <th>no</th>
            <th>제목</th>
            <th>작성일</th>
            <th>답변유무</th>
        </tr>
        
        <td>${no}</td>
        <td>${title}</td>
        <td>${date}</td>
        <td>${reply}</td>
        
    </table>
    </section>        

    

</body>
</html>