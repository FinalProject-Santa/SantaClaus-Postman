<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@include file="../include/header.jsp"%>
<%@include file="../include/floatingMenu.jsp"%>
<link rel="stylesheet" href="/resources/css/customer/notice_detail.css">

<body>

<div class="inner">

	<div class="tapeparent">
	<img id="tape" src="../resources/image/customer/redtape.png">
	</div>

	<div class="tableparent">
	
	<table border="1">
		
		<tr>
		<td id="title">To. Santas</td>
		</tr>
		<tr>
		  <td><fmt:formatDate value="${dto.regdate}" pattern="yyyy.MM.dd"/></td>		
		</tr>
		<tr>
			<td>${dto.title }</td>
		</tr>
		<tr>
			<td><textarea rows="20" cols="90" readonly="readonly">${dto.content }</textarea>
			</td>
		</tr>
		<tr>
			<td><input type="button" value="<< Return To list"
				onclick="location.href='/customer/notice'"></td>
	</table>
	
	</div>>
</div>

	<%@include file="../include/footer.jsp"%>