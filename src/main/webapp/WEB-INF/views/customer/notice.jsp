<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

    <!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>공지사항</title>
</head>
<style>
  h1{display: inline;}
  </style>
<body>
        <h1>고객센터</h1>
        <button onclick="location.href='notice';">공지사항</button>
    	<button onclick="location.href='qnainsertform';">Q&amp;A</button>
    	<button onclick="location.href='faq';">FAQ</button>
    

<table border="1">
<col width="50">
<col width="100">
<col width="300">
<col width="200">

<tr>
<th>NO</th>
<th>작성자</th>
<th>제목</th>
<th>작성일</th>
</tr> 
<c:choose>
<c:when test="${empty list}">
<tr>
<td colspan="4">----------작성된 글이 없습니다----------</td>
</tr>
</c:when>
<c:otherwise>
<c:forEach var="dto" items="${list}">
<tr>
<td>${dto.no}</td>
<td>${dto.writer }</td>
<td><a href="/customer/notice_detail?no=${dto.no}">${dto.title }</a></td>
 <fmt:formatDate var="date" value="${dto.regdate }" pattern="yyyy/MM/dd"/>
<td>${date }</td>
</tr>
</c:forEach>
</c:otherwise>
</c:choose>

</table>

  
</body>
</html>
