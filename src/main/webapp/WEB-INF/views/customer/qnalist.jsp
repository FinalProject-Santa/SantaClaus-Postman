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
    <title>Document</title>
</head>
<style>
h1{display: inline;}
section{margin-left: 30%; margin-right: 30%;}
</style>
<body>
    <h1>고객센터</h1>
    <button onclick="location.href='notice';">공지사항</button>
    <button onclick="location.href='qnainsertform';">Q&A</button>
    <button onclick="location.href='faq';">FAQ</button>
    
    <section id="sec_myqna">
    <h3>내 문의내역</h3>
    <table border=1>
    <col width="50">
 	<col width="100">
	<col width="200">	
	<col width="100">
	<col width="50">

        <tr>
           <th>no</th>
           <th>문의유형</th>
           <th>제목</th>
           <th>작성일</th>
           <th>답변유무</th>
        </tr>
      
        
        <c:choose>
		<c:when test="${empty qnalist}">
		<tr>
		<td colspan="5">----------작성된 문의가 없습니다----------</td>
		</tr>
		</c:when>
		<c:otherwise>
		<c:forEach var="dto" items="${qnalist}">
        <tr>
        <td>${dto.qna_no}</td>
        <td>${dto.qna_type}</td>
        <td><a href="/customer/qnadetail?qna_no=${dto.qna_no}">${dto.qna_title}</a></td>
        <fmt:formatDate var="date" value="${dto.qna_date }" pattern="yyyy/MM/dd"/>
        <td>${date}</td>
        
        </tr>
        </c:forEach>
   		</c:otherwise>
   		</c:choose>
   		 </table>
     </section> 
     
   

  
</body>
</html>