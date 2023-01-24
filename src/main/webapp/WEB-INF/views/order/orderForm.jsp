<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

.content {
	display: grid;
	grid-template-columns: repeat(4, 1fr);
	column-gap: 30px;
	row-gap: 30px;
}
</style>
<script src="http://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>

<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.9.0/jquery.js"></script>
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
		
		// 옵션 상품 삭제
		$("#deleteOption").click(function() {
			// toLocaleString : 세자리마다 콤마
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
			
			// 결제 금액의 총 주문금액, 배송비, 총 결제금액 표기
			if(totalPrice > 20000 ){
				$("#paymentInfo_totalPrice").html(totalPrice.toLocaleString()  + '원');
				$("#paymentInfo_totalPricePlusDeliv").html(totalPrice.toLocaleString()  + '원');
				$("#paymentInfo_totalPriceMinusPoint").html(totalPrice.toLocaleString()  + '원');
				$("#paymentInfo_totalPriceMinusPoint > input").attr("value", totalPrice);
				$("#paymentInfo_deliveryCharge").html("0원");
				
				$("#deliveryCharge").html("배송비 : 무료");
			}else{
				$("#paymentInfo_totalPrice").html(totalPrice.toLocaleString() + '원');
				$("#paymentInfo_totalPricePlusDeliv").html((totalPrice + 2500).toLocaleString() + '원');
				$("#paymentInfo_totalPriceMinusPoint").html((totalPrice + 2500).toLocaleString() + '원');
				$("#paymentInfo_totalPriceMinusPoint > input").attr("value", totalPrice + 2500);
				$("#paymentInfo_deliveryCharge").html("2,500원");
				
				$("#deliveryCharge").html("배송비 : 2,500원");
			}
			
			$("#totalPirce").html(totalPrice.toLocaleString() + '원');
			$("#totalPoint").html(totalPoint.toLocaleString() + 'pt');
			$("#paymentInfo_totalPoint").html(totalPoint.toLocaleString() + 'pt');
			
		});
		
		// 회원 정보와 동일
		$("#sameDestination").click(function(){
			$("input[name=receiver]").val("${memberDto.name }");
			$("input[name=post_code]").val("${memberDto.post_code }");
			$("input[name=default_addr]").val("${memberDto.default_addr }");
			$("input[name=detail_addr]").val("${memberDto.detail_addr }");
			$("#frontNum").val("${memberDto.phone }".substr(4,4));
			$("#backNum").val("${memberDto.phone }".substr(9,4));
			var idx = "${memberDto.email }".indexOf('@');
			$("#emailId").val("${memberDto.email }".substring(0, idx));
			$("#emailDomain").val(("${memberDto.email }".substring(idx+1)).toLowerCase()).prop("selected", true);
			
			// 휴대폰 번호 합치기
			phone();
		});
		
		// 새로운 배송지 : 초기화
		$("#newDestination").click(function(){
			$("input[name=receiver]").val('');
			$("input[name=post_code]").val('');
			$("input[name=default_addr]").val('');
			$("input[name=detail_addr]").val('');
			$("#frontNum").val('');
			$("#backNum").val('');
			$("#emailId").val('');
			$("#emailDomain").val('');
			$("textarea[name=delivery_message]").val('');
			
		});
		
		/* // 날짜 입력 시 기본=>예약 배송 변경
		$("input[name=delivery_date]").change(function(){
			if($("input[name=delivery_date]").val() != '' || $("input[name=delivery_date]").val() != null){
				$("#deliveryType").html("[예약 배송]");
			}
			if($("input[name=delivery_date]").val() == '' || $("input[name=delivery_date]").val() == null){
				$("#deliveryType").html("[기본 배송]");
			}
		}); */
		
		// 우편번호
		$("#userPostcode").click(function(){
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

	                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var addr = ''; // 주소 변수

	                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    addr = data.roadAddress;
	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    addr = data.jibunAddress;
	                }

	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementsByName('post_code')[0].value = data.zonecode;
	                document.getElementsByName("default_addr")[0].value = addr;
	                // 커서를 상세주소 필드로 이동한다.
	                document.getElementsByName("default_addr")[0].focus();
	            }
	        }).open();
		});
		
		// 휴대폰 번호
		$("#backNum").change(function(){
			phone();	
		});

		function phone() {
			var frontNum = $("#frontNum").val();
			var backNum = $("#backNum").val();
			if(frontNum != "" && backNum != "") {
				$("#phone").val('010-' + frontNum + '-' + backNum);
			}
		};
		
		// 이메일
		$("#emailDomain").change(function(){
			email();	
		});

		function email() {
			var emailId = $("#emailId").val();
			var emailDomain = $("#emailDomain").val();
			if(emailId != "" && emailDomain != "") {
				$("#email").val(emailId + '@' + emailDomain);
			}
		};
		
		// 포인트를 차감한 최종 금액
		$("#myPoint").change(function(){
			var myPoint = parseInt($("#myPoint").next().val());
			var usePoint = parseInt($(this).val());
			
			// dto에 사용 포인트 set
			$("input[name=use_point]").val(usePoint);
			
			var totalPrice = parseInt($("#paymentInfo_totalPricePlusDeliv > input").val());
			var finalAmount = $("#paymentInfo_totalPriceMinusPoint");
			finalAmount.children().remove();
			
			if(usePoint > myPoint){
				alert("사용 가능한 포인트를 초과 입력 하였습니다.\n가용 포인트 : " + myPoint + "pt");
				finalAmount.html((totalPrice - myPoint).toLocaleString() + '원');
				$(this).val(myPoint);
			}else if(usePoint < 1000){
				alert("1000 포인트 이상 사용 가능합니다.");
				finalAmount.html((totalPrice - myPoint).toLocaleString() + '원');
				$(this).val(myPoint);
			}else{
				finalAmount.html((totalPrice - usePoint).toLocaleString() + '원');
			} 
		});
		

		// 주문번호 생성
		function createOrderNum(){
			const date = new Date();
			const year = date.getFullYear();
			const month = String(date.getMonth() + 1).padStart(2, "0");
			const day = String(date.getDate()).padStart(2, "0");
			
			let orderNum = year + month + day;
			for(let i=0; i<5; i++) {
				orderNum += Math.floor(Math.random() * 8);	
			}
			// input 태그에 주문번호 넣기
			$("input[name=order_no]").val(orderNum);
			
			return orderNum;
		};
		
		$("#payment").click(function(){
			const data = {
				orderNum : createOrderNum(),
				name : $("#letterName").html().trim(),
				price : parseInt($("input[name=total_price]").val())
			}
			console.log("주문번호 : " + data.orderNum);
			
			IMP.init("imp71363636");
			
			// KG이니시스
			IMP.request_pay({
			    pg : 'html5_inicis.INIpayTest', 
			    pay_method : 'card',
			    merchant_uid: data.orderNum, // 주문번호
			    name : data.name,
			    amount : data.price,
			    buyer_tel : '010-1234-5678',   //필수 파라미터 입니다.
			    m_redirect_url : '{모바일에서 결제 완료 후 리디렉션 될 URL}',
			    /* escrow : true, //에스크로 결제인 경우 설정
			    bypass : {
			        acceptmethod : "noeasypay" // 간편결제 버튼을 통합결제창에서 제외(PC)
			    }, */
			}, function(rsp) { // callback 로직
				if(rsp.success){
					$('#form').submit();
					
				}
				
			});
		});
	});
</script>
</head>
<body>
	<div class="title">
        <h2>주문서 작성</h2>
    </div>
       <div class="orderList">
           <table border="1">
               <tbody>
               <colgroup>
                   <col width="50"/>		
                   <col width="70"/>		
                   <col width="500"/>		
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
               <tr>
                   <td><input type="checkbox" disabled="disabled"></td>
                   <td>엽서</td>
                   <td><img src="${letterDto.letter_img }"></td>
                   <td>
                       <p id="letterName">
                           ${letterDto.letter_name }
                           <input type="hidden" value="${letterDto.letter_name }" name="letter_name">
                       </p>
                       <p class="blanks">
                           <span>아이 이름 : ${letterDto.child_name }</span><br>
                           <span>거주지 : ${letterDto.address }</span><br>
                           <span>PS 멘트 : ${letterDto.ps }</span>
                       </p>
                   </td>
                   <td>
                		<fmt:formatNumber type="number" value="${letterDto.letter_price }"/>원
                   </td>
                   <td>1</td>
                   <td>
                   	<fmt:parseNumber var="letterPoint" value="${letterDto.letter_price * 0.01 }" integerOnly="true" />
                   	<fmt:formatNumber type="number" value="${letterPoint }"/>pt
				</td>
               </tr>
               <c:set var="totalOptionPrice"/>
               <c:set var="totalOptionPoint"/>
               <c:forEach var="dto" items="${dtoList }" >
               	<c:if test="${ not empty dto.option_img}">
	                <c:set var="totalOptionPrice" value="${totalOptionPrice + dto.option_price}"/>
	                <tr>
	                    <td><input type="checkbox" name="chkBox"></td>
	                    <td>옵션</td>
	                    <td><img src="${dto.option_img }"></td>
	                    <td>
	                        <p class="itemName">
	                            ${dto.option_name }
	                        </p>
	                    </td>
	                    <td>
	                    	<input type='hidden' value="${dto.option_price }"/>
	                    	<fmt:formatNumber type="number" value="${dto.option_price }"/>원
	                    </td>
	                    <td>${dto.option_quantity}</td>
	                    <td>
	                    	<fmt:parseNumber var="point" value="${dto.option_price * 0.01 }" integerOnly="true" />
			                <c:set var="totalOptionPoint" value="${totalOptionPoint + point}"/>
			                <fmt:formatNumber type="number" value="${point }"/>pt
	                    	<input type='hidden' value="${point }"/>
						</td>
	                </tr>
              		</c:if>
               </c:forEach>
               <tr>
               	<td>
               		<button type="button" id="deleteOption">삭제</button>
               	</td>
                   <td colspan="7">
                   	<span id="deliveryType">[기본 배송]</span>
              			<input type='hidden' value="${letterDto.letter_price + totalOptionPrice }"/>
              			<span id="deliveryCharge">
              				<c:choose>
	                			<c:when test="${letterDto.letter_price + totalOptionPrice ge 20000}">
	                				배송비 : 무료
	                			</c:when>
	                			<c:otherwise>
	                				배송비 : 2,500원
	                			</c:otherwise>
              				</c:choose>
              			</span>
                   	[합계] : <span id="totalPirce">
                   		<fmt:formatNumber type="number" value="${letterDto.letter_price + totalOptionPrice }"/>원
                   		<input type='hidden' value="${letterDto.letter_price + totalOptionPrice }"/>
                   	</span>
                   		
                   	<span>[포인트]</span>
                   		적립 예정 : <span id="totalPoint"> 
                   		<fmt:formatNumber type="number" value="${letterPoint + totalOptionPoint }"/>pt
                   		<input type='hidden' value="${letterPoint + totalOptionPoint }"/>
                   	</span>
                   </td>
               </tr>
               </tbody>
           </table>
       </div>
       <div class="title">
           <h3>배송 정보</h3>
       </div>
       <form action="/order/order" method="post" id="form">
           <table border="1">
               <tbody>
                   <tr>
                       <th>배송지 선택</th>
                       <td>
                           <div class="address">
                           	
                               <input type="radio" name="addr" id="sameDestination">
                               <label for ="sameDestination">회원 정보와 동일</label>&nbsp;
                               <input type="radio" name="addr" id="newDestination">
                               <label for ="newDestination">새로운 배송지</label>&nbsp;&nbsp;
                               <span>
                                   최근배송지 :
                                   <span id="latestAddr">
                                    <input type="radio">
                                    <label>우리집</label>&nbsp;
                                    <input type="radio">
                                   <label>친구집</label>
                                   </span>
                               </span>
                           </div>
                           
                       </td>
                   </tr>
                   <tr>
                       <th>받으시는 분</th>
                       <td><input type="text" value="" name="receiver"></td>
                   </tr>
                   <tr>
                       <th>주소</th>
                       <td>
                       	<input name="post_code" type="text">
						<input id="userPostcode" class="button" type="button" value="우편번호"><br><br>
						<input name="default_addr" type="text"> 기본 주소<br><br>
						<input name="detail_addr" type="text"> 나머지 주소
                       </td>
                   </tr>
                   <tr>
                       <th>휴대전화</th>
                       <td>
                       	<input type="text" value="010">&nbsp;-<input type="text" id="frontNum">&nbsp;-<input type="text" id="backNum">&nbsp;
                       	<input type="hidden" id="phone" name="phone">
                      	</td>
                   </tr>
                   <tr>
                       <th>이메일</th>
                       <td>
                           <input id="emailId" type="text" required="required">
						<span>@</span>
						<select id="emailDomain">
								<option value="이메일 선택">이메일 선택</option>
							<option value="naver.com">naver.com</option>
							<option value="daum.net">daum.net</option>
							<option value="gmail.com">gmail.com</option>
							<option value="nate.com">nate.com</option>
							<option value="hanmail.net">hanmail.net</option>
							<option value="outlook.com">outlook.com</option>
							<option value="yahoo.com">yahoo.com</option>
						</select>
						<input type="hidden" id="email" name="email">
                       </td>
                   </tr>
                   <tr>
                           <th>배송메세지</th>
                           <td><textarea name="delivery_message"></textarea></td>
                   </tr>		
                   <!-- <tr>
                       <th>배송일</th>
                       <td>
                           <input type="date" name="delivery_date"><br>
                           <span>* 배송일 선택시 예약배송으로 취급되어 해당 일자에 배송됩니다.</span>
                       </td>
               	</tr> -->
               </tbody>
           </table>
	       <div class="title">
	           <h3>결제 금액</h3>
	       </div>
	       <div class="paymentInfo" style="display:flex">
	           <table border="1">
	               <tbody>
	                   <colgroup>
	                       <col width="300"/>		
	                       <col width="300"/>		
	                       <col width="300"/>
	                   </colgroup>
	                   <tr>
	                       <th>총 주문 금액</th>
	                       <th>배송비</th>
	                       <th>총 결제 금액</th>
	                   </tr>
	                   <tr>
	                       <td id="paymentInfo_totalPrice">
							<fmt:formatNumber type="number" value="${letterDto.letter_price + totalOptionPrice }"/>원
						</td>
	                       <td id="paymentInfo_deliveryCharge">
	                       	<c:choose>
	                			<c:when test="${letterDto.letter_price + totalOptionPrice ge 20000}">
	                				0원
	                			</c:when>
	                			<c:otherwise>
	                				2,500원
	                			</c:otherwise>
	              				</c:choose>
						</td>
	                       	<td id="paymentInfo_totalPricePlusDeliv">
								<c:choose>
		                			<c:when test="${letterDto.letter_price + totalOptionPrice ge 20000}">
										<input type="hidden" name="total_price" value="${letterDto.letter_price + totalOptionPrice }">
										<fmt:formatNumber type="number" value="${letterDto.letter_price + totalOptionPrice }"/>원
		                			</c:when>
		                			<c:otherwise>
										<input type="hidden" name="total_price" value="${letterDto.letter_price + totalOptionPrice + 2500}">
										<fmt:formatNumber type="number" value="${letterDto.letter_price + totalOptionPrice + 2500}"/>원
		                			</c:otherwise>
	              				</c:choose>
							</td>
	                   </tr>
	                   <tr>
	                       <th>포인트</th>
	                       <td colspan="2">
	                           <p>
	                           	<c:choose>
	                            	<c:when test="${myPoint >= 1000}">
	                            		<input type="text" id="myPoint" value="${myPoint}">원 (내 포인트 : <fmt:formatNumber type='number' value='${myPoint}'/>pt)
	                            		<input type="hidden" value="${myPoint}">
	                            	</c:when>
	                            	<c:otherwise>
	                            		<input type="text" disabled="disabled" value="">원 (내 포인트 : ${myPoint }pt)
	                            	</c:otherwise>
	                           	</c:choose>
	                          	</p>
	                           <ul>
	                               <li>포인트는 <b>1,000 포인트 이상</b>부터 결제가 가능합니다.</li>
	                               <li>최대 사용금액은 제한이 없습니다.</li>
	                           </ul>
	                       </td>
	                   </tr>
	               </tbody>
	           </table>
	           <div style="margin-left: 100px;">
	               <p>
                  	<strong>최종결제 금액</strong>
	               	<span id="paymentInfo_totalPriceMinusPoint">
	                   	<c:choose>
	               			<c:when test="${letterDto.letter_price + totalOptionPrice ge 20000}">
	               				<c:choose>
	               					<c:when test="${myPoint ge 1000}">
										<fmt:formatNumber type="number" value="${(letterDto.letter_price + totalOptionPrice) - myPoint }"/>원
									</c:when>
									<c:otherwise>
										<fmt:formatNumber type="number" value="${letterDto.letter_price + totalOptionPrice }"/>원
									</c:otherwise>
								</c:choose>
	               			</c:when>
	               			<c:otherwise>
								<c:choose>
									<c:when test="${myPoint ge 1000}">
										<fmt:formatNumber type="number" value="${letterDto.letter_price + totalOptionPrice + 2500  - myPoint}"/>원
									</c:when>
									<c:otherwise>
										<fmt:formatNumber type="number" value="${letterDto.letter_price + totalOptionPrice + 2500}"/>원
									</c:otherwise>
								</c:choose>
	               			</c:otherwise>
	          				</c:choose>
					</span>
	               </p>
	               <p>
	               	   <strong>총 적립예정금액</strong>
	                   <span id="paymentInfo_totalPoint">
	                   	<fmt:formatNumber type="number" value="${letterPoint + totalOptionPoint }"/>pt
	                  		<input type="hidden" name="save_point" value="${letterPoint + totalOptionPoint }"/>
	                   </span>
	                   <input type="hidden" name="use_point">
	               </p>
	               <p class="agreement">
	                   <input type="checkbox" id="agree" required="required">
	                   <label for="agree">결제정보를 확인하였으며, 구매진행에 동의합니다.</label>
	               </p>
	               <p class="payBtn">
	                   <input type="submit" value="결제하기" id="payment">
	                   <input type="hidden" value="" name="order_no">
	               </p>
	           </div>
	       </div>
       </form>
</body>