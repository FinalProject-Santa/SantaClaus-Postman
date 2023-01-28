<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>내 포인트</title>
    <link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
    <link rel="stylesheet" href="/resources/css/mypage/mypoint.css">
</head>
<body>
	<!-- header -->
	<%@include file="../include/header.jsp" %>
	<%@include file="../include/floatingMenu.jsp" %>


    <div id="wrapper">
    
        <nav>
            <h1>포인트</h1>
            <p class="color1">고객님의 사용가능 포인트 금액입니다.</p>
            <p class="box1">총 포인트 ${mypoint}</p>
        </nav>
        <section>
			<p class="box2">포인트 내역</p>
			<hr>
			<div id="tablebox">
				<table>
					<colgroup>
						<col width="150">
						<col width="200">
						<col width="100">
						<col width="150">
						<col width="300">
					</colgroup>
					<tr>
						<th>사용/적립 구분</th>
						<th>날짜</th>
						<th>포인트</th>
						<th>주문번호</th>
						<th>사용/적립 내용</th>
					</tr>
					<c:choose>
						<c:when test="${empty list}">
							<tr>
								<td colspan="5" align="center">----- 적립된 포인트가 없습니다 -----</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach var="dto" items="${list}">
								<tr>
									<td>${dto.point_purpose}</td>
									<td><fmt:formatDate pattern="yyyy-MM-dd"
											value="${dto.point_date}" /></td>
									<td><span id="save">${dto.point}</span></td>
									<td>${dto.order_no}</td>
									<td>${dto.point_content}</td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
					<tr id="paging" >
						<td colspan="6" align="right">
							<ul class="btn-group pagination">
								<c:if test="${pageMaker.prev }">
									<li><a href='<c:url value="/mypage/point?page=${pageMaker.startPage-1 }"/>'>&lt;
										</a></li>
								</c:if>
								<c:forEach begin="${pageMaker.startPage }"
									end="${pageMaker.endPage }" var="pageNum">
									<li><a href='<c:url value="/mypage/point?page=${pageNum }"/>'>
											<i class="fa">${pageNum }</i>
										</a></li>
								</c:forEach>
								<c:if test="${pageMaker.next && pageMaker.endPage >0 }">
									<li><a href='<c:url value="/mypage/point?page=${pageMaker.endPage+1 }"/>'>&gt;
									</a></li>
								</c:if>
							</ul>
						</td>
					</tr>
				</table>
			</div>
		</section>
    </div>

	<!-- footer -->
	<%@include file="../include/footer.jsp" %>
	
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
    <script type="text/javascript">
    
    </script>

</body>
</html>