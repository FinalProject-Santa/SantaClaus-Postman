<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<title>Q&A 답글</title>
<link rel="shortcut icon" href="/resources/image/kids/favicon.ico">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<style>
h1{display: inline;}
section{margin-left: 30%; margin-right: 30%;}
</style>
<body>
    <h1>고객센터</h1>
    <button onclick="location.href='notice';">공지사항</button>
    <button onclick="location.href='qnalist';">Q&A</button>
    <button onclick="location.href='faq';">FAQ</button>
    
    <section id="sec_qna">
        <h3>답글쓰기</h3>
        <form action="/customer/qnainsertReply" method="post"  enctype="multipart/form-data">
        <label for="qna_title">제목</label>
        <input type="text" name="qna_title" id="qna_title"><br>
        <br>
        <textarea cols="80px" rows="20px" name="qna_content"></textarea><br>
        <%--<input type="file" name="files"><br> --%>
        <input type="submit" value="등록">       
        
    </form>
    </section>  

   
</body>
</html>