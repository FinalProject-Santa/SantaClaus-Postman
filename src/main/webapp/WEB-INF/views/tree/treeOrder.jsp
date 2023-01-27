<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Document</title>
<style>
</style>
</head>
<body>
	<div class="title">
		<h2>주문 정보 확인</h2>
	</div>
	<div style="display: flex;">
		<span><img alt="" src="${myimg}"></span>
		<p>
			고객님의 주문이 완료 되었습니다.<br> 주문번호 : ${orderDto.order_no }
		</p>
	</div>
	<strong>결제 정보</strong>
	<table border="1">
		<colgroup>
			<col style="width: 160px;">
			<col style="width: auto">
		</colgroup>
		<tbody>
			<tr>
				<th>최종결제금액</th>
				<td><strong> <fmt:formatNumber type="number"
							value="${orderDto.total_price }" />원
				</strong></td>
			</tr>
			<tr>
				<th>결제 수단</th>
				<td><strong>무통장 입금</strong><br> <span>입금자 : 박지영,
						계좌번호 : 우리 1002-777-777777 ((주)산타국우체부)</span></td>
			</tr>
		</tbody>
	</table>
	<strong>주문 상품 정보</strong>
	<table border="1">
		<colgroup>
			<col style="width: 50px;">
			<col style="width: 300px">
			<col style="width: 100px;">
			<col style="width: 100px;">
			<col style="width: 100px;">
		</colgroup>
		<tbody>
			<tr>
				<th>구분</th>
				<th>이미지</th>
				<th>상품정보</th>
				<th>수량</th>
				<th>판매가</th>
			</tr>
			<tr>
				<td>트리</td>
				<td><img src="/resources/image/treeimg/트리1.png"></td>
				<td>크리스마스 트리</td>
				<td>1</td>
				<td><fmt:formatNumber type="number"
						value="150000" />원</td>
			</tr>
			<c:set var="totalOptionPrice" />
			<c:forEach var="dto" items="${dtolist}">
				<c:set var="totalOptionPrice"
					value="${totalOptionPrice + dto.or_price}" />
				<tr>
					<td>옵션</td>
					<td><img src="/resources/image/treeimg/${dto.or_name }.png"></td>
					<td>${dto.or_name }</td>
					<td>1</td>
					<td><fmt:formatNumber type="number" value="${dto.or_price }" />원
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<strong>배송지 정보</strong>
	<table border="1">
		<colgroup>
			<col style="width: 160px;">
			<col style="width: auto">
		</colgroup>
		<tbody>
			<tr>
				<th>받으시는 분</th>
				<td>${orderDto.receiver }</td>
			</tr>
			<tr>
				<th>주소</th>
				<td>[우편번호] : ${orderDto.post_code }<br>
					${orderDto.default_addr }<br> ${orderDto.detail_addr }<br>
				</td>
			</tr>
			<tr>
				<th>휴대전화</th>
				<td>${orderDto.phone }</td>
			</tr>
			<tr>
				<th>배송메세지</th>
				<td>${orderDto.delivery_message }</td>
			</tr>
		</tbody>
	</table>
	<div class="homeBtn">
		<input type="button" value="홈으로">
	</div>

</body>
</html>