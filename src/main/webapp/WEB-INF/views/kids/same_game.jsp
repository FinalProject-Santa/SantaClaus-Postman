<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<title>같은 그림 찾기</title>
<link rel="shortcut icon" href="/resources/image/kids/favicon.ico">
<link rel="stylesheet" href="/resources/css/kids/same.css">

<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
    //게임 상태
    var gameState = '';

    //열린 카드 src
    var openCardId = '';
    var openCardId2 = '';

    //난수 생성
    function random(min, max) {
        var randomNum = Math.floor(Math.random()*(max-min+1)) + min;
        return randomNum;
    }

    var cards; //카드 목록
    var score = 0; //점수
    var successCard = 0; //맞춘 카드 개수
    
    //카드 배치
    function setTable(){
        cards = [
        'game_img1.png','game_img1.png', //루돌프
        'game_img2.png','game_img2.png', //눈사람
        'game_img3.png','game_img3.png', //트리
        'game_img4.png','game_img4.png', // 진저맨
        'game_img5.png','game_img5.png', // 선물
        'game_img6.png','game_img6.png', //종
        'game_img7.png','game_img7.png', //양말
        'game_img8.png','game_img8.png', //산타
        ];
        var imgTableCode = '<tr>';
        for(var i=0; i<16; i++){
            if(i>0 && i%4 == 0){
                imgTableCode += '</tr><tr>';
            }
            var idx = random(0,15-i);
            var img = cards.splice(idx,1); //idx부터 한개씩 뽑기
            
            imgTableCode += '<td id="card'+i+'"><img src="/resources/image/kids/game/'+img+'"><span>?</span></td>';
        }
        imgTableCode += '</tr>';
        $("#imgTable").html(imgTableCode);
    }

    //카드 전체 가리기
    function hiddenCards(){
        $('#imgTable td img').hide();
        $('#imgTable td span').show();
    }

    //카드 시작
    function startGame(){
        var sec = 6;

        $('#info').hide(); //안내 문구
        scoreInit(); //점수 초기화
        setTable(); //카드 배치

        //카운트 다운
        function setText(){
            $('#countDiv').text(--sec);
        }

        //카운트 다운
        var intervalTime = setInterval(setText, 1000);
        setTimeout(function(){
            clearInterval(intervalTime);
            $('#countDiv').text('시작');
            hiddenCards();
            gameState = '';
        }, 6000);
    }

    //카드 선택
    $(document).on('click', '#imgTable td', function(){
        //카운트 다운 중 누른 경우 return
        if(gameState != '') return;
        //2개 열려있을때 또 누른 경우 return
        if(openCardId2 != '') return;
        //열려있는 카드를 또 누른 경우 return
        if($(this).hasClass('opened')) return;
        //열려있음을 구분하기 위한 class 추가
        $(this).addClass('opened');

        if(openCardId == ''){
            $(this).find('img').show();
            $(this).find('span').hide();
            openCardId = this.id;
        }else{
            //같은 카드를 누른 경우
            if(openCardId == openCardId2) return;

            $(this).find('img').show();
            $(this).find('span').hide();

            var openCardSrc = $('#'+openCardId).find('img').attr('src');
            var openCardSrc2 = $(this).find('img').attr('src');
            openCardId2 = this.id;

            //일치
            if(openCardSrc == openCardSrc2) {
                openCardId = '';
                openCardId2 = '';
                scorePlus();
                if(++successCard == 8){
                	$.ajax({
                		type:"POST",
                		data:{
                			/* "kids_no":kids_no */
                		},
                		url:"/kids/gamePoint",
                		success:function(data){
         					console.log(data);
                		},
                		error:function(){
                			alert("point_error");
                		}
                	});
                	
                	alert('성공! ' +score+ '점입니다!\n5포인트가 적립되었어요!');   
                }
            //불일치
            }else{
                setTimeout(back, 1000);
                scoreMinus();
            }
        }
    });

    //두개의 카드 다시 뒤집기
    function back(){
        $('#'+openCardId).find('img').hide();
        $('#'+openCardId).find('span').show();
        $('#'+openCardId2).find('img').hide();
        $('#'+openCardId2).find('span').show();
        $('#'+openCardId).removeClass('opened');
        $('#'+openCardId2).removeClass('opened');
        openCardId = '';
        openCardId2 = '';
    }

    //점수 초기화
    function scoreInit(){
        score = 0;
        successCard = 0;
        $('#score').text(score);
    }
    
    //점수 증가
    function scorePlus(){
        score += 10;
        $('#score').text(score);
    }

    //점수 감소
    function scoreMinus(){
        score -= 5;
        $('#score').text(score);
    }

    $(document).on('click', '#start_btn', function(){
        if(gameState == ''){
            startGame();
            gameState = 'alreadyStart'
        }
    });



</script>

<body>

	<%@include file="../include/kidsheader.jsp" %>
	
	<!-- main -->
	<div class="inner">

        <div class="game">
            <div>
                <p class="gametitle">
                    <span style="color: rgb(255, 225, 0); font-size: 75px;" >같은</span><span style="color: rgb(252, 0, 126); font-size: 75px;"> 그림</span><span style="color: rgb(252, 0, 126); font-size: 55px;">을</span> <span style="color: rgb(49, 172, 254); font-size: 55px; padding-left: 10px;"> 찾아보세요</span>
                </p>
                <div class="btn_group">
                    <button id="start_btn">시작</button>
                    <button id="home_btn" onclick="location.href='/kids/gamemain'">게임 홈</button>
                    </div>
                <table id="gameTable">
                    <tr>
                        <!-- <td class="Left">
                        </td> -->
                        <td class="right">
                            <span>점수 : <span id="score">0</span></span>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="samegame">
                <div id="countDown">
                    <div id="countDiv">준비</div>
                </div>
                <table id='imgTable'>
                </table>
                <div id="info">
                    <div id="infoDiv"><span style="font-size: 44px;">시작 버튼</span>을 눌러주세요 -></div><br>
                </div>
            </div>
        </div>

    </div>
	
	<%@include file="../include/kidsfooter.jsp" %>
	
</body>
</html>