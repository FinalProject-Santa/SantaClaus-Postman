<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>내정보수정</title>
    <link rel="stylesheet" href="/resources/css/mypage/myinfoUpdate.css">
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
    <script>
      function setThumbnail(event) {
        var reader = new FileReader();

        reader.onload = function(event) {
          var img = document.createElement("img");
          img.setAttribute("src", event.target.result);
          document.querySelector("div#image_container").appendChild(img);
        };

        reader.readAsDataURL(event.target.files[0]);
      }
    </script>
</head>
<body>
    <div id="wrapper">
        <form action="/main/myinfoUpdate" id="submit" method="post" enctype="multipart/form-data">
        	<%-- <input type="hidden" name="user_id" value="${memberdto.user_id }"> --%>
<!--         	<h3>프로필 변경</h3>
			    <input type="file" id="image" accept="image/*" onchange="setThumbnail(event);"/>
			    <div id="image_container"></div> -->
			    <label>사진 등록</label>
			  	<div class="input-group mb-3">
				    <input type="file" class="form-control" id="inputGroupFile02" name="files" value="test">
				    <label class="input-group-text" for="inputGroupFile02">Upload</label>
				</div> 
				<input type="hidden" name="rfileName" value="${memberdto.rfileName}" />
            <div id="info">
            	<div>
            		<label for="name">이름</label>
            		<%-- <input type="text" name="name" class="readonly" value="${memberdto.name }" readonly ><br> --%>
            		<span>${memberdto.name }</span><br>
           		</div>
                <div>
                    <label for="id">아이디</label>
                    <input type="text" name="user_id" id="id" class="readonly" value="${memberdto.user_id }" readonly><br>
                    <%-- <span>${memberdto.user_id }</span><br> --%>
                </div>
                <div>
                    <label for="passwordck">현재 비밀번호</label>
                    <input type="text" id="passwordck" required="required" placeholder="정보 수정/탈퇴 시 입력 필수">
                </div>
                <div>
                    <label for="password">변경할 비밀번호</label>
                    <input type="text" name="password" id="pw">
                    <p id="pwChk" class="error"></p>
               	</div>
               	<div>
                    <label for="passwordck">비밀번호 확인</label>
                    <input type="text" id="pwConfirm">
                    <p id="pwConfirmChk" class="error"></p>
                </div>
                <div>
        			 <label for="addr">주소</label><br>
        			 <div id="addr">
           				 <label for="post_code">우편번호</label>
           				 <input name="post_code" id="post_code" type="text" value="${memberdto.post_code }">
                 		 <input class="button" type="button" value="주소찾기" onclick="userPostcode()"><br>
                 
		                 <label for="default_addr">기본 주소</label>
		                 <input name="default_addr" id="default_addr" type="text" value="${memberdto.default_addr}" required="required"><br>
		                 <label for="detail_addr">나머지 주소</label>
		                 <input name="detail_addr" id="detail_addr" type="text" value="${memberdto.detail_addr}" required="required">
       				 </div>
       			</div>
                
                <div>
                	<label for="email">이메일</label>
                	<input type="text" name="email" id="email" value="${memberdto.email}" required="required">
                </div>
                <div>
                    <label for="phone">휴대전화</label>
                    <input type="text" name="phone" id="phone" value="${memberdto.phone}" placeholder="'-'없이 숫자만 입력해주세요" required="required">
                    <input type="button" class="button" id="phoneAuth" value="인증번호 전송">
					<span id="sendSucess"></span>                    
                </div>
                <div>
					<label for="phoneckcode">인증코드 입력</label>
					<div>
						<input id="phoneckcode" type="text" >
						<input id="phoneck" class="button" type="button" value="인증하기">
						<span id="authSuccess"></span>
						<br>기존의 핸드폰번호와 다른데 수정을 누를 시 alert("휴대폰 인증을 해주세요")
					</div>
				</div>
                <div class="end">
                    <input type="button" class="button" id="update" value="수정">
                    <input type="button" class="button" id="cancel" value="취소" onclick="location.href='/mypage/main'">
                    <input type="button" class="button" id="delete" value="회원탈퇴" >
                </div>
		    </div>
        </form>    
    </div>
                <script src="http://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
                <script type="text/javascript">
	                var $pw = $("#pw");
	                var $pwChk = $("#pwConfirm");
	                
	            	$pw.on("keyup", function(){
	            		/* 영문, 숫자, 특수문자 중 2가지 이상 조합하여 7자리 이내의 암호 정규식 ( 2 가지 조합) */
	            		var regExp = /^(?!((?:[A-Za-z]+)|(?:[~!@#$%^&*()_+=]+)|(?:[0-9]+))$)[A-Za-z\d~!@#$%^&*()_+=]{7,}$/;
	            	      if(!regExp.test($pw.val())){
	            	    	  $("#pwConfirm").attr("disabled", true);
	            	          $("#pwChk").html("비밀번호는 영문, 숫자, 특수문자를 포함하여 7자리 이상 입력해주세요.");
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
                
                    function userPostcode() {
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
                    }
                    
                    $('#phoneAuth').click(function() {
                    	$("#sendSucess").text("인증번호를 확인 해주세요.");
                		var to = $('#user_phone').val();

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
                    
                	$("#update").click(function() {
                		$.ajax({
                			url: "/main/phoneChk",
                			type: 'POST',
                			data: {
                				"user_id" : id,
                				"phone" : phone
                			},
                			success: function(data){
                				if(to != data){
                					alert("변경된 핸드폰을 인증해주세요.")
                					return false;
                				}
                			}
               			});
                		
                		var id = $('#id').val();
                		var pwChk = $('#passwordck').val();
                		var pw = $('#pw').val();
                		
                		
                		$.ajax({
                			url: "/main/pwChk",
                			type : 'POST',
                			data: {
                				"user_id" : id,
                				"pwChk" : pwChk
                				},
                			success: function(res){
		                		var updateCk = confirm("수정하시겠습니까?");
		                		if(updateCk){
	                				if(res == pwChk) {
				                		if(pw == " " || pw == "" || pw == null) {
				                			pw = pwChk;
				                		}
				                		console.log("pwChk="+pwChk);
				                		console.log("pw="+pw);
	               						alert("회원 정보가 수정되었습니다.");
	               						$("#submit").submit();
	                				}else {
	                					alert("비밀번호가 틀렸습니다.");
	                					window.location.reload();
	                				}
		                		}else{
		                			return false;
		                		}
                			},
                			error: function(error){
                				alert("다시 시도해 주세요.");
                			}	
                		});
                		
                	});
                </script>
                
                <script type="text/javascript">
            		$(document).ready(function(){
	                	$("#delete").click(function(){
	                		var deleteCk = confirm("정말 삭제하시겠습니까?");
	                		if(deleteCk){
	                			location.href='/main/delete';
	                		}
	                	});
	                	
	                	
            		});	
                </script>
</body>
</html>