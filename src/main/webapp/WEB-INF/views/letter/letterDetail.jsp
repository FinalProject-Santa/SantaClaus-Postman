<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<title>Letter Detail</title>
<link rel="shortcut icon" href="/resources/image/kids/favicon.ico">
<link rel="stylesheet" href="/resources/css/letter/letterDetail.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script src="/resources/js/letter/letterDetail.js"></script>
<body>

	<!-- header, 고객센터 -->
	<%@include file="../include/header.jsp" %>
	<%@include file="../include/floatingMenu.jsp" %>
	
	<div class="inner">
		<p class="headCategory" style="text-align: right">
			<a href="/">Home</a> > <a href="/letter/letterList">Letter List</a> > Letter Detail
		</p>
		<form method='post'>
			<div class="letterInfoWrap">
				<div class="letterImgBox">
					<div class="letterImg">
						<img src="${letterImg }">
						<input type="hidden" name="letter_img" value="${letterImg }">
					</div>
					<div class="contentImg">
						<img src="/resources/image/letter/3.png">
					</div>
				</div>
				<div class="letterDetailWrap">
					<div class="letterInfo">
						<p style="font-weight: 16pt; font-weight: bold;">${letterName }</p>
						<p style="color:gray">
							<fmt:formatNumber type="number" value="${letterPrice }"/>원
						</p>
						<input type="hidden" name="letter_name" value="${letterName}">
						<!-- <hr class="hr1"> -->
						<input type="hidden" name="letter_price" value="${letterPrice}">
						<div class="letterContent">
							<table>
								<tr>
									<th>아이 이름</th>
									<td><input type="text" name="child_name" placeholder="아이 이름" style="width: 100%" required="required"></td>
								</tr>
								<tr>
									<th>거주지</th>
									<td><input type="text" name="address" placeholder="전달받을 거주지" style="width: 100%" required="required"></td>
								</tr>
								<tr>
									<th>P.S</th>
									<td>
										<textarea name="ps" placeholder="아이에게 들려주고 싶은&#13;&#10;말을 적어주세요" style="width: 100%; height: 150px;" required="required"></textarea>
									</td>
								</tr>
							</table>
						</div>
					</div>
					<p>🎁Option List🎁</p>
					<div class="payment">
						<div class="shopList">
							<span></span>
						</div>
						<div class="payBtn">
							<input type="submit" class="cartBtn" formaction="/cart/cartpage" id="shopCart" value="장바구니">
							<input type="submit" class="orderBtn" formaction="/order/orderForm" id="buy" value="구매하기">
						</div>
					</div>
					<p style="text-align: right; padding-right:26px; color:gray; font-size:10pt;" >
						* 배송비 : 20,000원 이상 무료 *
					</p>
				</div>
			</div>
		</form>
		<br><br><br>
		<hr class="hr2">
		<div class="optionArea">
			<c:forEach var="list" items="${optionList }">
				<div class="optionItem">
					<img src="${list.option_img }">
					<p id="name">${list.option_name }</p>
					<p id="price">
						<span><fmt:formatNumber type="number" value="${list.option_price }"/>원</span>
                   		<input type='hidden' value="${list.option_price }"/>
               		</p>
				</div>
			</c:forEach>
		</div>
	</div>
	
	<!-- footer -->
	<%@include file="../include/footer.jsp" %>
</body>
</html>