<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/kids/diary.css">
</head>
<body>
	<form action="/kids/selectPath" method="post" id="diaryForm">
	<input type="hidden" name="user_id" id="user" value="user01">
	<input type="hidden" name="kids_no" id="kids" value=1>
	<input type="hidden" name="userEmail" id="email" value="jiyeon908@naver.com">	
    <div class="diary">
    <div class="drawing">
        <span id="text">���� ������ �߳���?</span>
    </div>
    <section id="diary_box">
    <canvas id="jsCanvas" class="canvas"></canvas>
    </section>
    <div class="controls">
        <div class="controls_range">
            <input type="range" id="jsRange" min="0.1" max="5.0" value="2.5" step="0.1">
        </div>
        <div class="controls_btns">
            <button id="jsMode" type="button">Fill</button>
            <button id="jsErase" type="button">Erase</button>
            <button id="jsBack" type="button">Back</button>
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
        <!-- <button id="send_btn" type="submit">�ڶ��ϱ�</button> -->
        <button id="save_btn" type="button">���� �����ϱ�</button>
        <button id="success_btn" type="button" onclick="return false">�ۼ��Ϸ�</button>
    </div>
    </div>
    <div class="modal hidden">
        <div class="bg"></div>
        <div class="modalBox">
          <p id="modal_text">���� ��̴� �Ӹ�</p>
        <div class="modal_Btn">
          <button class="stickerBtn" type="button" onclick="location.href='/kids/sticker'">Ī����ƼĿ</button>
          <button class="mainBtn" id="send_btn" type="button">�ڶ��ϱ�</button>
        </div>
        </div>
      </div>
    <script src="/resources/js/kids/diary.js"></script>
    <script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.9.0/jquery.js"></script>
    <script src="https://html2canvas.hertzen.com/dist/html2canvas.min.js"></script>
    <script>
    $(function(){
    	// ���� �ۼ� ����
        	var userId = $("#user").val().trim();
        		$.ajax({
        			type:"POST",
                    data:{
                        "userID":userId,
                    },
                    dataType:"text",
                    url:"/kids/selectDate",
                    success:function(date){
                        console.log("��¥ :"+date);
                        if(date!=""){
                        	alert("���� �ۼ��߽��ϴ�.");
                            $("#success_btn").attr("disabled",true);
                            $("#success_btn").css('backgroundColor','yellow');
                    	}
                    },
                    error:function(a,b,c){
                        alert("error");
                    }
        		});
    });
    
    
    const canvasrr = document.getElementById("jsCanvas");
    
    $("#success_btn").on("click",function(){
    	screenShot($("#diary_box"));
    	
    });
    
    $("#send_btn").on("click",function(){
    	sendEmail();
    });
    
    
    // �̹��� ����
    function screenShot(target){
        if(target != null && target.length>0){
            var t = target[0];
            html2canvas(t).then(function(canvas){
            	var myImg = canvasrr.toDataURL("image/png");
            	var userId = $("#user").val().trim();
            	var kidsNo = $("#kids").val().trim();
            	var userEmail = $("#email").val().trim();
                myImg = myImg.replace("data:image/png;base64,", "");

                $.ajax({
                    type:"POST",
                    data:{
                        "imgSrc":myImg,
                        "userID":userId,
                        "kidsNO":kidsNo,
                        "userEmail":userEmail
                    },
                    dataType:"text",
                    url:"/kids/ImgSaveTest",
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
    
    
    function sendEmail(){
            	var myImg = canvasrr.toDataURL("image/png");
            	var userId = $("#user").val().trim();
            	var userEmail = $("#email").val().trim();
                myImg = myImg.replace("data:image/png;base64,", "");

               	$.ajax({
                       type:"POST",
                       data:{
                           "imgSrc":myImg,
                           "userID":userId,
                           "userEmail":userEmail
                       },
                       dataType:"text",
                       url:"/kids/sendEmail",
                       success:function(data){
        					alert("���۵Ǿ����ϴ�.");
        					location.href='/kids/main';
                       },
                       error:function(a,b,c){
                           alert("error");
                       }
                   });
        }
    
    </script>
    </form>
</body>
</html>