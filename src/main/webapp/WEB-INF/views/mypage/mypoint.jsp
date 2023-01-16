<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>내 포인트</title>
    <link rel="stylesheet" href="/resources/css/mypage/mypoint.css">
</head>
<body>
    <div id="wrapper">
        <nav>
            <h1>포인트</h1>
            <p class="color1">고객님의 사용가능 포인트 금액입니다.</p>
            <p class="box1">총 포인트 ${dto.point_save} 3000${dto.point_use}</p>
        </nav>
        <section>
            <div id="content">
                <p class="box2">포인트 내역</p>
                <hr>
                <table>
                    <colgroup>
                        <col width="200">
                        <col width="200">
                        <col width="150">
                        <col width="200">
                        <col width="400">
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
                            <c:forEach items="${list}" var="dto">
                                <tr>
                                    <td>${dto.point_purpose}</td>
                                    <td><fmt:formatDate pattern="yyyy-MM-dd" value="${dto.point_date}"/></td>
                                    <td><span id="save">${dto.point_save}</span><span id="use">${dto.point_use}</span></td>
                                    <td>${dto.order_no}</td>
                                    <td>${dto.point_content}</td>
                                </tr>
                            </c:forEach>
                        </c:otherwise>
                    </c:choose>
                </table>
                <div class="pagination-wrapper clearfix">
                	<ul class="pagination float--right" id="pages"></ul>
                </div>
            </div>
        </section>
    </div>
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
    <script>
    function paging (totalData, current Page) {
    	const dataPerPage = 10;
    	const pageCount = 5;
    	// console.log("currentPage "+ current Page)
    	// console.logi "totalData" totalData);
    	const totalPage = Math.ceil(totalData / dataPerPage);
    	const pageGroup = Math.ceil(current Page / pageCount);
    	// console.log("pageGroup * + pageGroup);
    	// console.log("tota/Page + totalPage):
    	let last = pageGroup + pageCount;
    	if (last > totalPage)
    	last = total Page;
    	let first = last - (pageCount - 1);
    	const next = last + 1;
    	const prev = first - 1;
    	if (totalPage < 1) {
			first = last;
    	}
    	const page = $("#pages");
    	pages.empty();
    	if (first > 5) {
    	pages.append("<li class="pagination-item\">" +
    	"<a onclick=\"GetTarget(" + (prev) + ");\" style='margin-
    	left: 2px'>prev</a></li>");
    	}
    	
    	for (let j = first; j <= last; j++) {
    	if (current Page === (j)) {
    	pages.append( "<li class="pagination-item#">" +
    	"<a class='active' onclick=#"Get Target (+ (j) + ");#"
    	style="margin-left: 2px'>" + (j) + "</a></li>");
    	}

    	} else if (j > 0) {
    	pages.append( "<li class=\"pagination-item\">" +
    	"<a onclick=\"Get Target (" + () + ");\" style='margin-
    	left: 2px'>" + (j) + "</a></li>");
    	}
    	}
    	if (next > 5 && next < totalPage) {
    	pages append( "<li class="pagination-item#">" +
    	"<a onclick=\"Get Target (" + (next) + ");\" style='margin-
    	left: 2px'>next</a></li>");
    	}
    	}
    </script>
</body>
</html>