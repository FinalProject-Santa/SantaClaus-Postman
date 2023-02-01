<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<title>Cart</title>
<link rel="shortcut icon" href="/resources/image/kids/favicon.ico">
<link rel="stylesheet" href="/resources/css/mypage/mycart.css">
<script type="text/javascript"
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.9.0/jquery.js"></script>
<script>
	$(function(){
		// 상품 전체 체크 박스
		$("#chkAll").click(function() {
			if($("#chkAll").is(":checked")) $("input[name=chkBox]").prop("checked", true);
			else $("input[name=chkBox]").prop("checked", false);
		});
		
		// 나머지 체크 박스
		$("input[name=chkBox]").click(function() {
			var total = $("input[name=chkBox]").length;
			var checked = $("input[name=chkBox]:checked").length;
			
			if(total != checked){
				$("#chkAll").prop("checked", false);
			}else{
				$("#chkAll").prop("checked", true); 
			}
		});
	
		$("#deleteOption").click(function(){
			// toLocaleString : 세자리마다 콤마
			var itemName = "";
			var totalPrice = 0;
			var totalPoint = 0;
			var price = 0;
			var point = 0;
			var count = $('input[type="checkbox"]').length;
			
			$("input[name='chkBox']:checked").each (function (i){
				if(i==0){
					totalPrice = parseInt($("#totalPirce > input").val());
					totalPoint = parseInt($("#totalPoint > input").val());
					$("#totalPirce").children().remove();
					$("#totalPoint").children().remove();
				}else{
					totalPrice = parseInt($("#totalPirce").html());
					totalPoint = parseInt($("#totalPoint").html());
				}
				price = parseInt($(this).parent("td").next().next().next().next().children("input").val());
				point = parseInt($(this).parent("td").next().next().next().next().next().next().children("input").val());
				totalPrice = totalPrice - price;
				totalPoint = totalPoint - point;
				
				$("#totalPirce").html(totalPrice);
				$("#totalPoint").html(totalPoint);
				
				$(this).parent("td").parent("tr").remove();
				
			});
			
			$("#totalPirce").html(totalPrice.toLocaleString() + '원');
			$("#totalPoint").html(totalPoint.toLocaleString() + 'pt');
			$("#paymentInfo_totalPoint").html(totalPoint.toLocaleString() + 'pt');
			
			
		});
	});
</script>
</head>
<body>
	<!-- header -->
	<%@include file="../include/header.jsp"%>
	<%@include file="../include/floatingMenu.jsp"%>
	<div id="aio">
    	<p class="headCategory" style="text-align: right">
			<a href="/" >Home</a> > 
			<a href="/mypage/main" >My Page</a> >
			 Cart
		</p>
		<div id="wrapper">
			<nav>
				<h1 id="head">장바구니</h1>
			</nav>
			<section>
				<form action="/order/orderForm" method="post">
					<table border="1">
	               <tbody>
	               <colgroup>
	                   <col width="50"/>		
	                   <col width="70"/>		
	                   <col width="350"/>		
	                   <col width="200"/>		
	                   <col width="100"/>	
	                   <col width="100"/>		
	                   <col width="100"/>
	               </colgroup>
	               <tr>
	                   <th><input type="checkbox" id="chkAll"></th>
	                   <th>구분</th>
	                   <th>이미지</th>
	                   <th>상품정보</th>
	                   <th>판매가</th>
	                   <th>수량</th>
	                   <th>포인트</th>
	               </tr>
	                <c:choose>
	                    <c:when test="${empty letterList }">
	                         <tr>
	                             <td colspan="7" align="center">
	                                 장바구니에 담긴 상품이 없습니다.
	                             </td>
	                         </tr>
	                    </c:when>
	                    <c:otherwise>
	               <c:set var="totalLetterPrice"/>
	               <c:forEach var="letterDto" items="${letterList }" >
	               <c:set var="totalLetterPrice" value="${totalLetterPrice + letterDto.letter_price}"/>
		               <tr>
		                   <td><input type="checkbox" name="chkBox"></td>
		                   <td>엽서</td>
		                   <td><img id="letter_img" src="${letterDto.letter_img }"></td>
		                   <td>
		                       <p id="letterName">
		                           ${letterDto.letter_name }
		                       </p>
		                       <input type="hidden" value="${letterDto.letter_name }" name="letter_name">
		                   </td>
		                   <td>
	                   			<input type='hidden' value="${letterDto.letter_price }"/>
		                		<fmt:formatNumber type="number" value="${letterDto.letter_price }"/>원
		                   </td>
		                   <td>1</td>
		                   <td>
		                   		<fmt:parseNumber var="point" value="${letterDto.letter_price * 0.01 }" integerOnly="true" />
		                		<fmt:formatNumber type="number" value="${point}"/>pt
				                <c:set var="letterPoint" value="${point}"/>
				                <input type='hidden' value="${point }"/>
						   </td>
		               </tr>
	               </c:forEach>
	               <c:set var="totalOptionPrice"/>
	               <c:set var="totalOptionPoint"/>
	               <c:forEach var="dto" items="${optionList }" >
	                <c:set var="totalOptionPrice" value="${totalOptionPrice + dto.option_price * dto.option_quantity}"/>
	                <tr>
	                    <td><input type="checkbox" name="chkBox"></td>
	                    <td>옵션</td>
	                    <td><img id="option_img" src="${dto.option_img }"></td>
	                    <td>
	                        <p class="itemName">
	                            ${dto.option_name }
	                        </p>
	                    </td>
	                    <td>
	                    	<input type='hidden' value="${dto.option_price * dto.option_quantity }"/>
	                    	<fmt:formatNumber type="number" value="${dto.option_price * dto.option_quantity }"/>원
	                    </td>
	                    <td>${dto.option_quantity}</td>
	                    <td>
	                    	<fmt:parseNumber var="point" value="${dto.option_price * dto.option_quantity * 0.01 }" integerOnly="true" />
			                <c:set var="totalOptionPoint" value="${totalOptionPoint + point}"/>
			                <fmt:formatNumber type="number" value="${point }"/>pt
	                    	<input type='hidden' value="${point }"/>
						</td>
	                </tr>
	               </c:forEach>
	               <tr>
	               	<td>
	               		<button type="button" id="deleteOption">삭제</button>
	               	</td>
	                   <td colspan="7">
	                   	<span id="deliveryType">[기본 배송]</span>
	              			<input type='hidden' value="${totalLetterPrice + totalOptionPrice }"/>
	              			<span id="deliveryCharge">
	              				<c:choose>
		                			<c:when test="${totalLetterPrice + totalOptionPrice ge 20000}">
		                				배송비 : 무료
		                			</c:when>
		                			<c:otherwise>
		                				배송비 : 2,500원
		                			</c:otherwise>
	              				</c:choose>
	              			</span>
	                   	[상품 금액 합계] : <span id="totalPirce">
	                   		<fmt:formatNumber type="number" value="${totalLetterPrice + totalOptionPrice }"/>원
	                   		<input type='hidden' value="${totalLetterPrice + totalOptionPrice }"/>
	                   	</span>
	                   		
	                   	<span>[포인트]</span>
	                   		적립 예정 : <span id="totalPoint"> 
	                   		<fmt:formatNumber type="number" value="${(totalLetterPrice + totalOptionPrice) * 0.01}"/>pt
	                   		<input type='hidden' value="${(totalLetterPrice + totalOptionPrice) * 0.01 }"/>
	                   	</span>
	                   </td>
	               </tr>
	               </c:otherwise>
	               </c:choose>
	               </tbody>
	           </table>
				<div class="end">
					<input type="submit" class="payment" value="결제하기"> 
					<input type="button" class="continue" value="엽서 목록" onclick="location.href='/letter/letterList'">
				</div>
				</form>
			</section>
		</div>
	</div>
	<!-- footer -->
	<%@include file="../include/footer.jsp"%>

</body>
