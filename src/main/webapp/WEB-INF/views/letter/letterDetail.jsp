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
	$(".optionItem").on("click", function(){
		var img = $(this).children("img").attr('src');
		var name = $(this).children("p").html();
		var price = $(this).children("p").next().html();
		
		var shopList = $(".shopList");
		shopList.append("<div class='selectedItem'><p class='selectedItem_name'>" + name + 
				"</p><div class='selectedItem_setting'><span class='selectedItem_counter'><input type='button' value='-'></button><input type='number' min='1' max='99'><input type='button' value='+'></span><span class='selectedItem_price'>" + price + "</span><input class='deleteItem' type='button' value='X'><input type='hidden' value='"+name+"' name='option_name'><input type='hidden' value='"+price+"' name='option_price'><input type='hidden' value='"+ img +"' name='option_img'></div>");
	});
	
	
	$(".deleteItem").on("click", function(){
		/* var t = $(this).parent(); */
		alert('test');
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
				</div>
				<div class="contentImg">
					<img src="/resources/image/letter/content.jpg">
				</div>
			</div>
		</section>
		<aside>
			<h2>🎅${letterName }</h2>
			<span>${letterPrice }원</span>
			<div class="letterContent">
				<span>편지 내용을 채워주세요</span>
				<table border="1">
					<tr>
						<th>아이 이름</th>
						<td><input type="text" name="child_name" placeholder="아이 이름"></td>
					</tr>
					<tr>
						<th>거주지</th>
						<td><input type="text" name="address" placeholder="전달받을 거주지"></td>
					</tr>
					<tr>
						<th>P.S</th>
						<td><input type="text" name="ps" placeholder="아이에게 하고 싶은 말을 적어주세요"></td>
					</tr>
				</table>
			</div>
			<div class="payment">
				<div class="shopList">
					<span></span>
				</div>
				<div class="payBtn">
					<input type="button" id="shopCart" value="장바구니">
					<input type="submit" id="pay" value="구매하기">
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