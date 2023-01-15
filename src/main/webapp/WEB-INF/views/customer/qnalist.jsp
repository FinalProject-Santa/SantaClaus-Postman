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

i{ 
	background: url(../../image/customer/lock.png); 
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
			<col width="300">
			
				<tr>
					<th>no</th>
					<th>작성자</th>
					<th>문의유형</th>
					<th>제목</th>
					<th>작성일</th>
				</tr>

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
						<c:when test="${dto.dep > 0}">
								<c:forEach var="i" begin="0" end="${dto.dep}">
									<span style="padding-left:20px"></span>
								</c:forEach>
								<span style="font-size":7px">re:</span>
								<a class="clas1" href="/customer/qnadetail?qna_no=${dto.qna_no}">${dto.qna_title}</a>
						</c:when> 

						<c:otherwise>
							 <a class="clas1" href="/customer/qnadetail?qna_no=${dto.qna_no}">${dto.qna_title}</a>
						</c:otherwise>
					
					</c:choose>
							
							</td>	
							<td> 						 
							<fmt:formatDate value="${dto.qna_date}" pattern="yyyy/MM/dd"/></td>

						</tr>
					</c:forEach>
				</c:when>
			</c:choose>
		</table>
		
		<input type="button" value="글쓰기" onclick="location.href='/customer/qnainsertform'"/>
	</section>




</body>
</html>