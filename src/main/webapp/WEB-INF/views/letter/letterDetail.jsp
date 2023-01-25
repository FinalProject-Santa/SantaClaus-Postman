<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
.shopList{
	overflow: scroll;
    overflow-x: hidden;
}
input::-webkit-outer-spin-button,
input::-webkit-inner-spin-button {
  -webkit-appearance: none;
  margin: 0;
}

</style>
<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.9.0/jquery.js"></script>
<script>
$(function(){
	
	// 옵션 상품 클릭 시 주문창에 담기
	var count = 0;
	$(".optionItem").on("click", function(){
		var img = $(this).children("img").attr('src');
		var name = $(this).children("p").html();
		var price = $(this).children("p").next().children("input").val();
		var priceWithComma = parseInt(price).toLocaleString();
		var shopList = $(".shopList");
		
		if(document.getElementById(name)){
			alert("이미 선택하신 상품입니다.\n추가 구매를 원하실 경우 + 버튼을 눌러주세요~");
		}else{
			shopList.append("<div class='selectedItem'><p>" + name + 
				
					"</p><div><span><input type='button' id='minus' value='-' disabled='disabled'><input type='text' value='1' readonly='readonly'><input type='hidden' value='1' name='optionDtoList["+ count + "].option_quantity'><input type='button' id='plus' value='+'></span><span>" + priceWithComma + "</span>원<input type='hidden' value='"+price+"' name='optionDtoList["+ count + "].option_price'><input type='hidden' value='"+price+"'><input class='deleteItem' type='button' value='X'><input type='hidden' value='"+name+"' name='optionDtoList["+ count + "].option_name'><input type='hidden' value='"+ img +"' name='optionDtoList["+ count + "].option_img'><span id='"+name+"'</div>");
			count ++;
		}
	});
	
	var num = 0;
	var price = 0;
	var priceWithComma = 0;
	
	// 수량 버튼 : -
 	$(document).on("click","#minus",function(event){
 		num = parseInt($(this).next().val()) - 1;
		price = parseInt($(this).parent("span").next().next().next().val());
		price = price * num;
		priceWithComma = parseInt(price).toLocaleString();
		
		$(this).next().attr("value", num);
		$(this).next().next().attr("value", num);
		$(this).parent("span").next().html(priceWithComma);
		$(this).parent("span").next().next().attr("value", price);
		
				
    });
	
 	// 수량 버튼 : +
 	$(document).on("click","#plus",function(event){
		$(this).prev().prev().prev().attr("disabled", false);
		
		num = parseInt($(this).prev().val()) + 1;
		price = parseInt($(this).parent("span").next().next().next().val());
		price = price * num;
		priceWithComma = parseInt(price).toLocaleString();
		
		$(this).prev().prev().attr("value", num);
		$(this).prev().attr("value", num);
		$(this).parent("span").next().html(priceWithComma);
		$(this).parent("span").next().next().attr("value", price);
    });
	
	// X 버튼 클릭 시 선택한 옵션 삭제
 	$(document).on("click",".deleteItem",function(event){
		$(this).parent("div").parent("div").remove();
    });
	
	$("#buy").click(function(){
		if(count==0){
			if(confirm("옵션 상품을 선택하지 않으셨네요.\n결제 페이지로 넘어갈까요?")){
				return true;				
			}else{
				return false;
			}
		}
	});
	
	$("#shopCart").click(function(){
		if(count==0){
			if(confirm("옵션 상품을 선택하지 않으셨네요.\n엽서 상품만 장바구니에 담을까요?")){
				return true;				
			}else{
				return false;
			}
		}
	});
	
})
</script>
</head>
<body>
	<h2>엽서 상세 페이지</h2>
	<div class="wrapper">
	<form method='post'>
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
			<span>
				<fmt:formatNumber type="number" value="${letterPrice }"/>원
			</span>
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
					<input type="submit" formaction="/cart/cartpage" id="shopCart" value="장바구니">
					<input type="submit" formaction="/order/orderForm" id="buy" value="구매하기">
				</div>
			</div>
		</aside>
	</form>
		<div class="optionArea">
			<c:forEach var="list" items="${optionList }">
				<div class="optionItem">
					<img src="${list.option_img }">
					<p id="name">${list.option_name }</p>
					<p id="price">
						<span><fmt:formatNumber type="number" value="${list.option_price }"/>원</span>
                   		<input type='hidden' value="${list.option_price }"/>
               		</p>
				</div>
			</c:forEach>
		</div>
	</div>
</body>
</html>