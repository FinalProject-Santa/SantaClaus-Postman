<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

.content {
	display: grid;
	grid-template-columns: repeat(4, 1fr);
	column-gap: 30px;
	row-gap: 30px;
}
</style>
</head>
<body>
	<div class="title">
        <h2>주문서 작성</h2>
    </div>
    <form class="payment" method="post">
        <div class="orderList">
            <table border="1px">
                <tbody>
                <colgroup>
                    <col width="50"/>		
                    <col width="70"/>		
                    <col width="500"/>		
                    <col width="100"/>		
                    <col width="100"/>	
                    <col width="100"/>		
                    <col width="100"/>
                    <col width="100"/>		
                </colgroup>
                <tr>
                    <th><input type="checkbox"></th>
                    <th>구분</th>
                    <th>이미지</th>
                    <th>상품정보</th>
                    <th>판매가</th>
                    <th>수량</th>
                    <th>포인트</th>
                    <th>배송구분</th>
                    <th>합계</th>
                </tr>
                <tr>
                    <td><input type="checkbox"></td>
                    <td>엽서</td>
                    <td></td>
                    <td>
                        <p class="itemName">
                            [구슬톡]헤이타이거 스노우볼
                        </p>
                        <p class="blanks">
                            <span>아이 이름 : ${child_name }</span><br>
                            <span>거주지 : ${address }</span><br>
                            <span>PS 멘트 : ${ps }</span>
                        </p>
                    </td>
                    <td>9,900원</td>
                    <td>1</td>
                    <td>90원</td>
                    <td>기본배송</td>
                    <td>9,900원</td>
                </tr>
                <c:forEach var="list" >
	                <tr>
	                    <td><input type="checkbox"></td>
	                    <td>옵션</td>
	                    <td></td>
	                    <td>
	                        <p class="itemName">
	                            [구슬톡]헤이타이거 스노우볼
	                        </p>
	                        <p class="blanks">
	                            <span>아이 이름 : ${child_name }</span><br>
	                            <span>거주지 : ${address }</span><br>
	                            <span>PS 멘트 : ${ps }</span>
	                        </p>
	                    </td>
	                    <td>9,900원</td>
	                    <td>1</td>
	                    <td>90원</td>
	                    <td>기본배송</td>
	                    <td>9,900원</td>
	                </tr>
                </c:forEach>
                <tr>
                    <td colspan="8">합계 : 9,900원</td>
                </tr>
                </tbody>
            </table>
        </div>
        <div class="title">
            <h3>배송 정보</h3>
        </div>
        <div class="shippingInfo">
            <table border="1">
                <tbody>
                    <tr>
                        <th>배송지 선택</th>
                        <td>
                            <div class="address">
                                <input type="radio">
                                <label>회원 정보와 동일</label>&nbsp;
                                <input type="radio">
                                <label>새로운 배송지</label>&nbsp;&nbsp;
                                <span>
                                    최근배송지 :
                                    <input type="radio">
                                    <label>우리집</label>&nbsp;
                                    <input type="radio">
                                    <label>친구집</label>
                                </span>
                            </div>
                            
                        </td>
                    </tr>
                    <tr>
                        <th>받으시는 분 <img src="./image/important.JPG" style="width: 10px;"></th>
                        <td><input type="text"></td>
                    </tr>
                    <tr>
                        <th>주소 <img src="./image/important.JPG" style="width: 10px;"></th>
                        <td>
                            <input type="text" disabled="disabled">
                            <input type="button" value="우편번호"><br>
                            <input type="text">&nbsp;
                            <label>기본 주소</label><br>
                            <input type="text">&nbsp;
                            <label>나머지 주소</label>
                        </td>
                    </tr>
                    <tr>
                        <th>휴대전화 <img src="./image/important.JPG" style="width: 10px;"></th>
                        <td><input type="text">&nbsp;-<input type="text">&nbsp;-<input type="text">&nbsp;</td>
                    </tr>
                    <tr>
                        <th>이메일 <img src="./image/important.JPG" style="width: 10px;"></th>
                        <td>
                            <input type="text">&nbsp;@&nbsp;<input type="text">&nbsp;
                            <select>
                                <option value="이메일 선택">-이메일 선택-</option>
                                <option value="naver.com">naver.com</option>
                                <option value="nate.com">nate.com</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                            <th>배송메세지</th>
                            <td><textarea></textarea></td>
                    </tr>
                    <tr>
                        <th>배송일</th>
                        <td>
                            <input type="date"><br>
                            <span>* 배송일 선택시 예약배송으로 취급되어 해당 일자에 배송됩니다.</span>
                        </td>
                </tr>
                </tbody>
            </table>
        </div>
        <div class="title">
            <h3>결제 금액</h3>
        </div>
        <div class="paymentInfo">
            <table border="1">
                <tbody>
                    <colgroup>
                        <col width="300"/>		
                        <col width="300"/>		
                        <col width="300"/>
                    </colgroup>
                    <tr>
                        <th>총 주문 금액</th>
                        <th>배송비</th>
                        <th>총 결제 금액</th>
                    </tr>
                    <tr>
                        <td>30,000원</td>
                        <td>0원</td>
                        <td>30,000원</td>
                    </tr>
                    <tr>
                        <th>포인트</th>
                        <td colspan="2">
                            <p><input type="text">원(사용가능 포인트 : <span id="mypoint">pt</span>)</p>
                            <ul>
                                <li>포인트는 1포인트 이상일 때 결제가 가능합니다.</li>
                                <li>최대 사용금액은 제한이 없습니다.</li>
                            </ul>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="title">
            <h3>결제 수단</h3>
        </div>
        <div class="paymentArea" style="display: flex;">     
            <div class="paymentMethod">
                <span>
                    <input type="radio">
                    <label>카드결제</label>
                </span>
                <span>
                    <input type="radio">
                    <label>실시간 계좌이체</label>
                </span>
                <span>
                    <input type="radio">
                    <label>휴대폰 결제</label>
                </span>
                <span>
                    <input type="radio">
                    <label>무통장 입금</label>
                </span>
            </div>
            <div class="paymentArea" style="margin-left: 100px;">
                <h4>
                    <strong id="paymentName">무통장 입금</strong>
                    <span>최종결제 금액</span>
                </h4>
                <p class="price">
                    <span>30,000원</span>
                </p>
                <p class="agreement">
                    <input type="checkbox">
                    <label>결제정보를 확인하였으며, 구매진행에 동의합니다.</label>
                </p>
                <p class="payBtn">
                    <input type="button" value="결제하기">
                </p>
                <p class="point">
                    <strong>총 적립예정금액</strong>
                    <span>370원</span>
                </p>
            </div>
        </div>
    </form>
</body>
</html>