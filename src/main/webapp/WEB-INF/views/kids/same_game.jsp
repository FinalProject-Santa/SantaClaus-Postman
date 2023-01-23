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
/* ǥ�� ���� �׵θ� ���� ���� */
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
    //���� ����
    var gameState = '';

    //���� ī�� src
    var openCardId = '';
    var openCardId2 = '';

    //���� ����
    function random(min, max) {
        var randomNum = Math.floor(Math.random()*(max-min+1)) + min;
        return randomNum;
    }

    var cards; //ī�� ���
    var score = 0; //����
    var successCard = 0; //���� ī�� ����
    
    //ī�� ��ġ
    function setTable(){
        cards = [
        'game_img1.png','game_img1.png', //�絹��
        'game_img2.png','game_img2.png', //�����
        'game_img3.png','game_img3.png', //Ʈ��
        'game_img4.png','game_img4.png', // ������
        'game_img5.png','game_img5.png', // ����
        'game_img6.png','game_img6.png', //��
        'game_img7.png','game_img7.png', //�縻
        'game_img8.png','game_img8.png', //��Ÿ
        ];
        var imgTableCode = '<tr>';
        for(var i=0; i<16; i++){
            if(i>0 && i%4 == 0){
                imgTableCode += '</tr><tr>';
            }
            var idx = random(0,15-i);
            var img = cards.splice(idx,1); //idx���� �Ѱ��� �̱�
            
            imgTableCode += '<td id="card'+i+'"><img src="/resources/image/kids/'+img+'"><span>?</span></td>';
        }
        imgTableCode += '</tr>';
        $("#imgTable").html(imgTableCode);
    }

    //ī�� ��ü ������
    function hiddenCards(){
        $('#imgTable td img').hide();
        $('#imgTable td span').show();
    }

    //ī�� ����
    function startGame(){
        var sec = 6;

        $('#info').hide(); //�ȳ� ����
        scoreInit(); //���� �ʱ�ȭ
        setTable(); //ī�� ��ġ

        //ī��Ʈ �ٿ�
        function setText(){
            $('#countDown').text(--sec);
        }

        //ī��Ʈ �ٿ�
        var intervalTime = setInterval(setText, 1000);
        setTimeout(function(){
            clearInterval(intervalTime);
            $('#countDown').text('����');
            hiddenCards();
            gameState = '';
        }, 6000);
    }

    //ī�� ����
    $(document).on('click', '#imgTable td', function(){
        //ī��Ʈ �ٿ� �� ���� ��� return
        if(gameState != '') return;
        //2�� ���������� �� ���� ��� return
        if(openCardId2 != '') return;
        //�����ִ� ī�带 �� ���� ��� return
        if($(this).hasClass('opened')) return;
        //���������� �����ϱ� ���� class �߰�
        $(this).addClass('opened');

        if(openCardId == ''){
            $(this).find('img').show();
            $(this).find('span').hide();
            openCardId = this.id;
        }else{
            //���� ī�带 ���� ���
            if(openCardId == openCardId2) return;

            $(this).find('img').show();
            $(this).find('span').hide();

            var openCardSrc = $('#'+openCardId).find('img').attr('src');
            var openCardSrc2 = $(this).find('img').attr('src');
            openCardId2 = this.id;

            //��ġ
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
                	
                	alert('����!!\n' +score+ '�� �Դϴ�!');   
                }
            //����ġ
            }else{
                setTimeout(back, 1000);
                scoreMinus();
            }
        }
    });

    //�ΰ��� ī�� �ٽ� ������
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

    //���� �ʱ�ȭ
    function scoreInit(){
        score = 0;
        successCard = 0;
        $('#score').text(score);
    }
    
    //���� ����
    function scorePlus(){
        score += 10;
        $('#score').text(score);
    }

    //���� ����
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
            <p>���� �׸��� ã�ƶ�</p>
            <table id="gameTable">
                <tr>
                    <td class="Left">
                        <button id="start_btn">����</button>
                    </td>
                    <td class="right">
                        <span>score : <span id="score">0</span></span>
                    </td>
                </tr>
            </table>
        </div>
        <div>
            <div id="countDown">
                <span>�غ�</span>
            </div>
            <table id='imgTable'>
            </table>
            <div id="info">
                ���� ��ư�� �����ּ���<br>
            </div>
        </div>
	</div>
</body>
</html>