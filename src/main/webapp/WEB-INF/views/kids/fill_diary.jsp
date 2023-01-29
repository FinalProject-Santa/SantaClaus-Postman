<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" href="/resources/css/kids/diary.css">

<body>

	<%@include file="../include/kidsheader.jsp" %>
	
	
	<!-- main -->
	<form action="/kids/sticker" method="post" id="diaryForm">
	<input type="hidden" name="fillDate" id="date" value="${Date }">
	
<div class="inner">
    <div class="diary">
    <div class="drawing">
	        <span id="text">오늘 무엇을 했나요?</span>
	        <span id="text2">${Date } ${kids.kids_nickname }의 그림일기</span>
    </div>
    <section id="diary_box">
    <canvas id="jsCanvas" class="canvas" width='1000px' height='500px'></canvas>
    </section>
    <div class="controls">
        <div class="controls_range">
            <input type="range" id="jsRange" min="0.1" max="5.0" value="2.5" step="0.1">
        </div>
        <div class="controls_btns">
            <button id="jsMode" type="button">채우기</button>
            <button id="jsErase" type="button">지우개</button>
            <button id="jsBack" type="button">실행취소</button>
        </div>
        <div class="controls_colors" id="JSColors">
            <div class="controls_color jsColor" style="background-color: black;"></div>
            <div class="controls_color jsColor" style="background-color: white;"></div>
            <div class="controls_color jsColor" style="background-color: red;"></div>
            <div class="controls_color jsColor" style="background-color: orange;"></div>
            <div class="controls_color jsColor" style="background-color: yellow;"></div>
            <div class="controls_color jsColor" style="background-color: green;"></div>
            <div class="controls_color jsColor" style="background-color: blue;"></div>
            <div class="controls_color jsColor" style="background-color: navy;"></div>
            <div class="controls_color jsColor" style="background-color: purple;"></div>
        </div>
    </div>
    <div class="btn_group">
        <!-- <button id="send_btn" type="submit">자랑하기</button> -->
        <button id="save_btn" type="button">사진 저장</button>
        <button id="success_btn" type="button" onclick="return false">작성완료</button>
    </div>
    </div>
    <div class="modal hidden">
        <div class="bg"></div>
        <div class="modalBox">
          <p id="modal_text">일기 작성 완료!</p>
          <p id="modal_text2">칭찬스티커를 확인해보세요!</p>
          <p id="modal_text3">• 자랑하기를 누르면<br>이메일로 일기가 전송됩니다 •</p>
        <div class="modal_Btn">
          <button class="stickerBtn" id="sticker_btn" type="submit">칭찬스티커</button>
          <button class="mainBtn" id="send_btn" type="button">자랑하기</button>
        </div>
        </div>
      </div>
      
</div>

    
      <%@include file="../include/kidsfooter.jsp" %>
      
      
    <script src="/resources/js/kids/diary.js"></script>
    <script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.9.0/jquery.js"></script>
    <script src="https://html2canvas.hertzen.com/dist/html2canvas.min.js"></script>
    <script>
   
    const canvasrr = document.getElementById("jsCanvas");
    const content = canvasrr.getContext('2d');
    
    $("#success_btn").on("click",function(){
    	screenShot($("#diary_box"));
    	
    });
    
    $("#send_btn").on("click",function(){
    	sendEmail();
    });
    
    
    $(function(){
    	// 텍스트
    	/* content.clearRect(0,0,canvasrr.width,canvasrr.height);
    	content.fillText('년 월 일',30,50);
    	content.font = '200px'; */
    	
    	// 해당 날짜 작성 여부
        	/* var userId = $("#user").val().trim(); */
    		var fillDate = $("#date").val().trim();
        		$.ajax({
        			type:"POST",
                    data:{
                        /* "userID":userId, */
                        "fillDate":fillDate
                    },
                    dataType:"text",
                    url:"/kids/fillDate",
                    success:function(date){
                        console.log("날짜 :"+date);
                        if(date!=""){
                        	alert("해당 날짜는 작성되었습니다.");
                            $("#success_btn").attr("disabled",true);
                            $("#success_btn").css('backgroundColor','yellow');
                    	}
                    },
                    error:function(a,b,c){
                        alert("dateerror");
                    }
        		});
    });
    
    
    // 이미지 저장
    function screenShot(target){
	        if(target != null && target.length>0){
	            var t = target[0];
	            html2canvas(t).then(function(canvas){
            	var myImg = canvasrr.toDataURL("image/png");
            	var fillDate = $("#date").val().trim();
                myImg = myImg.replace("data:image/png;base64,", "");

                $.ajax({
                    type:"POST",
                    data:{
                        "imgSrc":myImg,
                        "fillDate":fillDate
                    },
                    dataType:"text",
                    url:"/kids/DiaryFill",
                    success:function(data){
                        console.log(data);
                    },
                    error:function(a,b,c){
                        alert("error");
                    }
                    
                });
	                
	            })
	        }
	    }
    
	    // 메일 보내기
	    function sendEmail(){
            	var myImg = canvasrr.toDataURL("image/png");
                myImg = myImg.replace("data:image/png;base64,", "");

               	$.ajax({
	                  type:"POST",
	                  data:{
	                      "imgSrc":myImg,
	                      /* "userID":userId,
	                      "userEmail":userEmail */
	                  },
	                  dataType:"text",
	                  url:"/kids/sendEmail",
	                  success:function(data){
	   					alert("전송되었습니다.");
	   					location.href='/kids/main';
	                  },
	                  error:function(a,b,c){
	                      alert("saveerror");
	                  }
	              });
        }
    
    
    </script>
    </form>
</body>
</html>