<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<body>
<%@include file="../include/header.jsp" %>
<%@include file="../include/floatingMenu.jsp" %>

	<div class="container-fluid">

		<!-- Page Heading 
        <h1 class="h3 mb-2 text-gray-800">Tables</h1>
        <p class="mb-4">
            DataTables is a third party plugin that is used to generate the demo table below.
            For more information about DataTables, please visit the 
            <a target="_blank" href="https://datatables.net">official DataTables documentation</a>.
        </p>
        -->

		<!-- DataTales Example -->
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<h4 class="">후기 목록</h4>

				<div class="row">
					<div class="col-sm-12">
						<table class="table table-bordered dataTable" id="dataTable"
							role="grid"
							aria-describedby="dataTable_info" >
							<thead>
								<tr role="row" style="text-align: center;">
									<th>게시판 번호</th>
									<th>제목</th>
									<th>작성자</th>
									<th>별점</th>
									<th>조회수</th>
									<th>작성일</th>
								</tr>
							</thead>
							<tbody>

								<c:choose>

									<c:when test="${fn:length(list) > 0 }">
										<c:forEach items="${list }" var="review">
											<tr onclick="location.href='/review/reviewDetail/${review.REVIEW_NO}'" style="cursor:pointer;">
												<td style="text-align: center;">${review.REVIEW_NO }</td>
												<td>${review.REVIEW_TITLE }</td>
												<td style="text-align: center;">${review.USER_ID}</td>
												<td style="text-align: center;"><span
													class="star-prototype">${review.REVIEW_BEST}</span>(${review.REVIEW_BEST})</td>
												<td style="text-align: center;">${review.REVIEW_COUNT }</td>
												<td style="text-align: center;"><fmt:formatDate
														pattern="yyyy-MM-dd" value="${review.REVIEW_DATE }" /></td>
											</tr>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<tr>
											<td colspan="7">조회된 결과가 없습니다.</td>
										</tr>
									</c:otherwise>
								</c:choose>
							</tbody>
						</table>
							
								
								<nav aria-label="Page navigation example">
									<ul class="pagination justify-content-center">
										<c:if test="${pageMaker.prev }">
											<li class="page-item">
											<a class="page-link" href='<c:url value="/review/reviewList?page=${pageMaker.startPage-1 }"/>'><span aria-hidden="true">&laquo;</span>
											</a>
											</li>
										</c:if>
										<c:forEach begin="${pageMaker.startPage }"
											end="${pageMaker.endPage }" var="pageNum">
											<li class="page-item"><a class="page-link"
												href='<c:url value="/review/reviewList?page=${pageNum }"/>'>${pageNum }
												</a>
											</li>
										</c:forEach>
										<c:if test="${pageMaker.next && pageMaker.endPage >0 }">
											<li class="page-item"><a class="page-link"
												href='<c:url value="/review/reviewList?page=${pageMaker.endPage+1 }"/>' aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>
										</c:if>
									</ul>
								</nav>
								<div style="float: left">
								<c:if test="${sessionScope.member != null}"><input type="button" 
							value="글작성" onclick="location.href='/review/reviewinsertform'">
								</c:if>
							</div>
					</div>

				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript"
		src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.9.0/jquery.js"></script>

	<script>
		$.fn.generateStars = function() {
			return this.each(function(i, e) {
				$(e).html($('<span/>').width($(e).text() * 16));
			});
		};

		// 숫자 평점을 별로 변환하도록 호출하는 함수
		$('.star-prototype').generateStars();
	</script>
<%@include file="../include/footer.jsp" %>
</body>
</html>