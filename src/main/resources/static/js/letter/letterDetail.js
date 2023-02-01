/**
 * 엽서 상세 페이지
 */
 
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
				
					"</p><div><span><input type='button' id='minus' value='-' disabled='disabled'><input style='text-align:center; width:30px' type='text' value='1' readonly='readonly'><input type='hidden' value='1' name='optionDtoList["+ count + "].option_quantity'><input type='button' id='plus' value='+'></span><span style='color:gray; font-weight:bold'>" + priceWithComma + "</span>원<input type='hidden' value='"+price+"' name='optionDtoList["+ count + "].option_price'><input type='hidden' value='"+price+"'><img src='/resources/image/letter/deleteBtn.JPG' class='deleteItem' type='button'><input type='hidden' value='"+name+"' name='optionDtoList["+ count + "].option_name'><input type='hidden' value='"+ img +"' name='optionDtoList["+ count + "].option_img'><span id='"+name+"'</div><br><br>");
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
	
	$('input[type="text"]').keydown(function() {
   		if (event.keyCode === 13) {
        	event.preventDefault();
        };
   });
	
})