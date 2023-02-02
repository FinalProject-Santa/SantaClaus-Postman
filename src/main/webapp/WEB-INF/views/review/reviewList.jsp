<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<title>Review List</title>
<link rel="shortcut icon" href="/resources/image/kids/favicon.ico">
<link rel="stylesheet" href="/resources/css/review/reviewList.css">
<body>
<%@include file="../include/header.jsp" %>
<%@include file="../include/floatingMenu.jsp" %>

	<div class="inner">
<p class="headCategory" style="text-align: right">
			<a href="/">Home</a> > Review List
		</p>
	
		<div class="container">
				
				<div class="col-xs-12" style="text-align: left;">
					<i class="fa-sharp fa-solid fa-list"></i><span style="margin-left: 5px;"></span><label style="font-size:18px;">후기 게시판</label>
					<!--  <i class="fa-duotone fa-list-ul"></i><h3>후기 목록</h3>-->
				</div>
			<div class="col-sm-12">
	
				<table class="table table-bordered dataTable" id="dataTable"
							role="grid"
							aria-describedby="dataTable_info" style="table-layout:fixed">
							<thead>
								<tr role="row" style="">
									<th style="border-right: hidden; border-left: hidden; text-align: center;" width="100px";>NO</th>
									<th style="border-right: hidden; text-align: center;">썸네일</th>
									<th style="border-right: hidden;" class="title_id" width="400px;">제목</th>
									<th style="border-right: hidden; text-align: center;">작성자</th>
									<th style="border-right: hidden; text-align: center;">별점</th>
									<th style="border-right: hidden; text-align: center;">조회수</th>
									<th style="border-right: hidden; text-align: center;">날짜</th>
								</tr>
							</thead>
							
							<tbody>
								<c:choose>
									<c:when test="${fn:length(list) > 0 }">
										<c:forEach items="${list }" var="review">
											<tr onclick="location.href='/review/reviewDetail/${review.REVIEW_NO}'" style="cursor:pointer;">
												<td style="vertical-align: middle; text-align: center; border-right: hidden; border-left: hidden;">${review.REVIEW_NO }</td>
												<td style="text-align: center; border-right: hidden;"><img alt="로딩 중" src="/resources/image/uploadFiles/${review.RIMG }" height="100" width="100"/></td>
												<td style="overflow:hidden;white-space:nowrap;text-overflow:ellipsis; max-width:200px; vertical-align: middle; border-right: hidden;" >${review.REVIEW_TITLE }</td>
												<td style="vertical-align: middle; text-align: center; center; border-right: hidden;">${review.USER_ID}</td>
												<td style="vertical-align: middle; text-align: center; center; border-right: hidden;"><span
													class="star-prototype">${review.REVIEW_BEST}</span></td>
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

									<ul class="pagination">
										<c:if test="${pageMaker.prev }">
											<li class="pagination">
											<a class="" href='<c:url value="/review/reviewList?page=${pageMaker.startPage-1 }"/>'><span aria-hidden="true">&laquo;</span>
											</a>
											</li>
										</c:if>
										<c:forEach begin="${pageMaker.startPage }"
											end="${pageMaker.endPage }" var="pageNum">
											<li class="pagination" aria-current="page"><a class=""
												href='<c:url value="/review/reviewList?page=${pageNum }"/>'>${pageNum }
												</a>
											</li>
										</c:forEach>
										<c:if test="${pageMaker.next && pageMaker.endPage >0 }">
											<li class="pagination"><a class=""
												href='<c:url value="/review/reviewList?page=${pageMaker.endPage+1 }"/>' aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>
										</c:if>
									</ul>
								</td>
							</tr>
						</tbody>	
						</table>
					</div>
<%-- 				
	<c:if test="${sessionScope.member != null}">
						<button class="btn btn-primary btn-sm"
							style="float: right; font-size: 13px;"
							onclick="location.href='/review/reviewinsertform'">후기 작성</button>
					</c:if> --%>
				</div>
			</div>
		
	

	
		<script type="text/javascript"
		src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.9.0/jquery.js"></script>
	<script>
	
	$(function(){   
    $('.disabled').on('click', function(event){
        event.preventDefault();
    }); 
    /* 검색 버튼 클릭 이벤트 핸들러 */
    $('#searchBtn').on("click", function(event){        
        // 검색옵션 값 가져오고
        var searchType = $("select[name=searchType]").val();        
        // 키워드 값 가져와서
        var keyword = $("input[name=keyword]").val();       
        self.location = "/notice/noticeList.do${pageMaker.makeQuery(1)}&searchType=" + searchType + "&keyword=" + encodeURI(keyword);
    });//on()       
});
	
	
	
	
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