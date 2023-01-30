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
			       </div> 
			    </c:if>
			  		  ${dto.qna_content}
				</td>
			
			</tr>

			<tr>

				<td id="returnbt"><input type="button" value="<< Return To list" onclick="location.href='/customer/qnalist'"> 
					</td>
					<c:if test="${user_id == 'admin' || user_id == 'ADMIN'}">
						<input type="button" value="답글쓰기"
							onclick="location.href='/customer/qnaReply?qna_no=${dto.qna_no}&qna_type=${dto.qna_type}&secret=${dto.secret}'">
						</c:if>
			</tr>
			<tr>
		     	<td>						
				<c:if test="${user_id == dto.user_id }">
				<input type="button" value="글 삭제하기" onclick="location.href='/customer/qnaDelete/${dto.qna_no}'">
				<input type="button" value="글 수정하기" onclick="location.href='/customer/qnaUpdateform?qna_no=${dto.qna_no}'">
				
				</c:if>
				</td>
			</tr>
			
		</table>
		
	</div>
	

</div>

	<%@include file="../include/footer.jsp"%>
