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
<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.9.0/jquery.js"></script>
<script>
	$(function(){
		
		// 전체 체크 박스
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
			$( "input[name='chkBox']:checked" ).each (function (){
				$(this).parent("td").parent("tr").remove();
			});
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
			$("input[name=delivery_date]").val('');
			
		});
		
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
		
	})
</script>
</head>
<body>
	<div class="title">
        <h2>주문서 작성</h2>
    </div>
    <form class="payment" method="post">
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
                    <td><input type="checkbox" name="chkBox"></td>
                    <td>엽서</td>
                    <td><img src="${letterDto.letter_img }"></td>
                    <td>
                        <p class="itemName">
                            ${letterDto.letter_name }
                        </p>
                        <p class="blanks">
                            <span>아이 이름 : ${letterDto.child_name }</span><br>
                            <span>거주지 : ${letterDto.address }</span><br>
                            <span>PS 멘트 : ${letterDto.ps }</span>
                        </p>
                    </td>
                    <td>
                 		<fmt:formatNumber type="number" value="${letterDto.letter_price }"/>
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
		                    	<fmt:formatNumber type="number" value="${dto.option_price }"/>
		                    </td>
		                    <td>1</td>
		                    <td>
		                    	<fmt:parseNumber var="point" value="${dto.option_price * 0.01 }" integerOnly="true" />
				                <c:set var="totalOptionPoint" value="${totalOptionPoint + point}"/>
				                <fmt:formatNumber type="number" value="${point }"/>pt
							</td>
		                </tr>
               		</c:if>
                </c:forEach>
                <tr>
                	<td>
                		<button type="button" id="deleteOption">삭제</button>
                	</td>
                    <td colspan="7">
                    	<span id="delivery">[기본 배송]</span>
                    	<span id="totalPirce">합계 :
                    		<fmt:formatNumber type="number" value="${letterDto.letter_price + totalOptionPrice }"/></span>
                    	<span>[포인트]</span>
                    	<span id="totalPoint">적립 예정 : 
                    		<fmt:formatNumber type="number" value="${letterPoint + totalOptionPoint }"/>pt</span>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
        <div class="title">
            <h3>배송 정보</h3>
        </div>
        <div class="shippingInfo">
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
                        <td><input type="text" name="receiver"></td>
                    </tr>
                    <tr>
                        <th>주소</th>
                        <td>
                            <input name="post_code" type="text">
							<input id="userPostcode" class="button" type="button" value="우편번호"><br><br>
							<input name="default_addr" type="text"> 기본 주소<br><br>
							<input name="detail_addr" type="text" required="required"> 나머지 주소
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
                    <tr>
                        <th>배송일</th>
                        <td>
                            <input type="date" name="delivery_date"><br>
                            <span>* 배송일 선택시 예약배송으로 취급되어 해당 일자에 배송됩니다.</span>
                        </td>
                </tr>
                </tbody>
            </table>
        </div>
        <div class="title">
            <h3>결제 금액</h3>
        </div>
        <div class="paymentInfo">
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
                        <td>30,000원</td>
                        <td>0원</td>
                        <td>30,000원</td>
                    </tr>
                    <tr>
                        <th>포인트</th>
                        <td colspan="2">
                            <p><input type="text">원(사용가능 포인트 : ${myPoint }pt</span>)</p>
                            <ul>
                                <li>포인트는 1포인트 이상일 때 결제가 가능합니다.</li>
                                <li>최대 사용금액은 제한이 없습니다.</li>
                            </ul>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="title">
            <h3>결제 수단</h3>
        </div>
        <div class="paymentArea" style="display: flex;">     
            <div class="paymentMethod">
                <span>
                    <input type="radio">
                    <label>카드결제</label>
                </span>
                <span>
                    <input type="radio">
                    <label>실시간 계좌이체</label>
                </span>
                <span>
                    <input type="radio">
                    <label>휴대폰 결제</label>
                </span>
                <span>
                    <input type="radio">
                    <label>무통장 입금</label>
                </span>
            </div>
            <div class="paymentArea" style="margin-left: 100px;">
                <h4>
                    <strong id="paymentName">무통장 입금</strong>
                    <span>최종결제 금액</span>
                </h4>
                <p class="price">
                    <span>30,000원</span>
                </p>
                <p class="agreement">
                    <input type="checkbox">
                    <label>결제정보를 확인하였으며, 구매진행에 동의합니다.</label>
                </p>
                <p class="payBtn">
                    <input type="button" value="결제하기">
                </p>
                <p class="point">
                    <strong>총 적립예정금액</strong>
                    <span>370원</span>
                </p>
            </div>
        </div>
    </form>
</body>
</html>