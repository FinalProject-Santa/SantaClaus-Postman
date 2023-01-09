<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<link rel="preconnect" href="https://fonts.googleapis.com"><link rel="preconnect" href="https://fonts.gstatic.com" crossorigin><link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap" rel="stylesheet">

</head>
<title>reviewUpdate</title>
<style>
  * {
    font-family: 'Nanum Pen Script', cursive;
    }
  #star a{
   text-decoration: none;
   color: gray;
  }
  #star a.on{
   color: orange;
  } 
</style>
<body>
<div class="container" style="margin : 0 auto">
  <div>
    <h3>리뷰 수정</h3>
    <hr>
  </div>
  
<form action="/review/reviewUpdate" method="post" enctype="multipart/form-data">
<input type="hidden" name="user_id" id="user" value="user01">
<input type="hidden" name="review_count" id="count" value="1">
<input type="hidden" name="review_no" value="${review_no}"/>
    <div class="mb-3">
      <label for="formGroupExampleInput" class="form-label">제목</label>
      <input type="text" name="review_title" class="form-control" id="formGroupExampleInput" placeholder="제목을 입력하세요">
    </div>
    <div class="mb-3">
    <div class="review_rating">
      <label for="reply_star">별점</label>
	<span class="star-input">
		<span class="input">
    			<input type="radio" name="review_best" id="p1" value="1">
    						<label for="p1">1</label>
    			<input type="radio" name="review_best" id="p2" value="2">
    						<label for="p2">2</label>
   			<input type="radio" name="review_best" id="p3" value="3">
   					 		<label for="p3">3</label>
  			<input type="radio" name="review_best" id="p4" value="4">
  							<label for="p4">4</label>
    			<input type="radio" name="review_best" id="p5" value="5">
    						<label for="p5">5</label>
    			<input type="radio" name="review_best" id="p6" value="6">
    						<label for="p6">6</label>
    			<input type="radio" name="review_best" id="p7" value="7">
    						<label for="p7">7</label>
    			<input type="radio" name="review_best" id="p8" value="8">
    						<label for="p8">8</label>
    			<input type="radio" name="review_best" id="p9" value="9">
    						<label for="p9">9</label>
    			<input type="radio" name="review_best" id="p10" value="10">
    						<label for="p10">10</label>
  		</span>
  				<output for="star-input"><b>0</b>점</output>						
	</span>
  </div>
</div>
  <div class="mb-3">
    <label>상세 내용</label>
    <div class="form-floating">
      <textarea name="review_content" class="form-control" placeholder="Leave a comment here" id="floatingTextarea2" style="height: 100px"></textarea>
      <label for="floatingTextarea2">Comments</label>
    </div>
  </div>
  <div class="mb-3">
<!--   <label>사진 등록</label>
  <div class="input-group mb-3">
    <input type="file" class="form-control" id="inputGroupFile02" name="file">
    <label class="input-group-text" for="inputGroupFile02">Upload</label>
  </div> -->
</div>
<button type="submit" class="btn btn-primary btn-sm">작성</button>
<button type="button" class="btn btn-secondary btn-sm">취소</button>
</form>
</div>


<script src="http://code.jquery.com/jquery-latest.js"></script> 
<script>
var starRating = function(){
	  var $star = $(".star-input"),
	      $result = $star.find("output>b");
	  $(document)
	    .on("focusin", ".star-input>.input", function(){
	    $(this).addClass("focus");
	  })
	    .on("focusout", ".star-input>.input", function(){
	    
	    	var $this = $(this);
	    
	    	setTimeout(function(){
	      
	    		if($this.find(":focus").length === 0){
	    			$this.removeClass("focus");
	    		}
	    }, 1000);
	  })
	    .on("change", ".star-input :radio", function(){
	    $result.text($(this).next().text());
	  })
	    .on("mouseover", ".star-input label", function(){
	    $result.text($(this).text());
	  })
	    .on("mouseleave", ".star-input>.input", function(){
	    
	    	var $checked = $star.find(":checked");
	    
	    	if($checked.length === 0){
	    		$result.text("0");
	    	} else {
	    		$result.text($checked.next().text());
	    	}
	  });
	};
	starRating();
</script>
</body>
</html>

