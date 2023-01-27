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
	<!-- header -->
	<%@include file="../include/header.jsp" %>
	<%@include file="../include/floatingMenu.jsp" %>
	
    <div id="wrapper">
        <nav>
            <h1>장바구니</h1>
            <p>일반상품(수량)</p>
        </nav>
        <section>
            <form action="/order" method="post">
                <table>
                    <colgroup>
                        <col width="30">
                        <col width="50">
                        <col width="500">
                        <col width="300">
                        <col width="100">
                        <col width="100">
                        <col width="100">
                    </colgroup>
                    <tr>
                        <th><input type="checkbox"></th>
                        <th>구분</th>
                        <th>이미지</th>
                        <th>상품정보</th>
                        <th>판매가</th>
                        <th>수량</th>
                        <th>적립 포인트</th>
                        <!-- 총 적립 포인트<th>배송비</th>
                        <th>합계</th> -->
                    </tr>
                    <c:choose>
                        <c:when test="${empty cartDto}">
                            <tr>
                                <td colspan="7" align="center">----- 장바구니에 담아둔 상품이 없습니다 -----</td>
                            </tr>
                        </c:when>
                        <c:otherwise>
                            <c:forEach items="${letterDto}" var="letterDto">
                            <tr>
	                            <td><input type="checkbox"></td>
	                            <td>엽서</td>
	                            <td>${letterDto.letter_img}</td>
	                            <td>
	                            	<p>엽서 이름<br>${letterDto.letter_name}</p>
	                            	<p>
	                            		<span>아이 이름: ${letterDto.child_name }</span><br>
	                            		<span>거주지 : ${letterDto.address }</span><br>
                      				    <span>PS 멘트 : ${letterDto.ps }</span>
	                            	</p>
	                            </td>
	                            <td><fmt:formatNumber type="number" value="${letterDto.letter_price }"/>원</td>
	                            <td>1</td>
	                            <td>
									<fmt:parseNumber var="letterPoint" value="${letterDto.letter_price * 0.01 }" integerOnly="true" />
                   					<fmt:formatNumber type="number" value="${letterPoint }"/>pt
								</td>
                            </tr>
	                            <c:forEach items="${optiondtoList}" var="optiondtoList">
	                                <tr>
	                                    <td><input type="checkbox"></td>
	                                    <td>옵션</td>
	                                    <td>${optiondtoList.option_img}</td>
	                                    <td>${optiondtoList.option_name}</td>
	                                    <td>${optiondtoList.option_price}</td>
	                                    <td>${optiondtoList.option_quantity}</td>
	                                    <td>
	                                    	<fmt:parseNumber var="point" value="${dto.option_price * 0.01 }" integerOnly="true" />
							                <c:set var="totalOptionPoint" value="${totalOptionPoint + point}"/>
							                <fmt:formatNumber type="number" value="${point }"/>pt
					                    	<input type='hidden' value="${point }"/>
	                                    </td>
                                    </tr>
	                            </c:forEach>
									<tr>	                                    
	                                    <td>
	                                    	배송비: 
											<c:choose>
					                			<c:when test="${letterDto.letter_price + dtoList.option_price ge 20000}">
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
                    <input type="button" class="continue" value="쇼핑 계속하기" onclick="location.href='/letter/letterList'">
                </div>
            </form> 
        </section>
    </div>
    
	<!-- footer -->
	<%@include file="../include/footer.jsp" %>
	
</body>
</html>