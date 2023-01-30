<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link rel="stylesheet" href="/resources/css/review/reviewinsert.css">
<body>
<%@include file="../include/header.jsp" %>
<%@include file="../include/floatingMenu.jsp" %>

<div class="inner">
	<div class="container">
	  <div>
	    <i class="fa-sharp fa-solid fa-pen-to-square" style="padding-right: 5px;"></i><label style="font-size:18px;">후기 수정</label> <hr >
	  </div>
	  
	<form action="/review/reviewUpdate" method="post" enctype="multipart/form-data">
	<input type="hidden" name="review_count" id="count" value="${review_count }">
	<input type="hidden" name="review_no" value="${review_no}"/>
	    
	    <div class="mb-3">
	      <label for="formGroupExampleInput" class="form-label">제목</label>
	      <input type="text" name="review_title" class="form-control" id="formGroupExampleInput" value="${reviewdetail.review_title}">
	    </div>
	    			<div class="mb-3">
					<div class="review_rating">
						<label for="reply_star">별점</label> <span class="star"> ★★★★★
							<span>★★★★★</span> <input type="range" oninput="drawStar(this)"
							value="1" step="0.5" min="0" max="5" name="review_best">
						</span>
					</div>
				</div>
	  <div class="mb-4">
	    <label>상세 내용</label>
	    <div class="form-floating">
	      <textarea name="review_content" class="form-control" placeholder="Leave a comment here" id="floatingTextarea2">${reviewdetail.review_title}</textarea>
	      <label for="floatingTextarea2"></label>
	    </div>
	  </div>
	  <div class="mb-3">
	<label>사진 등록</label>
	  <div class="input-group mb-3">
	    <input type="file" class="form-control" id="inputGroupFile02" name="files" value="test">
	    <label class="input-group-text" for="inputGroupFile02">&nbsp</label>
	  </div> 
	</div>
	<input type="hidden" name="rfile_name" value="${rfiles.rfile_name}" />
	<button type="submit" class="btn btn-primary btn-sm">수정</button>
	<button type="button" class="btn btn-secondary btn-sm" onclick="location.href='/review/reviewList'">취소</button>
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

