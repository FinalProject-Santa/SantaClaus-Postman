<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<%@include file="../include/header.jsp"%>
<%@include file="../include/floatingMenu.jsp"%>
<link rel="stylesheet" href="/resources/css/customer/qnadetail.css">


<body>

	<div class="inner">
	
		<div class="customer_logo">
			<h1>Customer Service</h1>
		</div>

		<div class=customer_menu>
			<button class="c_bt" onclick="location.href='notice';">NOTICE</button>
			<button class="c_bt" onclick="location.href='qnalist';">Q&A</button>
			<button class="c_bt" onclick="location.href='faq';">FAQ</button>
		</div>
	
	<div class="tableparent">
		<table border="1">
			<tr>
				<td id="type">${dto.qna_type}</td>
			</tr>
			
			<tr>
				<td id="title">${dto.qna_title}</td>
			</tr>

			<tr>
				<td id="userid">${dto.user_id}</td>
				
			</tr>
			
			<tr>
				<td id="content">
				 <c:if test="${not empty files.file_oname && files.file_oname != 'null'}">
				<div style="margin-bottom: 20px;"><img src="/resources/files/${files.file_name}" style="max-width:600px; max-height: 500px;">
			    </div> ${dto.qna_content }
			    </c:if>
			</td>
			
			</tr>

			<tr>

				<td id="returnbt"><input type="button" value="<< Return To list"
					onclick="location.href='/customer/qnalist'"> <c:if
						test="${user_id == 'admin' || user_id == 'ADMIN'}">
						<input type="button" value="답글쓰기"
							onclick="location.href='/customer/qnaReply?qna_no=${dto.qna_no}&qna_type=${dto.qna_type}&secret=${dto.secret}'">
					</c:if></td>
		</table>
	</div>
	

</div>

	<%@include file="../include/footer.jsp"%>
