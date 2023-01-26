<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@include file="../include/header.jsp"%>
<%@include file="../include/floatingMenu.jsp"%>

<link rel="stylesheet" href="/resources/css/customer/notice.css">



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

		<section id="sec_notice">
			<h3><i class="fa-sharp fa-solid fa-check"></i></i> 공지사항</h3>
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
								<fmt:formatDate var="date" value="${dto.regdate }"
									pattern="yyyy/MM/dd" />
								<td>${date }</td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>

			</table>
		</section>

	</div><!-- inner -->


<%@include file="../include/footer.jsp" %>
