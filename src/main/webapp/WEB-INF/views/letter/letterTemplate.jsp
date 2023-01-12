<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
* {
	padding: 0;
	margin: 0;
}

body{
	width: 1000px;
	height: 2000px;
}
.content {
	display: grid; /*항상 일정한 비율로 개수가 정렬이 되도록 */
    grid-template-columns: repeat(4, 1fr);
}
</style>
</head>
<body>
	<h2>엽서 템플릿 리스트</h2>
	<div class="content">
		<div class="card1">
			<a href='/letter/detail/1'>
				<img src="/resources/image/letter/card1.JPG">
			</a>
		</div>
		<div class="card2">
			<a href='/letter/detail/2'>
				<img src="/resources/image/letter/card2.JPG">
			</a>
		</div>
		<div class="card3">
			<a href='/letter/detail/3'>
				<img src="/resources/image/letter/card3.JPG">
			</a>
		</div>
		<div class="card4">
			<a href='/letter/detail/4'>
				<img src="/resources/image/letter/card4.JPG">
			</a>
		</div>
		<div class="card5">
			<a href='/letter/detail/5'>
				<img src="/resources/image/letter/card5.JPG">
			</a>
		</div>
		<div class="card6">
			<a href='/letter/detail/6'>
				<img src="/resources/image/letter/card6.JPG">
			</a>
		</div>
		<div class="card7">
			<a href='/letter/detail/7'>
				<img src="/resources/image/letter/card7.JPG">
			</a>
		</div>
		<div class="card8">
			<a href='/letter/detail/8'>
				<img src="/resources/image/letter/card8.JPG">
			</a>
		</div>
	</div>
</body>
</html>