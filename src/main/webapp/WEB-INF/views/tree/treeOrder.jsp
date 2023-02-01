<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<title>Tree Order</title>
<link rel="shortcut icon" href="/resources/image/kids/favicon.ico">
<link rel="stylesheet" href="/resources/css/nytree/treeorder.css">
<body>
<%@include file="../include/header.jsp" %>
<%@include file="../include/floatingMenu.jsp"%>

<div class="inner">
<p class="headCategory" style="text-align: right; padding-right:205px;">
			<a href="/">Home</a> > Tree Decorating > Tree Order Form > Tree Order
		</p>
	<div class="flexCon">
		<div class="title">
			<h2>주문 정보 확인</h2>
		</div>
		<div class="orderNum">
			<img alt="" src="${myimg}" id="treeImg">
              <div class="orderDiv">
               <span id="orderMent">고객님의 주문이 완료 되었습니다.</span><br><br>
               <span style="font-family:sans-serif;">주문번호 : <b>${orderDto.order_no }</b></span>
            </div>
          </div>
		<br>
		<br>
		<h3>결제 정보</h3>
		<br>
		<table border="1">
			<colgroup>
				<col style="width: 120px;">
				<col style="width: 830PX;">
			</colgroup>
		        <tbody>
	            <tr>
	                <th bgcolor="#FAFAFA">결제 수단</th>
	                <td style="padding-left:20px;">
		                <c:if test="${orderDto.pay_method eq 'point'}" >
		                    <strong>카카오 페이</strong><br>
		                </c:if>
		                <c:if test="${orderDto.pay_method eq 'card'}" >
		                    <strong>네이버 페이</strong><br>
		                </c:if>
	                </td>
	            </tr>
	            <tr>
	                <th bgcolor="#FAFAFA">최종결제금액</th>
	                <td style="padding-left:20px;">
	                	<span id="priceRed">
	                		<fmt:formatNumber type="number" value="${orderDto.total_price }"/>원
	                	</span>
	                </td>
	            </tr>
	        </tbody>
	    </table>
	    <br>
	    <br>
		<h3>주문 상품 정보</h3>
		<br>
		<table border="1" class="infoTable">
			<colgroup>
				<col style="width: 50px;">
				<col style="width: 300px">
				<col style="width: 200px;">
				<col style="width: 200px;">
				<col style="width: 200px;">
			</colgroup>
			<tbody>
				<tr>
					<th bgcolor="#FAFAFA">구분</th>
					<th bgcolor="#FAFAFA">이미지</th>
					<th bgcolor="#FAFAFA">상품정보</th>
					<th bgcolor="#FAFAFA">수량</th>
					<th bgcolor="#FAFAFA">판매가</th>
				</tr>
				<tr>
					<td>트리</td>
					<td><img src="/resources/image/treeimg/트리1.png"></td>
					<td>크리스마스 트리</td>
					<td>1</td>
					<td style="font-weight: bold;"><fmt:formatNumber type="number"
							value="150000" />원</td>
				</tr>
				<c:set var="totalOptionPrice" />
				<c:forEach var="dto" items="${dtolist}">
					<c:set var="totalOptionPrice"
						value="${totalOptionPrice + dto.or_price}" />
					<tr>
						<td >옵션</td>
						<td ><img src="/resources/image/treeimg/${dto.or_name }.png"></td>
						<td >${dto.or_name }</td>
						<td >1</td>
						<td style="font-weight: bold;"><fmt:formatNumber type="number" value="${dto.or_price }" />원
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<br>
		<br>
		<h3>배송지 정보</h3>
		<br>
		<table border="1">
			<colgroup>
				<col style="width: 160px;">
				<col style="width: 790px;">
			</colgroup>
			<tbody>
				<tr>
					<th bgcolor="#FAFAFA">받으시는 분</th>
					<td style="padding-left:20px;">${orderDto.receiver }</td>
				</tr>
				<tr>
					<th bgcolor="#FAFAFA">주소</th>
					<td style="padding-left:20px;">[우편번호] : ${orderDto.post_code }<br>
						${orderDto.default_addr }<br> ${orderDto.detail_addr }<br>
					</td>
				</tr>
				<tr>
					<th bgcolor="#FAFAFA">휴대전화</th>
					<td style="padding-left:20px;">${orderDto.phone }</td>
				</tr>
				<tr>
					<th bgcolor="#FAFAFA">배송메세지</th>
					<td style="padding-left:20px;">${orderDto.delivery_message }</td>
				</tr>
			</tbody>
		</table>
		<br>
		<br>
		<div class="homeBtn">
			<input type="button" value="홈으로" class="btn" onclick="location.href='/'">
		</div>
	</div>
</div>
<%@include file="../include/footer.jsp" %>
</body>
</html>