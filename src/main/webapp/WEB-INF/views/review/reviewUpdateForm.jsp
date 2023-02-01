<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <title>Updating Review</title> 
 <link rel="shortcut icon" href="/resources/image/kids/favicon.ico">
<link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Myeongjo&display=swap" rel="stylesheet">
<link rel="stylesheet" href="/resources/css/review/reviewinsert.css">
<body>
<%@include file="../include/header.jsp" %>
<%@include file="../include/floatingMenu.jsp" %>

<div class="inner">
<p class="headCategory" style="text-align: right">
			<a href="/">Home</a> > Review List > Review Detail > Updating Review
		</p>
	<div class="container">
	  <div>
	    <i class="fa-sharp fa-solid fa-pen-to-square" style="padding-right: 5px;"></i><label style="font-size:18px;">후기 수정</label> <hr >
	  </div>
	  <br>
		<br>
	<form action="/review/reviewUpdate" method="post" enctype="multipart/form-data">
	<input type="hidden" name="review_count" id="count" value="${review_count }">
	<input type="hidden" name="review_no" value="${review_no}"/>
	<input type="hidden" name="rimg" value="${rimg}"/>
	    
	    <div class="mb-3">
	      <label for="formGroupExampleInput" class="form-label">제목</label>
	      <input type="text" name="review_title" class="form-control" id="formGroupExampleInput" value="${reviewdetail.review_title}">
	    </div>
	    <br>
	    <br>
	    		<div class="mb-5">
					<div class="review_rating">
						<label for="reply_star">별점</label> <span class="star"> ★★★★★
							<span>★★★★★</span> <input type="range" oninput="drawStar(this)"
							value="1" step="0.5" min="0" max="5" name="review_best">
						</span>
					</div>
				</div>
				<br>
				<br>
	  <div class="mb-3">
	    <label>상세 내용</label>
	    <div class="form-floating" style="padding-top:5px;">
	      <textarea name="review_content" class="form-control"  id="floatingTextarea2">${reviewdetail.review_title}</textarea>
	      <label for="floatingTextarea2"></label>
	    </div>
	  </div>
	  <br>
	  <br>
	  <div class="mb-4">
	<label>사진 등록</label>
	  <div class="input-group mb-3" style="padding-top:5px;">
	    <input type="file" class="form-control" id="inputGroupFile02" name="files" value="test">
	    <label class="input-group-text" for="inputGroupFile02">&nbsp</label>
	  <br>
	  <div class="select_img"><img alt="이미지를 업로드해 주세요." src="/resources/image/uploadfiles/${rfiles.rfile_name}" height="100" width="100"></div>
	  </div> 
	</div>
	<br>
	<br>
	<div class="btn_area">
	<input type="hidden" name="rfile_name" value="${rfiles.rfile_name}" />
	<button type="submit" class="btn">수정</button>
	<button type="button" class="btn" onclick="location.href='/review/reviewList'">취소</button>
	</div>
	</form>
	</div>
</div>
	
	<script src="http://code.jquery.com/jquery-latest.js"></script> 
	<script>
	
	$('input[type="text"]').keydown(function() {
		  if (event.keyCode === 13) {
		    event.preventDefault();
		  };
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
	
	const drawStar = (target) => {
		    document.querySelector(`.star span`).style.width = `\${target.value * 20}%`;
		  }
	</script>
<%@include file="../include/footer.jsp" %>
</body>
</html>

