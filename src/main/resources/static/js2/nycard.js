$(document).ready(function() {

  var isMobile = /Android|webOS|iPhone|iPad|iPod|BlackBerry/i.test(navigator.userAgent) ? true : false;

  if(typeof resuri === "undefined") resuri = encodeURIComponent(location.href);
  var mobile_member_url = 'https://m.yesform.com/member';
  var mobile_login_url = mobile_member_url+'/login.php?urlstr='+resuri;
  var mobile_naver_url = mobile_member_url+'/naverIdLogin.php?urlstr='+resuri;

 /*
  $.chkLoginCard = function() {
    if(cUserInfo===undefined) {
      if(isMobile===true) {
        if(mobile_login_url!=undefined) top.location.href=mobile_login_url;
      } else {
        LoginScreen('show', document.URL, '');
      }
      return false;
    } else {
      if(user_type=='Sol' || user_uniq=='1' || user_iden=='-1') {
        if(isMobile===true) {
          if(mobile_naver_url!=undefined) top.location.href=mobile_naver_url;
        } else {
          SNS_Member_layer();
        }

        return false;
      }
    }
  }
*/
  new WOW().init();

  
  // 활성화 되있는 주제에 따른 상단 슬라이드 초기 활성화
  var top_slide_active = $("input:hidden[name='top-slide-active']").val();
  console.log(top_slide_active);
  var swiperTop = new Swiper('.top-slide', {
    autoplay: true,
    direction: 'horizontal',
    spaceBetween: 0, // 슬라이드 사이의 간격 px 단위
    mousewheelControl: false, // 마우스 휠로 슬라이드 움직임
    //loop : true,
    grabCursor: true,
    centeredSlides:0,  //활성 슬라이드가 왼쪽 또는 가운데 배치 (1,0,true,false)
    slidesPerView:"auto",  // 한번에 보이는 슬라이드 갯수. 반응형 및 다양한 디자인은 auto가 나음.
    initialSlide:top_slide_active
  });

  // 상단 메인 슬라이드 배너.. 마우스 온, stop
  $('.top-slide').on('mouseenter', function(e){
    //console.log('stop autoplay');
    swiperTop.autoplay.stop();
  });
  // 상단 메인 슬라이드 배너.. 마우스 리브, start
  $('.top-slide').on('mouseleave', function(e){
    //console.log('start autoplay');
    swiperTop.autoplay.start();
  });

  // 카드보내기/ 만들기 슬라이드 선택 시, 해당 슬라이드된 카드이미지 정보를 저장.
  // 슬라이드가 로드/changed 된 후에 호출해줘야 한다.
  $.activeSlideSave = function(wrapperClass, index, mode) {
    var $slides = $('.'+wrapperClass+' .swiper-slide');
    $slides.each(function() {
      if($(this).data('slide-index')==index) {
        var imgs_keyn = $(this).find('img').data('keyn');
        $("input:hidden[name='"+mode+"_keyn']").val(imgs_keyn);
        //console.log(index+' '+imgs_keyn);
        return false;
      }
    });

  }

  /*카드만들기 슬라이드*/
  var makeSlideOptions = {
    autoplay: false,
    direction: 'horizontal',
    spaceBetween: 15,
    mousewheelControl: false,
    loop : false,
    grabCursor: true,
    centeredSlides:true,
    slidesPerView:1.3,
    breakpoints: {
      767: {
        slidesPerView: "auto",
        spaceBetween: 0
      }
    },
    on: {
      afterInit: function(e) {
        $.activeSlideSave('card-make-slide', e.realIndex, 'custom');
      },
      slideChangeTransitionEnd: function(e) {
        $.activeSlideSave('card-make-slide', e.realIndex, 'custom');
      }
    }
  };

  // 카드만들기 컨텐츠가 있으면 swiper
  if($("#insamalSlideCard").html().trim()!='') var swiperMake = new Swiper('.card-make-slide', makeSlideOptions);

  //  카드보내기 팝업창 띄우기
  $(document).on("click", ".tab-pane li",function(){
    $('.cardPopup').show();
    //$('body').css("overflow","hidden");
	$('body').css({"overflow":"hidden","padding-right":"17px"});
	$('.navbar .container-fluid').css("padding-right","17px");

    // 카드 슬라이드 index
    var index = $(this).index();  // li index

    /* 카드보내기 슬라이드 - 팝업 */
    var swiperSend = new Swiper('.card-send-slide', {
      autoplay: false,
      direction: 'horizontal',
      spaceBetween: 0,
      mousewheelControl: false,
      loop : true,
      grabCursor: true,
      navigation: {
        nextEl: '.swiper-button-next',
        prevEl: '.swiper-button-prev',
      },
      centeredSlides:!0,
      slidesPerView:"auto",
      initialSlide:index,
      on: {
        afterInit: function(e) {
          $.activeSlideSave('card-send-slide', e.realIndex, 'image');
        },
        slideChangeTransitionEnd: function(e) {
          $.activeSlideSave('card-send-slide', e.realIndex, 'image');
        }
      }
    });

  });

  //  카드보내기 팝업창 닫기
  $.popupClose = function() {
    $('.cardPopup').hide();
   // $('body').css("overflow","auto");
	$('body').css({"overflow":"auto","padding-right":"0"});
	$('.navbar .container-fluid').css("padding-right","0");
  }

  $(".pop-close").on("click",function() {
    $.popupClose();
  });

  $('body').on('click', function(e) {
    if($(e.target).hasClass('cardPopup')) $.popupClose();
  });

  /* 카드보내기 슬라이드 - 모바일 */
  var sendSlideMOptions = {
    autoplay: false,
    direction: 'horizontal',
    spaceBetween: 15,
    mousewheelControl: false,
    loop : true,
    grabCursor: true,
    centeredSlides:true,
    slidesPerView:1.3,
    on: {
      afterInit: function(e) {
        $.activeSlideSave('card-send-slideM', e.realIndex, 'image');
      },
      slideChangeTransitionEnd: function(e) {
        $.activeSlideSave('card-send-slideM', e.realIndex, 'image');
      }
    }
  };

  if($('#insamalCardImageMO').html().trim()!='') var swiperSendM = new Swiper('.card-send-slideM', sendSlideMOptions);

  /* 버튼 split */
  document.querySelectorAll('.section01 .btn').forEach(button => button.innerHTML = '<div><span>' + button.textContent.trim().split('').join('</span><span>') + '</span></div>');

  // 인사말카드 mode별 section
  var $section_image  = $("#insamalCardImage");
  var $section_custom = $("#insamalCardCustom");

  // 각 카드 모드에 따른 스크롤 이동 처리
  $.moveToCard = function(mode) {
    if(mode=='image')       var $section = $section_image;
    else if(mode=='custom') var $section = $section_custom;

    var sectionTop = $section.offset().top;

    $('html, body').animate({scrollTop:sectionTop}, 400);
  }

  // url 파라미터 replace해서 return 해준다
  $.replaceUrlParam = function (url, paramName, paramValue) {

    if (paramValue == null) {
       paramValue = '';
    }

    var pattern = new RegExp('\\b('+paramName+'=).*?(&|#|$)');
    if (url.search(pattern)>=0) {
      return url.replace(pattern,'$1' + encodeURI(paramValue) + '$2');
    }

    url = url.replace(/[?#]$/,'');
    return url + (url.indexOf('?')>0 ? '&' : '?') + paramName + '=' + encodeURI(paramValue);
  }

  $.setTextareaStyle = function() {
    // 현재 슬라이드 이미지에 선택한 폰트,사이즈,색상에 대한 클래스 정보를 hidden value에서 구해서 textarea에 적용.
    var fstyle = $("input:hidden[name='fstyle']").val();
    fstyle     = (fstyle!='') ? $.trim(fstyle.replace("font-family:","")) : '';
    var fsize  = $("input:hidden[name='fsize']").val();
    fsize      = (fsize!='') ? $.trim(fsize.replace('font-size:',"")) : '';
    var fcolor = $("input:hidden[name='fcolor']").val();
    fcolor     = (fcolor!='') ? fcolor.replace("background-color:","") : '';

    var aStyle = {};

    // 현재 적용되어있는 textarea style을 읽어오고.. 배열화 해서 다시 입혀준다.
    var textarea_style = $("textarea[name='content']").attr('style');
    if(textarea_style!='') {
      //console.log(textarea_style);
      var aActiveStyle = textarea_style.split(';');
      //console.log(aActiveStyle);

      $.each(aActiveStyle, function(k,v) {
        if(v!='') {
          var aTempStyle = v.split(':');
          aStyle[$.trim(aTempStyle['0'])] = aTempStyle['1'];
        }
      });

    }

    // 변경할 스타일로 변경
    if(fstyle!='') aStyle['font-family'] = fstyle;
    if(fsize!='')  aStyle['font-size']  = fsize;
    if(fcolor!='') aStyle['color'] = fcolor;

    // 다시 style 형태로 합체
    var aApplyStyle = $.map(aStyle, function(v,k) {
      return k+":"+v;
    });

    var applyStyle = aApplyStyle.join(";");

    $("textarea[name='content']").each(function() {
      $(this).attr('style', applyStyle);
    });
  }

  // 링크 타입별로 정보 가져오는 링크
  // #cardLink : body중간 영역버튼
  // #tabCardLink : 카드보내기/만들기 #탭 영역
  // #slideCardLink : 상단 슬라이드 영역
  // #topCardLink : 상단 메뉴 영역
  // #menuCardLink : 상단 '카드 선택하기 三'메뉴
  //$(document).on('click', "a#cardLink, #tabCardLink, #slideCardLink, #topCardLink, #menuCardLink", function() {
  $("a#cardLink, #tabCardLink, #slideCardLink, #topCardLink, #menuCardLink").on('click', function() {
    var $anchor = $(this);
    var type    = $anchor.data('type');
    var mode    = $anchor.data('mode');

    var anchor_id = $anchor.attr('id');

    // dropdown 메뉴 open(class) 숨김
    $('.dropdown').removeClass('open');

    $.popupClose();

    //console.log(type);

    //$.getCardData(type, mode);

    $.get('get_card_data.php', {"card_type":encodeURI(type), 'mode':mode})
      .done(function(data) {
        var data = $.trim(data);
        //console.log(data); return false;
        var aData = $.parseJSON(data);

        if(aData.resCode=='fail') alert(aData.resMsg);
        else {
          //alert('성공');
          //console.log(aData.resMsg);

          // 카드보내기
          if(aData.resMsg.mode=='image') {
            $section_custom.hide();

            // 카드 이미지 - pc버전 replace
            $('#insamalCardImagePC').html(aData.resMsg.image.PC);

            // 카드 이미지 - pc버전 slide replace
            $('#insamalCardImagePCSlide').html(aData.resMsg.image.PC_SLIDE);

            // 카드 이미지 - mo버전 replace
            $('#insamalCardImageMO').html(aData.resMsg.image.MO);

            // 카드만들기 hide, 카드보내기 show
            $section_image.show();

            var swiperSendM = new Swiper('.card-send-slideM', sendSlideMOptions);

          }
          // 카드만들기
          else if(aData.resMsg.mode=='custom') {
            $section_image.hide();

            // 카드 선택리스트
            $('#insamalSelectCard').html(aData.resMsg.image.SELECT_CARD);

            // 카드 문구
            $('#insamalContent').html(aData.resMsg.content);

            // 슬라이드 카드
            $('#insamalSlideCard').html(aData.resMsg.image.CUSTOM_CARD);

            $.setTextareaStyle();

            $section_custom.show();

            var swiperMake = new Swiper('.card-make-slide', makeSlideOptions);

          }

          // 버튼 활성화
          //  - 카드이미지 별 탭메뉴, type에 맞는 버튼 활성화 처리
          $("li.ft-pre").each(function() {
            if($(this).attr('id')=='tabCardLink') {
              $(this).removeClass('active');
              if($(this).data('type')==type) $(this).addClass('active');
            }
          });

          $("a").each(function() {
            var a_id = $(this).attr('id');

            // body중간/상단메뉴 영역버튼의 data-type 속성을 변경해줘야 한다.
            if(a_id=='topCardLink' || a_id=='cardLink') {
              $(this).data('type', type);
              $(this).attr('data-type', type);

              // mode 값을 확인하여 mode에 맞는 버튼 활성화 처리
              $(this).removeClass('active');
              if($(this).data('mode')==mode) $(this).addClass('active');
            }
            // 메뉴 영역버튼의 data-mode 속성을 변경해줘야 한다.
            else if(a_id=='menuCardLink') {
              $(this).data('mode', mode);
              $(this).attr('data-mode', mode);
            }
          });

          // 공유/다운로드 버튼은 data-type만 변경해주면 된다.
          $("button[name='btnSend']").each(function() {
            $(this).data('type', type);
            $(this).attr('data-type', type);
          });

          // 카드 보내기/만들기 섹션으로 스크롤 이동
          $.moveToCard(mode);

          // 주소창 url 변경 처리
          if(typeof(history.pushState) == 'function') {
            var url = window.location.href;

            var new_url = $.replaceUrlParam(url, 'card_type', type);
            new_url = $.replaceUrlParam(new_url, 'mode', mode);
            //console.log(new_url);

            //페이지 갱신 실행!
            history.pushState(null, null, new_url);
          }

        }
    });

    return false;

  });

  // 카드만들기, 카드 선택 시 슬라이드 move 이동
  $(document).on('click', 'li#slideMakePagination', function() {
    var index = $(this).data('index');

    if(swiperMake) swiperMake.slideTo(index);
    else {
      var swiperMake = new Swiper('.card-make-slide', makeSlideOptions);
      swiperMake.slideTo(index);
    }
  });

  // 카드만들기, 카드 문구 선택
  $(document).on('click', "input:radio[name='cardText']", function() {
    var rChk = $.chkLoginCard();
    if(rChk===false) return false;

    var $rdo = $(this);
    var val = $rdo.data('text');

    // 슬라이드 카드 내에 textarea들 전부 변경
    $("textarea[name='content']").each(function() {
      $(this).val(val);
    });
  });

  // 카드만들기, 폰트, 사이즈, 색상 선택 레이터 창 띄우기
  $("#fstyle, #fsize, #fcolor").on('click', function() {
    var $btn = $(this);
    var id   = $btn.attr('id');

    var $layer = $("div."+id+"-select");
    if($layer.is(":visible")) $layer.hide();
    else                      $layer.show();

  });

  // 카드만들기, 폰트, 사이즈, 색상 선택하기!
  $(".fstyle-select button, .fsize-select button, .fcolor-select button").on('click', function() {
    var $btn = $(this);
    //console.log($btn.attr('class'));
    var btn_style = $btn.attr('style');
    var btn_val   = $btn.parent('div').siblings('button').attr('id');

    var btn_text  = $btn.text();

    $("input:hidden[name='"+btn_val+"']").val(btn_style);

    $.setTextareaStyle();

    $("div."+btn_val+"-select").hide();  // 선택한 레이어 닫기

    // 선택한 값을 active하게 표기해준다.
    if(btn_val=='fcolor') {
      $("button#"+btn_val).attr('class', 'dropbtn-color '+btn_text);
    }
    else {
      $("button#"+btn_val).text(btn_text);
    }

  });

  // textarea 클릭 시, 로그인 체크
  /* $(document).on('focus', "textarea", function() {
    var rChk = $.chkLoginCard();
    if(rChk===false) return false;
  });
*/
  //Reload swiper
  $(window).resize(function() {
     if(swiperSendM) swiperSendM.updateSize();
     if(swiperMake) swiperMake.updateSize();
  });
  $(window).on('load', function() {
     if(swiperSendM) swiperSendM.updateSize();
     if(swiperMake) swiperMake.updateSize();
  });


  // 카드 보내기/만들기 전송
  $("button[name='btnSend']").on('click', function() {
    var $btn = $(this);
    var share = $btn.data('share');
    var type  = $btn.data('type');
    var mode  = $btn.data('mode');

    var rChk = $.chkLoginCard();
    if(rChk===false) return false;

    var imgs_keyn = $("input:hidden[name='"+mode+"_keyn']").val();

    var dev = (isMobile==true) ? 'MOBILE' : 'PC';

    var req_url = '/z_n/event/insamal_card/set_card_data.php';
    var aReqParam = {};

    // 요청 parameter 구성
    aReqParam['card_type'] = type;
    aReqParam['mode']      = mode;
    aReqParam['imgs_keyn'] = imgs_keyn;
    aReqParam['method']    = share;
    aReqParam['dev']       = dev;

    // 카드 보내기
    if(mode=='custom') {
      var fstyle = $("input:hidden[name='fstyle']").val();
      fstyle     = (fstyle!='') ? $.trim(fstyle.replace("font-family:","")) : '';
      fstyle     = fstyle.replace(', serif', '');
      fstyle     = fstyle.replace(';', '');
      var fsize  = $("input:hidden[name='fsize']").val();
      fsize      = (fsize!='') ? $.trim(fsize.replace('font-size:',"")) : '';
      var fcolor = $("input:hidden[name='fcolor']").val();
      fcolor     = (fcolor!='') ? fcolor.replace("background-color:","") : '';

      aReqParam['fstyle'] = fstyle;
      aReqParam['fsize']  = fsize;
      aReqParam['fcolor'] = fcolor;

      // 문구 선택 값
      aReqParam['cont_keyn'] = $("input:radio[name='cardText']:checked").val();

      // active class 도 안되고, 뭐도 다 안되서.. textarea 돌면서 custom_keyn과 같은 이미지고유번호가 걸리면 siblings textarea 값을 가져온다.
      var content = '';
      $("#insamalSlideCard").find("img").each(function() {
        if($(this).data('keyn')==imgs_keyn) {
          content = $(this).siblings('textarea').val();
          return false;
        }
      });

      aReqParam['content'] = content;
    }

    $.post(req_url, aReqParam)
      .done(function(data) {
        var data = $.trim(data);
        //console.log(data);

        var aData = $.parseJSON(data);
        if(aData.resCode=='fail') alert(aData.resMsg);
        else {
          if(aData.resMsg.method=='download') {
            var req_url = '/z_n/event/insamal_card/yummy_card_data.php';
            hpc.location.href = req_url+'?send_keyn='+aData.resMsg.send_keyn;
          }
          else if(aData.resMsg.method=='kakao') {
            Kakao.Link.sendDefault({
              objectType: 'feed',
              content: {
                title: '예스폼 인사말 카드',
                //description: (aData.resMsg.content!='' && typeof aData.resMsg.content!=='undefined') ? aData.resMsg.content : '소중한 인연에게 보내는 따뜻한 마음과 정성을 담은 세상 하나뿐인 인사말입니다.',
                imageUrl: aData.resMsg.imgs_url,
                link: {
                  webUrl: aData.resMsg.imgs_url,
                  mobileWebUrl: aData.resMsg.imgs_url,
                },
              },
              buttons: [
                {
                  title: '인사말 카드 답장하기',
                  link: {
                    webUrl: 'https://www.yesform.com/z_n/event/insamal_card/',
                    mobileWebUrl: 'https://www.yesform.com/z_n/event/insamal_card/',
                  },
                },
              ]
            });
          }
        }
    });

    return false;
  });
});
