<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<%@include file="../include/header.jsp"%>
<%@include file="../include/floatingMenu.jsp"%>
<link rel="stylesheet" href="/resources/css/customer/qnalist.css">


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

		<section id="sec_myqna">
			<h3>
				<i class="fa-sharp fa-solid fa-check"></i> Q&A
			</h3>
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
								<td><c:choose>
										<%------ title 영역 -------%>

										<%-- 선택1. 답글일때 --%>
										<c:when test="${dto.dep > 0}">
											<span style="padding-left: 30px"></span>
											<span style="font-size: 10pt">답변:</span>


											<%-- 선택 1-1 : 공개글에 대한 답변 --%>

											<c:if test="${dto.secret eq 'false'}">
												<a href="/customer/qnadetail?qna_no=${dto.qna_no}">${dto.qna_title}</a>
											</c:if>

											<%-- 선택 1-2 : 비밀글에 대한 답변 --%>
											<c:if test="${dto.secret eq 'true'}">
												<c:choose>
													<%-- 작성자이거나 관리자일때는 타이틀 표시한다  --%>
													<c:when
														test="${dto.user_id eq user_id || user_id eq 'ADMIN' || user_id eq 'admin'}">
														<a href="/customer/qnadetail?qna_no=${dto.qna_no}">${dto.qna_title}</a>
													</c:when>

													<c:otherwise>
														<img id="lock" src="../resources/image/customer/lock.png"> 비밀글입니다.
													</c:otherwise>

												</c:choose>
											</c:if>

										</c:when>
										<%--선택1 답변일때 종료 --%>

										<%-- 선택2. 원글일때 --%>

										<c:otherwise>

											<%-- 선택2-1 : 공개로 작성한 게시글 --%>
											<c:if test="${dto.secret eq 'false'}">
												<a href="/customer/qnadetail?qna_no=${dto.qna_no}">${dto.qna_title}</a>
											</c:if>

											<%-- 선택2-2 : 비밀로 작성한 게시글 --%>

											<c:if test="${dto.secret eq 'true'}">

												<c:choose>

													<%-- 비밀로 작성한 글 : 관리자일때는 다 보임--%>
													<c:when test="${user_id eq 'admin' || user_id eq 'ADMIN' }">
														<a href="/customer/qnadetail?qna_no=${dto.qna_no}">${dto.qna_title}</a>
													</c:when>

													<%-- 비밀로 작성한 글 : 관리자 아닐때는 작성자여만 보임 --%>
													<c:otherwise>
														<c:choose>
															<c:when test="${dto.user_id eq user_id }">
																<a href="/customer/qnadetail?qna_no=${dto.qna_no}">${dto.qna_title}</a>
															</c:when>
															<c:otherwise>
																<img id="lock"
																	src="../resources/image/customer/lock.png"> 비밀글은 작성자와 관리자만 볼 수 있습니다.
										</c:otherwise>
														</c:choose>
													</c:otherwise>




													<%-- 
								case1 : 작성자가 아닐때
								<c:when test="${dto.user_id ne user_id || user_id ne 'admin'|| user_id  'ADMIN'}"> 
								<img id="lock" src="../resources/image/customer/lock.png"> 비밀글은 작성자와 관리자만 볼 수 있습니다111.
								</c:when>
								
								<c:when test="${dto.user_id eq user_id}">
								<a href="/customer/qnadetail?qna_no=${dto.qna_no}">${dto.qna_title}</a>
								</c:when>
							
								<c:when test="${user_id eq 'ADMIN'}">
								<a href="/customer/qnadetail?qna_no=${dto.qna_no}">${dto.qna_title}</a>
								</c:when>
								
								
								<c:when test='${user_id eq "admin"}'>
								<a href="/customer/qnadetail?qna_no=${dto.qna_no}">${dto.qna_title}</a>
								</c:when>
								
								
								<c:otherwise>
							 	<a href="/customer/qnadetail?qna_no=${dto.qna_no}">${dto.qna_title}</a>
								</c:otherwise>  --%>


												</c:choose>
											</c:if>


										</c:otherwise>
										<%--선택2 원글일 때 선택지 종료 --%>

									</c:choose></td>
								<%-----------------------------타이틀 영역---------------------------- --%>

								<td><fmt:formatDate value="${dto.qna_date}"
										pattern="yyyy/MM/dd" /></td>
							</tr>


						</c:forEach>
					</c:when>
				</c:choose>
			</table>

			<input type="button" value="글쓰기"
				onclick="location.href='/customer/qnainsertform'" />
		</section>


	</div>
	<!-- inner -->

	<%@include file="../include/footer.jsp"%>