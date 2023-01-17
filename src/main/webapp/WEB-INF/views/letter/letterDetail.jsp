<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body {
	text-align: center;
	background-color: pink;
	width: 1500px;
}

.wapper {
	width: 100%;
	text-align: left;
	min-height: 300px;
	margin: 0 auto;
}
aside, section {
	border: 1px solid #999;
	margin: 5px;
	padding: 10px;
	float: left;
	height: 800px;
}
section {
	background-color: green;	
	width: 900px;
}
aside {
	background-color: goldenrod;
	width: 400px; 
}
section>div {
	width: 90%;
	margin: 20px;
	background-color: #999;
}

.shopList{
	width:350px;
	height:500px;
	border: 1px solid;
}
.payBtn>input{
	width:150px;
	height:40px;
}
.optionArea{
	display: grid;
	grid-template-columns: repeat(4, 1fr);
	column-gap: 30px;
	row-gap: 30px;
}
</style>
<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.9.0/jquery.js"></script>
<script>
$(function(){
	var count = 0;
	$(".optionItem").on("click", function(){
		var img = $(this).children("img").attr('src');
		var name = $(this).children("p").html();
		var price = $(this).children("p").next().html();
		price = price.slice(0, price.length-1);
		var shopList = $(".shopList");
		shopList.append("<div class='selectedItem'><p class='selectedItem_name'>" + name + 
				"</p><div class='selectedItem_setting'><span class='selectedItem_counter'><input type='button' value='-'></button><input type='number' min='1' max='99'><input type='button' value='+'></span><span class='selectedItem_price'>" + price + "원</span><input class='deleteItem' type='button' value='X'><input type='hidden' value='"+name+"' name='optionDtoList["+ count + "].option_name'><input type='hidden' value='"+price+"' name='optionDtoList["+ count + "].option_price'><input type='hidden' value='"+ img +"' name='optionDtoList["+ count + "].option_img'></div>");
		count ++;
	});
	
	
	$(".deleteItem").on("click", function(){
		alert("test");
		$(this).parent("div").parent("div").remove();
		/* if (length==1){
	         $('.btn-del').css('display','none')
	     }else{
	         $('.btn-del').css('display','inline-block')
	     }
		alert('test'); */
	});
	
	/* $("#shopCart").on("click", function(){
		var nameList = new Array();
		var priceList = new Array();
		
		$(".selectedItem").each(function(i){
			var name = $(this).children('p').html();
			var price = $(this).children('div').children('span').next().html();
			
			nameList.push(name);
			priceList.push(price);
		})
			
	}); */
	
	$("#userPostcode").click(function(){
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
	});
	
	$("#buy").click(function(){
		if(count==0){
			alert("상품을 선택해 주세요.");
			/* onclick="return false" */
			/* $(this).attr("onclick", "return false"); */
		}
	});
	
})
</script>
</head>
<body>
	<h2>엽서 상세 페이지</h2>
	<div class="wrapper">
	<form action='/order/orderForm' method='post'>
		<section>
			<div class="letter">
				<div class="letterImg">
					<img src="${letterImg }">
					<input type="hidden" name="letter_img" value="${letterImg }">
				</div>
				<div class="contentImg">
					<img src="/resources/image/letter/content.jpg">
				</div>
			</div>
		</section>
		<aside>
			<h2>🎅${letterName }</h2>
			<span>${letterPrice }원</span>
			<input type="hidden" name="letter_name" value="${letterName}">
			<input type="hidden" name="letter_price" value="${letterPrice}">
			<div class="letterContent">
				<span>편지 내용을 채워주세요</span>
				<table border="1">
					<tr>
						<th>아이 이름</th>
						<td><input type="text" name="child_name" placeholder="아이 이름"><!-- required oninvalid="this.setCustomValidity('🎅아이 이름을 입력해 주세요🎅')" --></td>
					</tr>
					<tr>
						<th>거주지</th>
						<td><input type="text" name="address" placeholder="전달받을 거주지"> <!-- required oninvalid="this.setCustomValidity('🎅전달 받으실 위치를 입력해 주세요🎅')"> --></td>
					</tr>
					<tr>
						<th>P.S</th>
						<td><input type="text" name="ps" placeholder="아이에게 하고 싶은 말을 적어주세요"> <!-- required oninvalid="this.setCustomValidity('🎅아이에게 하고 싶은 말을 적어주세요🎅')"> --></td>
					</tr>
				</table>
			</div>
			<div class="payment">
				<div class="shopList">
					<span></span>
				</div>
				<div class="payBtn">
					<input type="button" id="shopCart" value="장바구니">
					<input type="submit" id="buy" value="구매하기">
				</div>
			</div>
		</aside>
	</form>
		<div class="optionArea">
			<c:forEach var="list" items="${optionList }">
				<div class="optionItem">
					<img src="${list.option_img }">
					<p id="name">${list.option_name }</p>
					<p id="price">${list.option_price }원</p>
				</div>
			</c:forEach>
		</div>
	</div>
</body>
</html>