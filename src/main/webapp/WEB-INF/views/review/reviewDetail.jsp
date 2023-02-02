<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<title>Review Detail</title>	
<link rel="shortcut icon" href="/resources/image/kids/favicon.ico">
<link rel="stylesheet" href="/resources/css/review/reviewDetail.css">

<body>
<%@include file="../include/header.jsp"%>
<%@include file="../include/floatingMenu.jsp" %>

<div class="inner">
<p class="headCategory" style="text-align: right">
			<a href="/">Home</a> > Review List > Review Detail
		</p>
	<div class="container">
		<div class="col-sm-11" >
			<div class="col-sm-12">
						<img alt="" src="/resources/image/uploadFiles/${files.rfile_name}" height="300" width="300">
						<br>
						<br>
		
			<h3><i class="fa-sharp fa-solid fa-table-list" style="margin-right:5px;"></i>후기</h3>
			<table class="table table-success">
				<tr>
					<th width=30% height=40px class="text-center ">제목</th>
					<td width=40% height=40px class="text-left">${reviewdetail.review_title }</td>
					<th width=30% height=40px class="text-center">별점</th>
					<td width=40% height=40px class="text-left"><span class="star-prototype" style="margin-right :60px;">${reviewdetail.review_best}</span></td>
				</tr>
				<tr>
					<th width=30% height=40px class="text-center ">이름</th>
					<td width=40% height=40px class="text-left">${reviewdetail.user_id }</td>
					<th width=30% height=40px class="text-center ">조회수</th>
					<td width=40% height=40px class="text-left">${reviewdetail.review_count }</td>
				</tr>
				<!-- <c:if test="${vo.filecount>0 }">
					<tr>
						<th width=20% class="text-center ">이미지</th>
						<td colspan="8" class="text-left">
							<ul>
								<c:forEach var="files" items="${fList }" varStatus="s">
									<li><a href="download.do?fn=${file }">${file }</a>&nbsp;(${sList[s.index]}Bytes)</li>
								</c:forEach>
							</ul>
						</td>
					</tr>
				</c:if>  -->
				<tr class="view">
					<td colspan="4" class="text-left" valign="top" height=150>
					<div class="detail">
				
						<p>${reviewdetail.review_content }</p>
		
					</div>
					
						
					</td>
				</tr>
			</table>
					
				<span class="list_area">					
					<c:if test="${prev ne 0 }">
						<i class="fa-sharp fa-solid fa-angle-left" style="margin-right:5px;"></i><a href="${pageContext.request.contextPath }/review/reviewDetail/${prev }" >이전글</a>
					</c:if>	
					<span style="margin-left:772px;"></span>
					<c:if test="${next ne 0 }">
						<a href="${pageContext.request.contextPath }/review/reviewDetail/${next }" style="">다음글</a><i class="fa-sharp fa-solid fa-angle-right" style="margin-left:5px;"></i>
					</c:if>						
				</span>	
				<span class="btn_area">
						<button onclick="location.href='/review/reviewList'" class="btn btn-sm btn-warning" >목록</button>
					<c:if test="${sessionScope.member.user_id == reviewdetail.user_id}">
						<button class="btn"
							onclick="location.href='/review/reviewUpdate/${reviewdetail.review_no }'">수정</button>
						<button class="btn" id="btn_del">삭제</button>
					</c:if>
				</span>
			</div>
			</div>
		</div>
	</div>	
<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.9.0/jquery.js"></script>
	<script>
	$.fn.generateStars = function() {
		return this.each(function(i, e) {
			$(e).html($('<span/>').width($(e).text() * 16));
		});
	};

	// 숫자 평점을 별로 변환하도록 호출하는 함수
	$('.star-prototype').generateStars();
	
	$("#btn_del").click(function(){
		var deleteCk = confirm("정말 삭제하시겠습니까?");
		if(deleteCk){
			location.href='/review/reviewDelete/${reviewdetail.review_no }';
		} 
	});
	
	</script>
<%@include file="../include/footer.jsp" %>
</body>
</html>
