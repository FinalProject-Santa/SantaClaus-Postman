<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<title>Letter List</title>
<link rel="shortcut icon" href="/resources/image/kids/favicon.ico">
<link rel="stylesheet" href="/resources/css/letter/letterList.css">

<body>
	<!-- header, 고객센터 -->
	<%@include file="../include/header.jsp" %>
	<%@include file="../include/floatingMenu.jsp" %>
	
	<div class="inner">
		<p class="headCategory" style="text-align: right">
			<a href="/">Home</a> > Letter List
		</p>
		<div class="letterList">
			<c:forEach var="list" items="${letterList }">
				<div class="letterBox" onclick="location.href='/letter/detail/${list.LETTER_NO }?letterName=${list.LETTER_NAME }&letterImg=${list.LETTER_IMG }&letterPrice=${list.LETTER_PRICE}'">
					<div class="letterImg">
						<img class="img-fluid" src="${list.LETTER_IMG }" alt="엽서 이미지">
					</div>
					<div class="letterInfo">
						<p><b>${list.LETTER_NAME }</b></p>
						<p><b><fmt:formatNumber type="number" value="${list.LETTER_PRICE }"/>원</b></p>
					</div>
				</div>
			</c:forEach>
		</div>
		<ul class="paginationUl">
			<c:if test="${pageMaker.prev }">
				<li class="pagination">
					<a class="page-link" href='<c:url value="/letter/letterList?page=${pageMaker.startPage-1 }"/>'><span aria-hidden="true">&laquo;</span></a>
				</li>
			</c:if>
			<c:forEach begin="${pageMaker.startPage }"
				end="${pageMaker.endPage }" var="pageNum">
				<li class="pagination"><a class="page-link" href='<c:url value="/letter/letterList?page=${pageNum }"/>'>${pageNum }</a>
				</li>
			</c:forEach>
			<c:if test="${pageMaker.next && pageMaker.endPage >0 }">
				<li class="pagination"><a class="page-link" href='<c:url value="/letter/letterList?page=${pageMaker.endPage+1 }"/>' aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>
			</c:if>
		</ul>
	</div>
	
	<!-- footer -->
	<%@include file="../include/footer.jsp" %>
</body>
</html>