<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>주문조회</title>
   	<link rel="stylesheet" href="/resources/css/mypage/myorder.css">
   	<link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css"/>
	<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
    <script src="http://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
	<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/i18n/datepicker-ko.js"></script>
</head>
<body>
    <div id="wrapper">
        <nav>
        <h1>주문조회</h1>
            <p class="box1">주문내역조회</p>
            <hr class="h1">
            <div class="box2">
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
                <input type="button" value="조회" onclick="showList();">
            </div>
        </nav>
        <section>
            <div id="orderlist">
                <table>
                    <colgroup>
                        <col width="150">
                        <col width="150">
                        <col width="320">
                        <col width="150">
                        <col width="150">
                        <col width="150">
                    </colgroup>
                    <tr>
                        <th>주문일자<br>[주문번호]</th>
                        <th>이미지</th>
                        <th>상품정보</th>
                        <th>주문금액<br><span style="font-size: 10pt;">(배송비 포함)</span></th>
                        <th>주문처리상태</th>
                        <th>리뷰</th>
                    </tr>
                    <c:choose>
                            <c:when test="${empty list}">
                                <tr>
                                    <td colspan="6" align="center">
                                        주문 내역이 아직 없네요.<br>
                                        아이에게 산타를 선물해 보세요!
                                    </td>
                                </tr>
                            </c:when>
                            <c:otherwise>
                                <c:forEach items="${list}" var="dto">
                                    <tr>
                                        <td>${dto.order_date}<p>[${dto.order_no}]</p></td>
                                        <td>${template_image}<hr>${option_image}</td>
                                        <td>${template_name}<hr>${option_name}</td>
                                        <td>{판매가-배송비}</td>
                                        <td>배송완료<br><input type="button" value="배송조회"></td>
                                        <td><input type="button" value="리뷰작성"></td>
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
    <script type="text/javascript">
	    
	    document.getElementById("orderlist").style.display="none";
	    
	    function showList(){
	    	document.getElementById("orderlist").style.display="block";
	    }

	    $(document).ready(function() {

            //datepicker 한국어로 사용하기 위한 언어설정
            $.datepicker.setDefaults($.datepicker.regional['ko']);     
        
            // Datepicker            
            $(".datepicker").datepicker({
                showButtonPanel: true,
                dateFormat: "yy-mm-dd",
                onClose : function ( selectedDate ) {
                
                    var eleId = $(this).attr("id");
                    var optionName = "";

                    if(eleId.indexOf("StartDate") > 0) {
                        eleId = eleId.replace("StartDate", "EndDate");
                        optionName = "minDate";
                    } else {
                        eleId = eleId.replace("EndDate", "StartDate");
                        optionName = "maxDate";
                    }

                    $("#"+eleId).datepicker( "option", optionName, selectedDate );        
                    $(".searchDate").find(".chkbox2").removeClass("on"); 
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

            $(".dateclick").dateclick();    // DateClick
            $(".searchDate").schDate();        // searchDate
            
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
            $("#searchEndDate").datepicker( "option", "minDate", startDate );
            
            // 시작일은 종료일 이후 날짜 선택하지 못하도록 비활성화
            $("#searchStartDate").datepicker( "option", "maxDate", endDate );
            
        }

	    
    </script>
</body>
</html>