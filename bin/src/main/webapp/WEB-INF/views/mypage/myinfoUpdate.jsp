<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>내정보수정</title>
    <link rel="stylesheet" href="/resources/css/mypage/myinfoUpdate.css">
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
        <form action="infoupdate.do?userid=${dto.userid}" method="post">
        	<h3>프로필 변경</h3>
			    <input type="file" id="image" accept="image/*" onchange="setThumbnail(event);"/>
			    <div id="image_container"></div>
            <did id="info">
                <div>
                    <label for="id">아이디</label>
                    <span id="id">$(memberid)</span><br>
                </div>
                <div>
                    <label for="password">비밀번호</label>
                    <input type="text" id="password">
                </div>
                <div>
                    <label for="passwordck">비밀번호 확인</label>
                    <input type="text" id="passwordck">
                </div>
                        <div>
                 			 <label for="addr">주소</label>
	               			  <input name="post_code" type="text" class="">
           					 <div class="adress">
			                  <input class="button" type="button" value="우편번호" onclick="userPostcode()"><br><br>
			                  <input name="default_addr" type="text"> 기본 주소<br><br>
			                  <input name="detail_addr" type="text" required="required"> 나머지 주소
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
                
                    </div>
                </div>
                <div>
                    <label for="phone1">휴대전화</label>
                    <input type="text" class="phone" id="phone1"> - 
                    <input type="text" class="phone" id="phone2"> - 
                    <input type="text" class="phone" id="phone3">
                    <input type="button" class="button" id="phoneck" value="휴대폰 인증">
                </div>
                <div class="end">
                    <input type="submit" class="button" id="update" value="수정">
                    <input type="button" class="button" id="cancel" value="취소" onclick="location.href='mypage'">
                </div>
            </div>
        </form>    
    </div>
</body>
</html>