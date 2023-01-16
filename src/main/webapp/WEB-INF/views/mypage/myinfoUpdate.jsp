<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>내정보수정</title>
    <link rel="stylesheet" href="/resources/css/mypage/myinfoUpdate.css">
    <script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
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
        <form:form action="infoupdate.do?userid=${memberdto.user_id }" method="PUT">
        	<input type="hidden" name="user_id" value="${memberdto.user_id }">
        	<h3>프로필 변경</h3>
			    <input type="file" id="image" accept="image/*" onchange="setThumbnail(event);"/>
			    <div id="image_container"></div>
            <did id="info">
            	<div>
            		<label for="name">이름</label>
            		<input type="text" name="name" value="${memberdto.name }" readonly><br>
           		</div>
                <div>
                    <label for="id">아이디</label>
                    <input type="text" name="user_id" value="${memberdto.user_id }" readonly><br>
                </div>
                <div>
                    <label for="passwordck">현재 비밀번호</label>
                    <input type="text" id="passwordck" required="required" placeholder="정보 수정 시 입력 필수">
                </div>
                <div>
                    <label for="password">변경할 비밀번호</label>
                    <input type="text" name="password" id="password">
               	</div>
               	<div>
                    <label for="passwordck">비밀번호 확인</label>
                    <input type="text" id="passwordck">
                </div>
                <div>
        			 <label for="addr">주소</label><br>
        			 <div id="addr">
           				 <label for="post_code">우편번호</label>
           				 <input name="post_code" id="post_code" type="text" value="${memberdto.post_code }">
                 		 <input class="button" type="button" value="주소찾기" onclick="userPostcode()"><br>
                 
		                 <label for="default_addr">기본 주소</label>
		                 <input name="default_addr" id="default_addr" type="text" value="${memberdto.default_addr}"><br>
		                 <label for="detail_addr">나머지 주소</label>
		                 <input name="detail_addr" id="detail_addr" type="text" value="${memberdto.detail_addr}" required="required">
       				 </div>
       			</div>
                
                <script src="http://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
                <script>
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
                </script>
                
                <div>
                	<label for="email">이메일</label>
                	<input type="text" name="email" id="email" value="${memberdto.email}" required="required">
                </div>
                <div>
                    <label for="phone">휴대전화</label>
                    <input type="text" name="phone" id="phone" value="${memberdto.phone}" required="required">
                    <input type="button" class="button" id="phoneck" value="휴대폰 인증">
                    <br>기존의 핸드폰번호와 다른데 수정을 누를 시 alert("휴대폰 인증을 해주세요")
                </div>
                <div class="end">
                    <input type="submit" class="button" id="update" value="수정">
                    <input type="button" class="button" id="cancel" value="취소" onclick="location.href='/mypage/main'">
                    <input type="button" class="button" id="delete" value="삭제" >
                </div>
                <script>
            		$(document).ready(function(){
	                	$("#delete").click(function(){
	                		var deleteCk = confirm("정말 삭제하시겠습니까?")
	                		if(deleteCk){
	                			location.href='/main/delete';
	                		}
	                	});
	                	
	                	
            		});	
                </script>
            </div>
        </form:form>    
    </div>
</body>
</html>