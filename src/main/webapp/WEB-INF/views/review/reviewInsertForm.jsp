<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- CSS only -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap"
	rel="stylesheet">

</head>
<title>reviewInsert</title>
<style>
* {
	font-family: 'Nanum Pen Script', cursive;
}

.star {
	position: relative;
	font-size: 2rem;
	color: #ddd;
}

.star input {
	width: 100%;
	height: 100%;
	position: absolute;
	left: 0;
	opacity: 0;
	cursor: pointer;
}

.star span {
	width: 0;
	position: absolute;
	left: 0;
	color: yellow;
	overflow: hidden;
	pointer-events: none;
}
</style>
<body>
	<div class="container" style="margin: 0 auto">
		<div>
			<h3>리뷰 작성</h3>
			<hr>
		</div>

		<form action="/review/reviewinsert" method="post"
			enctype="multipart/form-data">
			<input type="hidden" name="user_id" id="user" value="user01">
			<input type="hidden" name="review_count" id="count" value="1">
			<div class="mb-3">
				<label for="formGroupExampleInput" class="form-label">제목</label> <input
					type="text" name="review_title" class="form-control"
					id="formGroupExampleInput" placeholder="제목을 입력하세요">
			</div>
			<div class="mb-3">
				<div class="review_rating">
					<label for="reply_star">별점</label> <span class="star"> ★★★★★
						<span>★★★★★</span> <input type="range" oninput="drawStar(this)"
						value="1" step="0.5" min="0" max="5" name="review_best">
					</span>
				</div>
			</div>
			<div class="mb-3">
				<label>상세 내용</label>
				<div class="form-floating">
					<textarea name="review_content" class="form-control"
						placeholder="Leave a comment here" id="floatingTextarea2"
						style="height: 100px"></textarea>
					<label for="floatingTextarea2">Comments</label>
				</div>
			</div>
			<div class="mb-3">
				<label>사진 등록</label>
				<div class="input-group mb-3">
					<input type="file" class="form-control" id="inputGroupFile02"
						name="files"> <label class="input-group-text"
						for="inputGroupFile02">Upload</label>
					<div class="select_img"><img alt="이미지를 업로드해 주세요." src="https://i0.wp.com/adventure.co.kr/wp-content/uploads/2020/09/no-image.jpg" height="100" width="100"></div>
				</div>
			</div>
			<button type="submit" class="btn btn-primary btn-sm">작성</button>
			<button type="button" class="btn btn-secondary btn-sm">취소</button>
		</form>
	</div>


	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<script>
	  $("#inputGroupFile02").change(function(){
		   if(this.files && this.files[0]) {
		    var reader = new FileReader;
		    reader.onload = function(data) {
		     $(".select_img img").attr("src", data.target.result).width(100);        
		    }
		    reader.readAsDataURL(this.files[0]);
		   }
		  });
	  
	 const drawStar = (target) => {
		    document.querySelector(`.star span`).style.width = `\${target.value * 20}%`;
		  }
	</script>
</body>
</html>

