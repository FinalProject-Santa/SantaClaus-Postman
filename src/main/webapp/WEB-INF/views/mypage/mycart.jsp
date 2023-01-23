<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
            <form action="orderForm?user_id='qwerqwer'" method="post">
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
                        <th>적립 예정 포인트</th>
                        <th>배송비</th>
                        <th>합계</th>
                    </tr>
                    <c:choose>
                        <c:when test="${empty cartDto}">
                            <tr>
                                <td colspan="8" align="center">----- 장바구니에 담아둔 상품이 없습니다 -----</td>
                            </tr>
                        </c:when>
                        <c:otherwise>
                            <c:forEach items="${cartDto}" var="dto">
                                <tr>
                                    <td><input type="checkbox"></td>
                                    <td>${letterDto.letter_img}<hr>${optionDto.option_img}</td>
                                    <td>${letterDto.letter_name}<hr>${optionDto.option_name}</td>
                                    <td>${letterDto.letter_price}<hr>+<hr>${optionDto.option_price}</td>
                                    <td><fmt:formatNumber type="number" value="${(letterDto.letter_price + optionDto.option_price) * 0.1 }" />p</td>
                                    <td>
										<c:choose>
				                			<c:when test="${letterDto.letter_price + optionDto.option_price ge 20000}">
				                				무료
				                			</c:when>
				                			<c:otherwise>
				                				2,500원
				                			</c:otherwise>
			               				</c:choose>
									</td>
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
                    <input type="button" class="continue" value="쇼핑 계속하기" onclick="location.href='/letterList'">
                </div>
            </form> 
        </section>
    </div>
</body>
</html>