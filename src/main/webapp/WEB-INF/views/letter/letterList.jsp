<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="/resources/css/letter/letterList.css">

<body>
	<!-- header, 고객센터 -->
	<%@include file="../include/header.jsp" %>
	<%@include file="../include/floatingMenu.jsp" %>
	<div class="inner">
		<div class="letterWrapper">
			<div class="letterList">
				<c:forEach var="list" items="${letterList }">
					<div>
						<a href="/letter/detail/${list.LETTER_NO }?letterName=${list.LETTER_NAME }&letterImg=${list.letter_img }&letterPrice=${list.letter_price}">
							<img class="img-fluid" src="${list.LETTER_IMG }" alt="엽서 이미지">
						</a>
					</div>
				</c:forEach>
				<ul class="pagination justify-content-center">
					<c:if test="${pageMaker.prev }">
						<li class="page-item">
						<a class="page-link" href='<c:url value="/letter/letterList?page=${pageMaker.startPage-1 }"/>'><span aria-hidden="true">&laquo;</span>
						</a>
						</li>
					</c:if>
					<c:forEach begin="${pageMaker.startPage }"
						end="${pageMaker.endPage }" var="pageNum">
						<li class="page-item"><a class="page-link"
							href='<c:url value="/letter/letterList?page=${pageNum }"/>'>${pageNum }
							</a>
						</li>
					</c:forEach>
					<c:if test="${pageMaker.next && pageMaker.endPage >0 }">
						<li class="page-item"><a class="page-link"
							href='<c:url value="/letter/letterList?page=${pageMaker.endPage+1 }"/>' aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>
					</c:if>
				</ul>
			</div>
		</div>
	</div>
	
	<!-- footer -->
	<%@include file="../include/footer.jsp" %>
</body>
</html>