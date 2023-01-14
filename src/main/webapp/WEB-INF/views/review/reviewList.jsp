<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>reviewList</title>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">

<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>


<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Poor+Story&display=swap"
	rel="stylesheet">

<style>
* {
	font-family: 'Poor Story', cursive !important;
}
</style>

</head>
<body>

	<jsp:include page="" />

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
							width="100%" cellspacing="0" role="grid"
							aria-describedby="dataTable_info" style="width: 100%;">
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
									<tr
										onclick="location.href='/review/reviewDetail/${review.REVIEW_NO}'">
										<td style="text-align: center;">${review.REVIEW_NO }</td>
										<td>${review.REVIEW_TITLE }</td>
										<td style="text-align: center;">${review.USER_ID}</td>
										<td style="text-align: center;"><small
											class="text-muted ${review.REVIEW_BEST}"></small></td>
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
							<tr>
								<td colspan="4" align="right"><input type="button"
									value="글작성" onclick="location.href='/review/reviewinsertform'">
								</td>
							</tr>
						</table>
					</div>
				
				</div>
			</div>
		</div>
<ul class="btn-group pagination">
    <c:if test="${pageMaker.prev }">
    <li>
        <a href='<c:url value="/review/reviewList?page=${pageMaker.startPage-1 }"/>'>&lt;<i class="fa fa-chevron-left"></i></a>
    </li>
    </c:if>
    <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="pageNum">
    <li>
        <a href='<c:url value="/review/reviewList?page=${pageNum }"/>'><i class="fa">${pageNum }</i></a>
    </li>
    </c:forEach>
    <c:if test="${pageMaker.next && pageMaker.endPage >0 }">
    <li>
        <a href='<c:url value="/review/reviewList?page=${pageMaker.endPage+1 }"/>'>&gt;<i class="fa fa-chevron-right"></i></a>
    </li>
    </c:if>
</ul>


	<script>
		$(".1").html("&#9733; &#9734; &#9734; &#9734; &#9734;");
		$(".2").html("&#9733; &#9733; &#9734; &#9734; &#9734;");
		$(".3").html("&#9733; &#9733; &#9733; &#9734; &#9734;");
		$(".4").html("&#9733; &#9733; &#9733; &#9733; &#9734;");
		$(".5").html("&#9733; &#9733; &#9733; &#9733; &#9733;");
	</script>

</body>
</html>