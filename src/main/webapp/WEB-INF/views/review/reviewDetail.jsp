<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="refresh">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>
	<script src="https://kit.fontawesome.com/9af41011f1.js" crossorigin="anonymous"></script>
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/css/review/reviewDetail.css">
</head>
<body>
	<div class="container">
		<div class="row">
			<h3><i class="fa-sharp fa-solid fa-check"></i>후기</h3>
			<table class="table table-success table-striped">
				<tr>
					<th width=20% class="text-center primary">게시글 번호</th>
					<td width=30% class="text-left">${reviewdetail.review_no }</td>
					<th width=20% class="text-center ">작성일</th>
					<td width=30% class="text-left"><fmt:formatDate
							value="${reviewdetail.review_date}" pattern="yyyy-MM-dd" /></td>
				</tr>
				<tr>
					<th width=20% class="text-center ">이름</th>
					<td width=30% class="text-left">${reviewdetail.user_id }</td>
					<th width=20% class="text-center ">조회수</th>
					<td width=30% class="text-left">${reviewdetail.review_count }</td>
				</tr>
				<tr>
					<th width=20% class="text-center ">제목</th>
					<td width=30% class="text-left">${reviewdetail.review_title }</td>
					<th width=20% class="text-center ">별점</th>
					<td width=30% class="text-left"><span class="star-prototype">${reviewdetail.review_best}</span>(${reviewdetail.review_best}점)</td>
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
				<tr>
					<td colspan="4" class="text-left" valign="top" height=200>
						<img alt="" src="/resources/image/uploadFiles/${files.rfile_name}"></td>
				</tr>
				<tr>
					<td colspan="4" class="text-left" valign="top" height=200>
						${reviewdetail.review_content }</td>
				</tr>
				<tr>
					<td colspan="4" class="text-right">
						<button class="btn btn-primary"
							onclick="location.href='/review/reviewUpdate/${reviewdetail.review_no }'">수정</button>
						<button class="btn btn-primary"
							onclick="location.href='/review/reviewDelete/${reviewdetail.review_no }'">삭제</button>
						<a href="" class="btn btn-sm btn-warning">목록</a>
					</td>
				</tr>
			</table>
		</div>
	</div>
<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.9.0/jquery.js"></script>

	<script>
	$.fn.generateStars = function() {
	    return this.each(function(i,e){$(e).html($('<span/>').width($(e).text()*16));});
	};

	// 숫자 평점을 별로 변환하도록 호출하는 함수
	$('.star-prototype').generateStars();
	</script>

</body>
</html>
