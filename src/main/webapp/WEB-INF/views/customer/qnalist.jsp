<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
</head>
<style>
h1 {
	display: inline;
}

section {
	margin-left: 30%;
	margin-right: 30%;
}

img{ 
	width: 15px;
	hight: 15px;
}
</style>
<body>
	<h1>고객센터</h1>
	<button onclick="location.href='notice';">공지사항</button>
	<button onclick="location.href='qnalist';">Q&A</button>
	<button onclick="location.href='faq';">FAQ</button>

	<section id="sec_myqna">
	<h3>Q&A</h3>
		<table border=1>
			<col width="50">
			<col width="100">
			<col width="100">
			<col width="500">
			
				<tr>
					<th>no</th>
					<th>작성자</th>
					<th>문의유형</th>
					<th>제목</th>
					<th>작성일</th>
				</tr>


			<!--여기는 리스트뿌리기 -->
			<c:choose>		
			
				<c:when test="${empty qnalist}">
					<tr>
						<td colspan="4">----------작성된 문의가 없습니다----------</td>
					</tr>
				</c:when>
				
				<c:when test="${!empty qnalist }">
					<c:forEach var="dto" items="${qnalist}">
						<tr align="center">
							<td>${dto.qna_no}</td>
							<td>${dto.user_id }</td>
							<td>${dto.qna_type}</td>
							<td>
					
				<c:choose>
					 
					 <%-- 답글이면 들여쓰기와 답변 표시 --%>
						<c:when test="${dto.dep > 0}"> 
							<span style="padding-left:30px"></span>
							<span style="font-size:10pt">답변:</span>
						
						
						<%-- 답글이면서 공개글 --%>
						
							<c:if test="${dto.secret eq 'false'}">
								<a href="/customer/qnadetail?qna_no=${dto.qna_no}">${dto.qna_title}</a>
							 </c:if>
								
						<%-- 답글이면서 + 비공개글 --%>	
							<c:if test="${dto.secret eq 'true'}">	
								<c:if test="${dto.user_id ne user_id || dto.user_id ne 'ADMIN' || dto.user_id ne 'admin'}">
							 	  <img src="../resources/image/customer/lock.png"> 비밀글입니다.
								</c:if>
							</c:if>	
						
								
						</c:when> 

					<%--원글이면--%>
						
						<c:otherwise>
						
						  		 <%--원글이면서 비밀글이 아닐때 --%>
							<c:if test="${dto.secret eq 'false'}">
								<a href="/customer/qnadetail?qna_no=${dto.qna_no}">${dto.qna_title}</a>
							</c:if>
							
								<%-- 원글이면서 비밀글일때 --%>
						
							<c:if test="${dto.secret eq 'true'}">
							 	 <img src="../resources/image/customer/lock.png"> 비밀글은 작성자와 관리자만 볼 수 있습니다.
								
								<c:if test= "${dto.user_id eq user_id || user_id eq 'ADMIN' || user_id eq 'admin'}">
									<a href="/customer/qnadetail?qna_no=${dto.qna_no}">${dto.qna_title}</a>
								</c:if>
							
							</c:if>
						
							
							
					</c:otherwise>
				</c:choose>
				
				
				
							</td>
							<td><fmt:formatDate value="${dto.qna_date}" pattern="yyyy/MM/dd"/></td>
						</tr>
						
					
					</c:forEach>
				</c:when>
			</c:choose>
		</table>
		
		<input type="button" value="글쓰기" onclick="location.href='/customer/qnainsertform'"/>
	</section>




</body>
</html>