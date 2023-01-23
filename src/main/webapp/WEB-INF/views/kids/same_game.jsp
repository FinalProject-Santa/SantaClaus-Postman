<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
.game{
    width: 495px;
    margin: auto;
    /* display: inline-block; */
    /* border: solid black 1px; */
}
#start_btn{
    border: none;
    width: 100px;
    padding: 5px;
    font-weight: bold;
    cursor: pointer;
}
/* 표와 셀의 테두리 간격 설정 */
#imgTable{
    border-collapse: collapse; 
}
#imgTable td{
    border: 1px solid black;
    width: 120px;
    height: 120px;
    text-align: center;
    cursor: pointer;
}
#imgTable td img{
    width: 110px;
    height: 110px;
}
#imgTable td span{
    font-size: 25pt;
    font-weight: bold;
    display: none;
}
#countDown{
    background-color: lightgray;
    width: 491px;
    height: 40px;
    border: 1px solid gray;
}
#countDown span{
    position: relative;
    margin-left: 226px;
    top: 5px;
    font-size: 15pt;
}
#info{
    width: 493px;
    height: 263px;
    background-color: lightgray;
    padding-top: 230px;
}
</style>
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
            
            imgTableCode += '<td id="card'+i+'"><img src="/resources/image/kids/'+img+'"><span>?</span></td>';
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
            $('#countDown').text(--sec);
        }

        //카운트 다운
        var intervalTime = setInterval(setText, 1000);
        setTimeout(function(){
            clearInterval(intervalTime);
            $('#countDown').text('시작');
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
                	
                	alert('성공!!\n' +score+ '점 입니다!');   
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
</head>
<body>
	<div class="game">
        <div>
            <p>같은 그림을 찾아라</p>
            <table id="gameTable">
                <tr>
                    <td class="Left">
                        <button id="start_btn">시작</button>
                    </td>
                    <td class="right">
                        <span>score : <span id="score">0</span></span>
                    </td>
                </tr>
            </table>
        </div>
        <div>
            <div id="countDown">
                <span>준비</span>
            </div>
            <table id='imgTable'>
            </table>
            <div id="info">
                시작 버튼을 눌러주세요<br>
            </div>
        </div>
	</div>
</body>
</html>