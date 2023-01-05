<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/resources/css/main/signUp.css" rel="stylesheet">
<style>
* {
	margin: 0px;
	padding: 0px;
}

body {
	width: 100%;
	display: flex;
	justify-content: center;
	padding-top: 20px;
	padding-bottom: 100px;
}
</style>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script>
	$(function() {

	});
</script>
</head>
<body>
	<div id="wrap" class="profileList">
		<h1>프로필 계정을 선택 해주세요!</h1>
		<h3>부모 계정</h3>
		<div class="parentProfile">
			<a href="#">
				<img src="./image/parent1.JPG"><br>
			</a>
			<span>pota7777</span>
		</div>
		<h3>어린이 계정</h3>
		<div class="childrenProfile" style="display: flex; background-repeat: no-repeat;">
			<div class="child">
				<a href="#">
					<img src="./image/baby1.JPG"><br>
				</a>
				<span>잼민이1</span>
			</div>
			<div class="child">
				<a href="#">
					<img src="./image/baby2.JPG"><br>
				</a>
				<span>잼민이2</span>
			</div>
		</div>
	</div>
</body>
</html>

