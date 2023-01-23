<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/resources/css/main/signUp.css" rel="stylesheet">
<script src="http://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script>
$(function() {
    var $id = $("#id");
    var $pw = $("#pw");
    var $pwChk = $("#pwConfirm");

	$("#idDupChk").on("click", function(){
		/* 영문자로 시작하는 영문자 또는 숫자 6~20자  */
        var regExp = /^[a-z]+[a-z0-9]{5,19}$/g;

        if(!regExp.test($id.val())){
            var idchk = false;
            $("#idChk").html("사용할 수 없는 아이디입니다.");
            $("#idChk").css({
                "color" : "red",
                "font-weight" : "bold",
                "font-size" : "15px"
            })
        } else{
            $.ajax({
                url : "idChk",
                type:"POST",
                data : {
                        "type" : "user",
                        "user_id" : $id.val()
                },
                success : function(data){
                    if(data == 1){
                        $("#idChk").html("이미 존재하는 아이디입니다.");
                        $("#idChk").css({
                            "color" : "red",
                            "font-weight" : "bold",
                            "font-size" : "15px"
                        })
                    }else{
                        idchk=true;
                        $("#idChk").html("사용 가능한 아이디입니다.");

                        $("#idChk").css({
                            "color" : "blue",
                            "font-weight" : "bold",
                            "font-size" : "15px"
                        })
                    }
                },
                error : function(){
					alert("통신 오류");
				}
                
            })
        }
    
	});

	$pw.on("keyup", function(){
		/* 영문, 숫자, 특수문자 중 2가지 이상 조합하여 7자리 이내의 암호 정규식 ( 2 가지 조합) */
		var regExp = /^(?!((?:[A-Za-z]+)|(?:[~!@#$%^&*()_+=]+)|(?:[0-9]+))$)[A-Za-z\d~!@#$%^&*()_+=]{7,}$/;
	      if(!regExp.test($pw.val())){
	    	  $("#pwConfirm").attr("disabled", true);
	          $("#pwChk").html("비밀번호는 영문, 숫자, 특수문자를 포함해 주세요.");
	          $("#pwChk").css({
	              "color" : "red",
	              "font-weight" : "bold",
	              "font-size" : "15px"
	          })
	      }else{
	    	  $("#pwChk").html("사용 가능한 비밀번호입니다.");
	    	  $("#pwChk").css({
	              "color" : "blue",
	              "font-weight" : "bold",
	              "font-size" : "15px"
	          })
	    	  $("#pwConfirm").attr("disabled", false);
	    	  $("#pwConfirm").attr("placeholder", "비밀번호를 다시 입력해주세요");
	      }
	});
    
    $pwChk.on("keyup", function(){
		var password = document.getElementById('pw');
		var passwordConfirm = document.getElementById('pwConfirm');

		if(password.value == passwordConfirm.value){
            $("#pwConfirmChk").html("비밀번호가 일치합니다.");
            $("#pwConfirmChk").css({
                "color" : "blue",
                "font-weight" : "bold",
                "font-size" : "15px"
            })
        }else{
            $("#pwConfirmChk").html("비밀번호가 일치하지 않습니다.");
            $("#pwConfirmChk").css({
                "color" : "red",
                "font-weight" : "bold",
                "font-size" : "15px"
            })
        }
		
		
   	});
    
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
    
    $('#phoneAuth').click(function() {
    	$("#sendSucess").text("인증번호를 확인 해주세요.");
		const to = $('#user_phone').val();

		$.ajax({
			url : '/main/phoneAuth',
			type : 'GET',
			data : {
				"to" : to
			},
			success : function(data) {
				const checkNum = data;

				$('#phoneck').click(function() {
					const phoneckcode = $('#phoneckcode').val();

					if (checkNum === phoneckcode) {
						$("#authSuccess").text("인증이 완료되었습니다.");
					} else {
						$("#authSuccess").text("인증 실패하였습니다. 재인증 해주세요.");
					}
				});

			}
		});

	});
    
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
    
});
</script>
</head>
<body>
	<div id="wrap" class="wrapper">
		<h1>회 원 가 입</h1>
		<div class="writeform">
			<form action="/main/signUp" method="post" enctype="multipart/form-data">
				<div>
					<div class="mb-3">
						<label for="inputGroupFile02">사진 등록</label>
						<div class="input-group mb-3">
						    <input type="file" class="form-control" id="inputGroupFile02" name="files">
						    <label class="input-group-text" for="inputGroupFile02">Upload</label>
						</div> 
					</div>
					<label for="id">아이디</label>
					<div class="info">
						<input id="id" name="user_id" type="text" placeholder="아이디를 입력해주세요." required="required">
						<input id="idDupChk" type="button" class="button" value="중복확인">
						<p id="idChk" class="error"></p>
					</div>
				</div>
				<div>
					<label for="pw">비밀번호</label>
					<div class="info">
						<input id="pw" name="password" type="password" placeholder="비밀번호를 입력해주세요." required="required">
						<p id="pwChk" class="error"></p>
					</div>
				</div>
				<div>
					<label for="pwConfirm">비밀번호 확인</label>
					<div class="info">
						<input id="pwConfirm" type="password" required="required" disabled="disabled">
						<p id="pwConfirmChk" class="error"></p>
					</div>
				</div>
				<div>
					<label for="name">이름</label>
					<div class="info">
						<input name="name" type="text" required="required">
					</div>
				</div>
				<div>
                    <label for="addr">주소</label>
					<div class="info">
                        <input name="post_code" type="text">
						<input id="userPostcode" class="button" type="button" value="우편번호"><br><br>
						<input name="default_addr" type="text"> 기본 주소<br><br>
						<input name="detail_addr" type="text" required="required"> 나머지 주소
					</div>
				</div>
				<div>
					<label for="phone">휴대폰 번호</label>
					<div class="info">
						<input id="user_phone" name="phone" type="text" placeholder="'-'없이 숫자만 입력해주세요" required="required">
						<input id="phoneAuth" class="button" type="button" value="인증번호 전송">
						<span id="sendSucess"></span>
					</div>
				</div>
				<div>
					<label for="phoneckcode">인증코드 입력</label>
					<div>
						<input id="phoneckcode" type="text" ><!-- required="required" -->
						<input id="phoneck" class="button" type="button" value="인증하기">
						<span id="authSuccess"></span>
					</div>
				</div>
				<div>
					<label for="email">이메일</label>
					<div class="info">
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
						<input type="hidden" id="email" name="email" value="">
					</div>
				</div>
				<div class="personalInfo">
					<span>
						<input style="width: 20px;" type="checkbox" required="required">
						<label>개인정보 수집 및 이용 동의</label>
						<span>(필수)</span>
					</span>
					<div class="policy">
						<p>
							개인정보보호법에 따라 산타국 우체부에 회원가입 신청하시는 분께 수집하는 개인정보의 항목, 개인정보의 수집 및 이용목적, 개인정보의 보유 및 이용기간, 동의 거부권 및 동의 거부 시 불이익에 관한 사항을 안내 드리오니 자세히 읽은 후 동의하여 주시기 바랍니다.<br>
							1. 수집하는 개인정보<br>
							산타국 우체부는 서비스 이용을 위해 필요한 최소한의 개인정보를 수집합니다.<br><br>
							
							회원가입 시점에 산타국 우체부가 이용자로부터 수집하는 개인정보는 아래와 같습니다.<br>
							- 회원 가입 시 필수항목으로 아이디, 비밀번호, 이름, 주소, 이메일, 휴대전화번호를 수집합니다.<br>
							서비스 이용 과정에서 이용자로부터 수집하는 개인정보는 아래와 같습니다.<br>
							- 회원정보 또는 개별 서비스에서 프로필 정보(별명, 프로필 사진)를 설정할 수 있습니다.<br><br>
							
							- 산타국 우체부 내의 개별 서비스 이용, 이벤트 응모 및 경품 신청 과정에서 해당 서비스의 이용자에 한해 추가 개인정보 수집이 발생할 수 있습니다. 추가로 개인정보를 수집할 경우에는 해당 개인정보 수집 시점에서 이용자에게 ‘수집하는 개인정보 항목, 개인정보의 수집 및 이용목적, 개인정보의 보관기간’에 대해 안내 드리고 동의를 받습니다.<br><br>
							
							서비스 이용 과정에서 IP 주소, 쿠키, 서비스 이용 기록, 기기정보, 위치정보가 생성되어 수집될 수 있습니다. 또한 이미지 및 음성을 이용한 검색 서비스 등에서 이미지나 음성이 수집될 수 있습니다.<br>
							구체적으로 1) 서비스 이용 과정에서 이용자에 관한 정보를 자동화된 방법으로 생성하여 이를 저장(수집)하거나,<br>
							2) 이용자 기기의 고유한 정보를 원래의 값을 확인하지 못 하도록 안전하게 변환하여 수집합니다. 서비스 이용 과정에서 위치정보가 수집될 수 있으며,<br>
							산타국 우체부에서 제공하는 위치기반 서비스에 대해서는 '산타국 우체부 위치기반서비스 이용약관'에서 자세하게 규정하고 있습니다.<br>
							이와 같이 수집된 정보는 개인정보와의 연계 여부 등에 따라 개인정보에 해당할 수 있고, 개인정보에 해당하지 않을 수도 있습니다.<br><br>
							
							2. 수집한 개인정보의 이용<br>
							산타국 우체부 및 산타국 우체부 관련 제반 서비스(모바일 웹/앱 포함)의 회원관리, 서비스 개발・제공 및 향상, 안전한 인터넷 이용환경 구축 등 아래의 목적으로만 개인정보를 이용합니다.<br><br>
							
							- 회원 가입 의사의 확인, 연령 확인 및 법정대리인 동의 진행, 이용자 및 법정대리인의 본인 확인, 이용자 식별, 회원탈퇴 의사의 확인 등 회원관리를 위하여 개인정보를 이용합니다.<br>
							- 콘텐츠 등 기존 서비스 제공(광고 포함)에 더하여, 인구통계학적 분석, 서비스 방문 및 이용기록의 분석, 개인정보 및 관심에 기반한 이용자간 관계의 형성, 지인 및 관심사 등에 기반한 맞춤형 서비스 제공 등 신규 서비스 요소의 발굴 및 기존 서비스 개선 등을 위하여 개인정보를 이용합니다.<br>
							- 법령 및 산타국 우체부 이용약관을 위반하는 회원에 대한 이용 제한 조치, 부정 이용 행위를 포함하여 서비스의 원활한 운영에 지장을 주는 행위에 대한 방지 및 제재, 계정도용 및 부정거래 방지, 약관 개정 등의 고지사항 전달, 분쟁조정을 위한 기록 보존, 민원처리 등 이용자 보호 및 서비스 운영을 위하여 개인정보를 이용합니다.<br>
							- 유료 서비스 제공에 따르는 본인인증, 구매 및 요금 결제, 상품 및 서비스의 배송을 위하여 개인정보를 이용합니다.<br>
							- 이벤트 정보 및 참여기회 제공, 광고성 정보 제공 등 마케팅 및 프로모션 목적으로 개인정보를 이용합니다.<br>
							- 서비스 이용기록과 접속 빈도 분석, 서비스 이용에 대한 통계, 서비스 분석 및 통계에 따른 맞춤 서비스 제공 및 광고 게재 등에 개인정보를 이용합니다.<br>
							- 보안, 프라이버시, 안전 측면에서 이용자가 안심하고 이용할 수 있는 서비스 이용환경 구축을 위해 개인정보를 이용합니다.<br>
							3. 개인정보의 보관기간<br>
							회사는 원칙적으로 이용자의 개인정보를 회원 탈퇴 시 지체없이 파기하고 있습니다.<br>
							단, 이용자에게 개인정보 보관기간에 대해 별도의 동의를 얻은 경우, 또는 법령에서 일정 기간 정보보관 의무를 부과하는 경우에는 해당 기간 동안 개인정보를 안전하게 보관합니다.<br><br>
							
							이용자에게 개인정보 보관기간에 대해 회원가입 시 또는 서비스 가입 시 동의를 얻은 경우는 아래와 같습니다.<br>
							- 산타국 우체부 서비스 혜택 중복 제공 방지<br>
							전자상거래 등에서의 소비자 보호에 관한 법률, 전자문서 및 전자거래 기본법, 통신비밀보호법 등 법령에서 일정기간 정보의 보관을 규정하는 경우는 아래와 같습니다. 산타국 우체부는 이 기간 동안 법령의 규정에 따라 개인정보를 보관하며, 본 정보를 다른 목적으로는 절대 이용하지 않습니다.<br>
							- 전자상거래 등에서 소비자 보호에 관한 법률<br>
							계약 또는 청약철회 등에 관한 기록: 5년 보관<br>
							대금결제 및 재화 등의 공급에 관한 기록: 5년 보관<br>
							소비자의 불만 또는 분쟁처리에 관한 기록: 3년 보관<br>
							- 전자문서 및 전자거래 기본법<br>
							공인전자주소를 통한 전자문서 유통에 관한 기록 : 10년 보관<br>
							- 전자서명 인증 업무<br>
							인증서와 인증 업무에 관한 기록: 인증서 효력 상실일로부터 10년 보관<br>
							- 통신비밀보호법<br>
							로그인 기록: 3개월<br><br>
							
							참고로 산타국 우체부는 ‘개인정보 유효기간제’에 따라 1년간 서비스를 이용하지 않은 회원의 개인정보를 별도로 분리 보관하여 관리하고 있습니다.<br><br>
							
							4. 개인정보 수집 및 이용 동의를 거부할 권리<br>
							이용자는 개인정보의 수집 및 이용 동의를 거부할 권리가 있습니다. 회원가입 시 수집하는 최소한의 개인정보, 즉, 필수 항목에 대한 수집 및 이용 동의를 거부하실 경우, 회원가입이 어려울 수 있습니다.
						</p>
					</div>
				</div><br>
				<input id="register" class="button" type="submit" value="회원가입">
				<input id="cancel" class="button" type="button" value="취소" onclick="location.href='/main/login'"> 
			</form>
		</div>
	</div>
</body>
</html>

