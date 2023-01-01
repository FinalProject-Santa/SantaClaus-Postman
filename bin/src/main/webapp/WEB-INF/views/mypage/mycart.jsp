<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>장바구니</title>
    <link rel="stylesheet" href="/resources/css/mypage/mycart.css">
</head>
<body>
    <div id="wrapper">
        <nav>
            <h1>장바구니</h1>
            <p>일반상품(${cart.product_quantity})</p>
        </nav>
        <section>
            <form action="payment.do?userid=${dto.userid}" method="post">
                <table>
                    <colgroup>
                        <col width="30">
                        <col width="150">
                        <col width="280">
                        <col width="100">
                        <col width="100">
                        <col width="100">
                        <col width="100">
                        <col width="100">
                    </colgroup>
                    <tr>
                        <th><input type="checkbox"></th>
                        <th>이미지</th>
                        <th>상품정보</th>
                        <th>판매가</th>
                        <th>포인트</th>
                        <th>배송일자</th>
                        <th>배송비</th>
                        <th>합계</th>
                    </tr>
                    <c:choose>
                        <c:when test="${empty list}">
                            <tr>
                                <td colspan="8" align="center">----- 장바구니에 담아둔 상품이 없습니다 -----</td>
                            </tr>
                        </c:when>
                        <c:otherwise>
                            <c:forEach items="${list}" var="dto">
                                <tr>
                                    <td><input type="checkbox"></td>
                                    <td>${template_image}</td>
                                    <td>${template_name}<hr>${option_name}</td>
                                    <td>${template_price}<hr>+<hr>${option_price}</td>
                                    <td>{판매가10%}p</td>
                                    <td>{delivery_date}</td>
                                    <td>{판매가2만원이상 무료}</td>
                                    <td>{판매가-배송비}</td>
                                </tr>
                            </c:forEach>
                        </c:otherwise>
                    </c:choose>
                </table>
                <input type="button" class="btn" value="삭제">
                <!-- <p class="summary">총 상품가격 <b></b>원 + 총 배송비 <b></b>원 = 총 주문금액 <b style="color: red;">?원</b></p>  -->
                <div class="end">
                    <input type="submit" class="payment" value="결제하기">
                    <input type="button" class="continue" value="쇼핑 계속하기" onclick="location.href='template'">
                </div>
            </form> 
        </section>
    </div>
</body>
</html>