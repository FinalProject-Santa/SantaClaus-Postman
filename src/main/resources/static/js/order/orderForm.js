/**
 * 주문 페이지(결제 전)
 */

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
				$("input[name=total_price]").val(totalPrice - myPoint);
				$(this).val(myPoint);
			}else if(usePoint < 1000){
				alert("1000 포인트 이상 사용 가능합니다.");
				finalAmount.html((totalPrice - myPoint).toLocaleString() + '원');
				$("input[name=total_price]").val(totalPrice - myPoint);
				$(this).val(myPoint);
			}else{
				finalAmount.html((totalPrice - usePoint).toLocaleString() + '원');
				$("input[name=total_price]").val(totalPrice - usePoint);
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
			email();
			phone();
			
			
			const data = {
				 	user_email : $("#user_email").val(),
					user_name : $("#user_name").val(),
					orderNum : createOrderNum(),
					name : $("#letterName").html().trim(),
					price : parseInt($("input[name=total_price]").val())
				}
				console.log("주문번호 : " + data.orderNum);
				
				IMP.init("imp71363636");
				
				// KG이니시스
				IMP.request_pay({
				    pg : 'html5_inicis.INIpayTest',
				    buyer_name : data.user_name,
				    buyer_email : data.user_email,
				    merchant_uid: data.orderNum, // 주문번호
				    name : data.name,
				    amount : 100,
				    buyer_tel : '010-1234-5678',   //필수 파라미터 입니다.
				    m_redirect_url : '{모바일에서 결제 완료 후 리디렉션 될 URL}',
				    /* escrow : true, //에스크로 결제인 경우 설정
				    bypass : {
				        acceptmethod : "noeasypay" // 간편결제 버튼을 통합결제창에서 제외(PC)
				    }, */
				}, function(rsp) { // callback 로직
					if(rsp.success){
						console.log(rsp);
						$("input[name=pay_method]").val(rsp.pay_method);
						
						$('#form').submit();

					}
					
				});
		});
		
	   $('input[type="text"]').keydown(function() {
	   		if (event.keyCode === 13) {
	        	event.preventDefault();
	        };
       });
	});