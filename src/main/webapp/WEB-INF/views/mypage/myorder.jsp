<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>주문조회</title>
    <link rel="stylesheet" href="/resources/css/mypage/myorder.css">

</head>
<body>
    <div id="wrapper">
        <nav>
        <h1>주문조회</h1>
            <p class="box1">주문내역조회</p>
            <hr class="h1">
            <div class="box2">
                <b class="box3">
                    <span onclick="dateSub(1)">오늘</span>
                    <span onclick="dateSub(7)">1주일</span>
                    <span onclick="dateSub(30)">1개월</span>
                    <span onclick="dateSub(90)">3개월</span>
                </b>
                <input type="date" id="Date1" name="first">
                <strong>~</strong>
                <input type="date" id="Date2" name="second">
                <input type="button" value="조회">
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
                                        <td>${orderdate}<p>[${orderno}]</p></td>
                                        <td>${template_image}</td>
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
	    var now_utc = Date.now()
	    var timeOff = new Date().getTimezoneOffset()*60000;
	    var today = new Date(now_utc-timeOff).toISOString().split("T")[0];
	    var date1 = document.getElementById("Date1").value;
	    document.getElementById("Date1").setAttribute("max", today);
	    document.getElementById("Date2").setAttribute("max", today);
		console.log(date1);
	    document.getElementById("Date2").setAttribute("min", date1);
		
	    
    </script>
</body>
</html>