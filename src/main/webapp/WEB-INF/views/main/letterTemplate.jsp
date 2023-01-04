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
			<li><a href="../member/logout">�α׾ƿ�</a></li>
		</c:when>
		<c:otherwise>
			<li><a href="../member/login">�α���</a></li>
		</c:otherwise>
</c:choose>
	<h2>���� ���ø� ����Ʈ</h2>
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
						<th>���ø���</th>
						<td>��Ÿ�� ������ �ʾ�</td>
					</tr>
					<tr>
						<th colspan="2">���ø� ��ĭ ä���</th>
					</tr>
					<tr>
						<th>��ĭ1</th>
						<td><input type="text"></td>
					</tr>
					<tr>
						<th>��ĭ2</th>
						<td><input type="text"></td>
					</tr>
					<tr>
						<th>��ĭ3</th>
						<td><input type="text"></td>
					</tr>
					<tr>
						<th>��ĭ4</th>
						<td><input type="text"></td>
					</tr>
					<tr>
						<th colspan="2">PS ��Ʈ �߰�</th>
					</tr>
					<tr>
						<td colspan="2"><textarea></textarea></td>
					</tr>
				</tbody>
			</table>
			<input type="button" value="����">
			<input type="button" value="��ٱ���">
		</div>
	</div>
</body>
</html>