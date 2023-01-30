<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- CSS only -->
<link rel="stylesheet" href="/resources/css/review/reviewinsert.css">
<body>
<%@include file="../include/header.jsp" %>
<%@include file="../include/floatingMenu.jsp" %>

<div class="inner">
	<div class="container">
		<div>
			<h3>후기 작성</h3> <hr >
			
		</div>

		<form name="form1" action="/review/reviewinsert" method="post"
			enctype="multipart/form-data">
			<input type="hidden" name="review_count" id="count" value="0">
			<div class="mb-3">
				<label for="formGroupExampleInput" class="form-label">제목</label> <input
					type="text" name="review_title" class="form-control"
					id="title" placeholder="제목을 입력하세요">
			</div>
			<div class="mb-3">
				<div class="review_rating">
					<label for="reply_star">별점</label> <span class="star"> ★★★★★
						<span>★★★★★</span> <input type="range" oninput="drawStar(this)"
						value="1" step="0.5" min="0" max="5" name="review_best" id="best">
					</span>
				</div>
			</div>
			<div class="mb-3">
				<label>상세 내용</label>
				<div class="form-floating">
					<textarea name="review_content" class="form-control"
						placeholder="Leave a comment here" id="content"
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
			<button type="button" class="btn btn-primary btn-sm" id="btnSave">작성</button>
			<button type="button" class="btn btn-secondary btn-sm">취소</button>
		</form>
	</div>
</div>

	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<script>
	
	 const drawStar = (target) => {
		    document.querySelector(`.star span`).style.width = `\${target.value * 20}%`;
		  }

	$('input[type="text"]').keydown(function() {
		  if (event.keyCode === 13) {
		    event.preventDefault();
		  };
		});
	
	$(document).ready(function(){
		$("#btnSave").click(function(){
			var fileCheck = $("#inputGroupFile02").val();
			var title = $("#title").val();
			var content = $("#content").val();
			var best = $("#best").val();
			if(title == ""){
				alert("제목을 입력하세요");
				document.form1.title.focus();
				return;
			}
			if(content == ""){
				alert("내용을 입력하세요");
				document.form1.content.focus();
				return;	
			}
			if(!fileCheck){
				alert("이미지를 첨부해 주세요")
				document.form1.fileCheck.focus();
				return;
			}
			document.form1.submit();
		});
	});

	  $("#inputGroupFile02").change(function(){
		   if(this.files && this.files[0]) {
		    var reader = new FileReader;
		    reader.onload = function(data) {
		     $(".select_img img").attr("src", data.target.result).width(100);        
		    }
		    reader.readAsDataURL(this.files[0]);
		   }
		  });	
	</script>
	
<%@include file="../include/footer.jsp" %>
</body>
</html>

