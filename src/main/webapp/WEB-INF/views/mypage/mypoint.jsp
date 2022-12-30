<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
            <p class="box1">총 포인트 $(.point)</p>
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
                                    <td>$(dto.point_purpose)</td>
                                    <td>$(dto.point_date)</td>
                                    <td>$(dto.point_save}or$(dto.point_use)</td>
                                    <td>$(dto.orderno)</td>
                                    <td>$(dto.point_content)</td>
                                </tr>
                            </c:forEach>
                        </c:otherwise>
                    </c:choose>
                </table>
                <ul id="pagingul"></ul>
            </div>
        </section>
    </div>
</body>
</html>