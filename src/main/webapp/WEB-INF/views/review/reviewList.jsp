<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
	<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
	<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
	<link rel="stylesheet" href="/resources/css/review/reviewList.css">
<body>


<%@include file="../include/header.jsp" %>
<%@include file="../include/floatingMenu.jsp" %>

	<div class="container-fluid">

		<!-- DataTales Example -->
		<div class="card shadow mb-1">
			<div class="card py-1">

				<div class="row">
					<div class="col-sm-12">
						  <div class="col-xs-12" style="margin:15px auto;">
        <label style="font-size:20px;"><span class="glyphicon glyphicon-list-alt" style="margin-right:5px;"></span>후기 목록</label>
    	<c:if test="${sessionScope.member != null}">
        <button class="btn btn-primary btn-sm" style="float:right; font-size: 13px;" onclick="location.href='/review/reviewinsertform'">후기 작성</button>
								</c:if>
								</div>	
						<table class="table table-bordered dataTable" id="dataTable"
							role="grid"
							aria-describedby="dataTable_info" >
							<thead>
								<tr role="row" style="text-align: center;">
									<th>게시글 번호</th>
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
											<td colspan="6" >조회된 결과가 없습니다.</td>
										</tr>
									</c:otherwise>
								</c:choose>
							</tbody>
							<tbody>
								<tr>
									<td colspan="6">
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

								</td>
							</tr>
						</tbody>	
						</table>
					</div>

				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript"
		src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.9.0/jquery.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
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