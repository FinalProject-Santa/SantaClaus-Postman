<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<style>
* {
	padding: 0;
	margin: 0;
}

body {
	font-size: 14px;
	font-family: 'Roboto', sans-serif;
	width: 2000px;
}

button {
	border: none;
}
</style>
</head>
<body>
<c:choose>
		<c:if test="${empty member}">
			<li><a href="../member/logout">·Î±×¾Æ¿ô</a></li>
		</c:when>
		<c:otherwise>
			<li><a href="../member/login">·Î±×ÀÎ</a></li>
		</c:otherwise>
</c:choose>
	<h2>¿±¼­ ÅÛÇÃ¸´ ¸®½ºÆ®</h2>
	<div class="content" style="display: flex;">
		<div class="templateList" style="display: flex;">
			<button>
				<img src="./image/arrow1.JPG" style="width: 50px;">
			</button>
			<div class="card1">
				<img src="./image/card1.JPG">
				<input type="checkbox">
			</div>
			<div class="card2">
				<img src="./image/card2.JPG">
				<input type="checkbox">
			</div>
			<div class="card3">
				<img src="./image/card3.JPG">
				<input type="checkbox">
			</div>
			<div class="card4">
				<img src="./image/card4.JPG">
				<input type="checkbox">
			</div>
			<button>
				<img src="./image/arrow2.JPG" style="width: 50px;">
			</button>
		</div>
		<div class="pay">
			<table border="1">
				<tbody>
					<tr>
						<th>ÅÛÇÃ¸´¸í</th>
						<td>»êÅ¸´Â ÈûµéÁö ¾Ê¾Æ</td>
					</tr>
					<tr>
						<th colspan="2">ÅÛÇÃ¸´ ºóÄ­ Ã¤¿ì±â</th>
					</tr>
					<tr>
						<th>ºóÄ­1</th>
						<td><input type="text"></td>
					</tr>
					<tr>
						<th>ºóÄ­2</th>
						<td><input type="text"></td>
					</tr>
					<tr>
						<th>ºóÄ­3</th>
						<td><input type="text"></td>
					</tr>
					<tr>
						<th>ºóÄ­4</th>
						<td><input type="text"></td>
					</tr>
					<tr>
						<th colspan="2">PS ¸àÆ® Ãß°¡</th>
					</tr>
					<tr>
						<td colspan="2"><textarea></textarea></td>
					</tr>
				</tbody>
			</table>
			<input type="button" value="´ÙÀ½">
			<input type="button" value="Àå¹Ù±¸´Ï">
		</div>
	</div>
</body>
</html>