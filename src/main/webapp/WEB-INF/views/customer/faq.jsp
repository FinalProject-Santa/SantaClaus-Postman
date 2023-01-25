<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
    <link rel="stylesheet" href="/resources/css/customer/faq.css">

    <body>
    

   	<%@include file="../include/header.jsp" %>
	<%@include file="../include/floatingMenu.jsp" %>
    
   <div class="wrapperAll">
        
        <div class=custumer_menu>
        <h1>고객센터</h1>
    	<button onclick="location.href='notice';">공지사항</button>
  	 	<button onclick="location.href='qnalist';">Q&A</button>
   		 <button onclick="location.href='faq';">FAQ</button>
  	 	</div>
  	 
        <div class="faq">
            <input type="checkbox"id="answer01">
            <label for="answer01">배송은 어떻게 되나요?<em></em></label>
            <div><p>모든 엽서와 상품은 우체국 택배로 배송되며 12월 22일에 1차배송, 23일에 2차 배송되어 <br>각 크리스마스 이브와 크리스마스 당일에 받아보실 수 있습니다.</p></div>
            <input type="checkbox" id="answer02">
            <label for="answer02">크리스마스에만 운영되나요? 다른날에도 쓰고싶어요<em></em></label>
            <div><p>저희 Dear.santa는 크리스마스 시즌에만 오픈되는 서비스입니다🎅 <br>매년 11월31일에서 12월로 넘어가는 자정에 오픈되며
            1월31일까지 운영됩니다! </p></div>
            <input type="checkbox" id="answer03">
            <label for="answer03">포인트는 어떻게 사용하나요? 안쓰면 소멸되나요?<em></em></label>
            <div><p>계정에 적립된 포인트는 엽서와 상품 구매시 사용 가능하며, <br>사이트 운영기간인 1월31일 일괄 소멸됩니다.</p></div>
            <input type="checkbox" id="answer04">
            <label for="answer04">칭찬일기를 계속 쓰고싶은데, 운영을 계속 하면 안되나요?<em></em></label>
            <div><p>산타할아버지와 협의 해보겠습니다.😊</p></div>
      		<input type="checkbox" id="answer05">
            <label for="answer05">환불을 하고 싶습니다.<em></em></label>
            <div><p>dear.santa에서 판매되는 모든 상품은 커스텀 주문제작으로 이루어져 환불이 어렵습니다.<br>
            신중한 구매 부탁드립니다! </p></div>
       
        </div>
        
        </div>
        
        <%@include file="../include/footer.jsp" %>
