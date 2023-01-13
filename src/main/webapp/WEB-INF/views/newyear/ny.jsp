<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- CSS only -->

<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    
    <link rel="shortcut icon" href="/resources/image/newyear/fav2.jpg">
    
    
    
    <!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <link href="/resources/css/nytree/reset.css" rel="stylesheet" type="text/css">
    <link href="/resources/css/nytree/swiper.css" rel="stylesheet" type="text/css">
    <link href="/resources/css/nytree/respon.css" rel="stylesheet" type="text/css">
    <script language="JavaScript" src="https://code.jquery.com/jquery-3.6.3.min.js" charset="euc-kr"></script>
    <script language="JavaScript" src="/resources/js2/wow.min.js" charset="euc-kr"></script>
    <script language="JavaScript" src="/resources/js2/bootstrap.min.js" charset="euc-kr"></script>
    <script language="JavaScript" src="/resources/js2/swiper.6.4.8.min.js" charset="euc-kr"></script>
    <script language="JavaScript" src="/resources/js2/nycard.js" charset="euc-kr"></script>


  </head>
<title></title>
<style>
    canvas {
            border: 2px solid grey
            
        }
  </style>
<body>

    <a name="cardsend"></a>
    <section class="section02 cardBox" style='display:none;' id='insamalCardImage'>
      <div class="content">
        <p class="section-tit ft-pre wow fadeIn">연하장 보내기</p>
        <div class="tabs wow fadeIn">
  
  
          <div class="tab-content">
            <div class="tab-pane active">
              <ul class="pc-view" id='insamalCardImagePC'>
                            </ul>
              <!-- Swiper -->
              <div class="swiper-container card-send-slideM mo-view">
                <div class="swiper-wrapper" id='insamalCardImageMO'>
                                </div>
              </div>
            </div>
          </div><!-- //tab-content -->
        </div><!-- //tabs -->
  
      </div>
  

          <div class="swiper-button-prev"></div>
          <div class="swiper-button-next"></div>
          <div class="btn-area text-center">
          </div>
   
  
    </section>
  
    <a name="cardmake"></a>
    <section class="section03 cardBox" style='' id='insamalCardCustom'>
      <div class="content ft-pre">
        <p class="section-tit ft-pre">연하장 보내기</p>
        <div class="tabs">
        </div>
          <div class="card-box wow " data-wow-delay="0.5s">
        <p class="make-tit">내 사진</p>
        <div class="col hidden-sm col-md-1 hidden-xs image-select">
        <input type="file">  
        <canvas name='content' id="myCanvas" width="180" height="300"></canvas>
      </div>

        </div>
        <div class="card-box wow " data-wow-delay="0.5s">
          <div class="col hidden-sm col-md-2 hidden-xs image-select">
            <p class="make-tit">템플릿 선택</p>
            <ul class="card-list" id='insamalSelectCard'>
              <li id='slideMakePagination' data-index='0'><img src='/resources/image/newyear/ny11.jpg'></li>
  <li id='slideMakePagination' data-index='1'><img src='/resources/image/newyear/ny21.jpg'></li>
  <li id='slideMakePagination' data-index='2'><img src='/resources/image/newyear/ny31.jpg'></li>
  <li id='slideMakePagination' data-index='3'><img src='/resources/image/newyear/ny41.jpg'></li>
            </ul>
          </div>

          <div class="col col-sm-8 col-md-6 col-xs-12 style-select">
            <div class="style-select-top">
              <p class="make-tit">스타일</p>
              <ul class="dropdown select-area">
                <li>
                  <button class="dropbtn" id="fstyle">고딕</button>
                  <div class="dropdown-content fstyle-select">
                    <button type="button" style="font-family:'Nanum Gothic', serif;">고딕</button>
                    <button type="button" style="font-family:'Nanum Myeongjo', serif;">명조</button>
                    <button type="button" style="font-family:'Gamja Flower';">손글씨</button>
                  </div>
                </li>
                <li>
                  <button class="dropbtn" id="fsize">16pt</button>
                  <div class="dropdown-content fsize-select">
                    <button type="button" style="font-size:12pt;">12pt</button>
                    <button type="button" style="font-size:16pt;">16pt</button>
                    <button type="button" style="font-size:20pt;">20pt</button>
                    <button type="button" style="font-size:24pt;">24pt</button>
                  </div>
                </li>
                <li>
                  <button class="dropbtn-color" id="fcolor">가</button>
                  <div class="dropdown-content fcolor-select">
                    <button type="button" style="background-color:#ffffff;">color1</button>
                    <button type="button" style="background-color:#000000;">color2</button>
                    <button type="button" style="background-color:#008040;">color3</button>
                    <button type="button" style="background-color:#9cc813;">color4</button>
                    <button type="button" style="background-color:#d5406a;">color5</button>
                    <button type="button" style="background-color:#fdb514;">color6</button>
                  </div>
                </li>
              </ul>
            </div>
            <!-- Swiper -->
            <div class="swiper-container card-make-slide">
              <div class="swiper-wrapper" id='insamalSlideCard'>
                
                <div class='swiper-slide' data-slide-index='0'>
                  <div>
                    <img src='/resources/image/newyear/ny11.jpg' data-keyn='317'>
                    <textarea name='content' style='' placeholder="Don't cry because it's over. Smile becuase it happened."></textarea>
                  </div>
                </div>
  
                <div class='swiper-slide' data-slide-index='1'>
                  <div>
                    <img src='/resources/image/newyear/ny21.jpg' data-keyn='318'>
                    <textarea name='content' style=''>Don't cry because it's over. Smile becuase it happened.</textarea>
                  </div>
                </div>
  
                <div class='swiper-slide' data-slide-index='2'>
                  <div>
                    <img src='/resources/image/newyear/ny31.jpg' data-keyn='319'>
                    <textarea name='content' style=''>걱정을 해서 걱정이 없다면 걱정이 없겠네.</textarea>
                  </div>
                </div>
  
                <div class='swiper-slide' data-slide-index='3'>
                  <div>
                    <img src='/resources/image/newyear/ny41.jpg' data-keyn='320'>
                    <textarea name='content' style=''>걱정을 해서 걱정이 없다면 걱정이 없겠네.</textarea>
                  </div>
                </div>
  
                <div class='swiper-slide' data-slide-index='4'>
                  <div>
                    <img src='https://imgf.yesform.com/insamalCard/cardImage/3_custom_1671431056_4.jpg' data-keyn='321'>
                    <textarea name='content' style=''>검은 토끼의 해, 2023년에는
  깡충깡충 도약하는 한 해 보내시기 바랍니다.</textarea>
                  </div>
                </div>
  

  
           </div>
            </div>
          </div>
        </div><!--// card-box -->
        <div class="btn-area text-center pc-view">
          <button type='button' name='btnSend' data-type='새해' data-mode='custom' data-share='kakao'><img width="250px" height="100px"  src="/resources/image/newyear/btn-att-kak.png" alt="카카오톡"></button>
          <!--<button type='button' name='btnSend' data-type='새해' data-mode='custom' data-share='kakao'><img src="https://imgs.yesform.com/z_n/imgs/atwrt/insamal_card/btn_kakao.png" alt="카카오톡"></button>
          <button type='button' name='btnSend' data-type='새해' data-mode='custom' data-share='download'><img src="https://imgs.yesform.com/z_n/imgs/atwrt/insamal_card/btn_down.png" alt="다운로드"></button>
          -->
          </div>
      </div><!--// content -->
    </section>
  
    <input type='hidden' name='fstyle'>
    <input type='hidden' name='fsize'>
    <input type='hidden' name='fcolor'>
    <input type='hidden' name='image_keyn' value=''>
    <input type='hidden' name='custom_keyn' value='317'>
  

</body>