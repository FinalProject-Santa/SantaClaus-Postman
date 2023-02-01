<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>주문조회</title>
   	<link rel="stylesheet" href="/resources/css/mypage/myorder.css">
   	<link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css"/>
	<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
	    <script type="text/javascript">
	    
	    $(document).ready(function() {
			$("#orderlist").hide();
			
	    	$("#selectbtn").click(function(){
	    		$("#selectOrder").submit();
	    		$("#orderlist").show();
	    		
   			});

	    	// Datepicker            
            $(".datepicker").datepicker({
                showButtonPanel: true,
                dateFormat: "yy-mm-dd",
                language: "kr",
                onClose : function ( selectedDate ) {
                
                    var eleId = $(this).attr("id");
                    var optionName = "";
                    var today = new Date();

                    $("#searchStartDate").datepicker( "option", "maxDate", today );
                    $("#searchEndDate").datepicker( "option", "maxDate", today );
                     
                    if(eleId.indexOf("StartDate") > 0) {
                        eleId = eleId.replace("StartDate", "EndDate");
                        optionName = "minDate";
                    } else {
                        eleId = eleId.replace("EndDate", "StartDate");
                        optionName = "maxDate";
                    }

                    $("#"+eleId).datepicker( "option", optionName, selectedDate );        
                    $(".searchDate").find(".chkbox2").removeClass("on"); 
                },
                onSelect: function(dateText, inst){
                	var selectedDate = $(this).val();
                }
				            
            
            }); 
	
            //시작일.
            /*$('#searchStartDate').datepicker("option","onClose", function( selectedDate ) {    
                // 시작일 datepicker가 닫힐때
                // 종료일의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
                $("#searchEndDate").datepicker( "option", "minDate", selectedDate );
                $(".searchDate").find(".chkbox2").removeClass("on");
            });
            */

            //종료일.
            /*$('#searchEndDate').datepicker("option","onClose", function( selectedDate ) {    
                // 종료일 datepicker가 닫힐때
                // 시작일의 선택할수있는 최대 날짜(maxDate)를 선택한 종료일로 지정 
                $("#searchStartDate").datepicker( "option", "maxDate", selectedDate );
                $(".searchDate").find(".chkbox2").removeClass("on");
            });
            */

//             ****여기 해제하면 플루팅이랑 푸터와 충돌?? 에러남 근데 기능은 잘 됨 
//             $(".dateclick").dateclick();    // DateClick
//             $(".searchDate").schDate();        // searchDate
            
        });

        // Search Date
        jQuery.fn.schDate = function(){
            var $obj = $(this);
            var $chk = $obj.find("input[type=radio]");
            $chk.click(function(){                
                $('input:not(:checked)').parent(".chkbox2").removeClass("on");
                $('input:checked').parent(".chkbox2").addClass("on");                    
            });
        };

        // DateClick
        jQuery.fn.dateclick = function(){
            var $obj = $(this);
            $obj.click(function(){
                $(this).parent().find("input").focus();
            });
        }    

        
        function setSearchDate(start){

            var num = start.substring(0,1);
            var str = start.substring(1,2);

            var today = new Date();

            //var year = today.getFullYear();
            //var month = today.getMonth() + 1;
            //var day = today.getDate();
            
            var endDate = $.datepicker.formatDate('yy-mm-dd', today);
            $('#searchEndDate').val(endDate);

            if(str == 'd'){
                today.setDate(today.getDate() - num);
            }else if (str == 'w'){
                today.setDate(today.getDate() - (num*7));
            }else if (str == 'm'){
                today.setMonth(today.getMonth() - num);
                today.setDate(today.getDate() + 1);
            }
			
            var startDate = $.datepicker.formatDate('yy-mm-dd', today);
            $('#searchStartDate').val(startDate);
                    
            // 종료일은 시작일 이전 날짜 선택하지 못하도록 비활성화
            //$("#searchEndDate").datepicker( "option", "minDate", startDate );
            
            // 시작일은 종료일 이후 날짜 선택하지 못하도록 비활성화
            //$("#searchStartDate").datepicker( "option", "maxDate", endDate );
        }
    </script>
</head>
<body>
	<!-- header -->
	<%@include file="../include/header.jsp" %>
	<%@include file="../include/floatingMenu.jsp" %>
	
    <div id="wrapper">
        <nav>
            <p class="box1">주문내역조회</p>
            <hr class="hr">
            <div action="/mypage/selectOrder" method="post" id="selectOrder" class="box2">
            <!-- div > form으로 변경하기 -->
                <ul class="searchDate">
                    <li>
                        <span class="chkbox2">
                            <input type="radio" name="dateType" id="dateType1" onclick="setSearchDate('0d')"/>
                            <label for="dateType1">오늘</label>
                        </span>
                    </li>
                    <li>
                        <span class="chkbox2">
                            <input type="radio" name="dateType" id="dateType3" onclick="setSearchDate('1w')"/>
                            <label for="dateType3">1주일</label>
                        </span>
                    </li>
                    <li>
                        <span class="chkbox2">
                            <input type="radio" name="dateType" id="dateType5" onclick="setSearchDate('1m')"/>
                            <label for="dateType5">1개월</label>
                        </span>
                    </li>
                    <li>
                        <span class="chkbox2">
                            <input type="radio" name="dateType" id="dateType6" onclick="setSearchDate('3m')"/>
                            <label for="dateType6">3개월</label>
                        </span>
                    </li>
                </ul>
                
                <!-- 시작일 -->
                <span class="dset">
                    <input type="text" class="datepicker inpType" name="searchStartDate" id="searchStartDate" placeholder="조회 시작 날짜">
                </span>
                <span class="demi">~</span>
                <!-- 종료일 -->
                <span class="dset">
                    <input type="text" class="datepicker inpType" name="searchEndDate" id="searchEndDate" placeholder="조회 끝 날짜">
                </span>
                <input type="button" id="selectbtn" value="조회">
            </div>
        </nav>
        <section>
            <div id="orderlist">
                <table>
                    <colgroup>
                        <col width="150">
                        <col width="200">
                        <col width="400">
                        <col width="150">
                        <col width="150">
                    </colgroup>
                    <tr>
                        <th>주문일자<br>[주문번호]</th>
                        <th>이미지</th>
                        <th>상품정보</th>
                        <th>주문금액<br><span style="font-size: 10pt;">(배송비 포함)</span></th>
                        <th>리뷰</th>
                    </tr>
                    <c:choose>
                        <c:when test="${empty orderdtolist}">
                             <tr>
                                 <td colspan="5" align="center">
                                     주문 내역이 아직 없네요.<br>
                                     아이에게 산타와의 추억을 선물해 보세요!
                                 </td>
                             </tr>
                        </c:when>
                        <c:otherwise>
                             <c:forEach items="${orderdtolist}" var="orderdtolist">
                                 <tr>
                                     <td><fmt:formatDate pattern="yyyy-MM-dd" value="${orderdtolist.order_date}"/>
                                    	 <p id="orderdate">[${orderdtolist.order_no}]</p></td>
                                     <td>${letter_img}<hr>${option_img}</td>
                                     <td>${orderdtolist.letter_name}<hr>${orderdtolist.option_name}</td>
                                     <td><fmt:formatNumber type="number" value="${orderdtolist.total_price }"/>원</td>
                                     <td><input type="button" value="리뷰작성" id="reviewbtn" 
                                     onclick="location.href='/review/reviewinsertform?order_no=${orderdtolist.order_no}'">
                                     <input type="text" value="${review_noList }">
                                     </td>
                                     <!-- 작성완료 시 status변경 >review_no!=null && >0 -> 리뷰작성버튼 hide(), .append(button[disable]"작성 완료") -->
                                 </tr>
                             </c:forEach>
                       	</c:otherwise>
                    </c:choose>
                </table>
            </div>
        </section>
        <div>
            <ul>
                <li style="color: gray; font-size: small;">기본적으로 최근 3개월간의 자료가 조회되며, 기간 검색 시 지난 주문내역을 조회하실 수 있습니다.</li>
                <li style="color: red; font-size: small;">주문 제작 상품으로 취소/교환/반품은 불가능합니다.</li>
            </ul>
        </div>
    </div>

    
	<!-- footer -->
	<%@include file="../include/footer.jsp" %>
	
    
    <script src="http://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
	<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/i18n/datepicker-ko.js"></script>
</body>

</html>