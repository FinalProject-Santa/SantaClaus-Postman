<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<%@include file="../include/header2.jsp" %>
<%@include file="../include/floatingMenu.jsp" %>

	<div class="container">

		<!-- DataTales Example -->
	
		<div class="">
			<div class="col-sm-12">
				
				<div class="col-xs-12" style="margin: 15px auto;">
					<!-- <label style="font-size:20px;"><span class="glyphicon glyphicon-list-alt" style="margin-right:5px;"></span>후기 목록</label> -->
					<i class="fa-duotone fa-list-ul"></i>후기 목록
					<c:if test="${sessionScope.member != null}">
						<button class="btn btn-primary btn-sm"
							style="float: right; font-size: 13px;"
							onclick="location.href='/review/reviewinsertform'">후기 작성</button>
					</c:if>
				</div>

				<table class="table table-bordered dataTable" id="dataTable"
							role="grid"
							aria-describedby="dataTable_info" >
							<thead>
								<tr role="row" style="text-align: center;">
									<th style="border-right: hidden; border-left: hidden;">NO</th>
									<th style="border-right: hidden;">썸네일</th>
									<th style="border-right: hidden;">제목</th>
									<th style="border-right: hidden;">작성자</th>
									<th style="border-right: hidden;">별점</th>
									<th style="border-right: hidden;">조회수</th>
									<th style="border-right: hidden;">날짜</th>
								</tr>
							</thead>
							<tbody>

								<c:choose>
									<c:when test="${fn:length(list) > 0 }">
										<c:forEach items="${list }" var="review">
											<tr onclick="location.href='/review/reviewDetail/${review.REVIEW_NO}'" style="cursor:pointer;">
												<td style="vertical-align: middle; text-align: center; border-right: hidden; border-left: hidden;">${review.REVIEW_NO }</td>
												<td style="text-align: center; border-right: hidden;"><img alt="이미지 없음" src="/resources/image/uploadFiles/${review.RIMG }" height="90" width="100"/></td>
												<td style="vertical-align: middle; border-right: hidden;">${review.REVIEW_TITLE }</td>
												<td style="vertical-align: middle; text-align: center; center; border-right: hidden;">${review.USER_ID}</td>
												<td style="vertical-align: middle; text-align: center; center; border-right: hidden;"><span
													class="star-prototype">${review.REVIEW_BEST}</span>(${review.REVIEW_BEST})</td>
												<td style="vertical-align: middle; text-align: center; center; border-right: hidden;">${review.REVIEW_COUNT }</td>
												<td style="vertical-align: middle; text-align: center; center; border-right: hidden;"><fmt:formatDate
														pattern="yyyy-MM-dd" value="${review.REVIEW_DATE }" /></td>
											</tr>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<tr>
											<td colspan="7" style="text-align: center; border-right: hidden; border-left: hidden;">작성된 글이 없습니다.</td>
										</tr>
									</c:otherwise>
								</c:choose>
							</tbody>
							<tbody>
								<tr>
									<td colspan="7" style="vertical-align: middle; text-align: center; border-right: hidden; border-left: hidden; border-bottom: hidden">
									<ul class="pagination justify-content-center">
										<c:if test="${pageMaker.prev }">
											<li class="page-item disabled">
											<a class="page-link" href='<c:url value="/review/reviewList?page=${pageMaker.startPage-1 }"/>'><span aria-hidden="true">&laquo;</span>
											</a>
											</li>
										</c:if>
										<c:forEach begin="${pageMaker.startPage }"
											end="${pageMaker.endPage }" var="pageNum">
											<li class="page-item" aria-current="page"><a class="page-link"
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