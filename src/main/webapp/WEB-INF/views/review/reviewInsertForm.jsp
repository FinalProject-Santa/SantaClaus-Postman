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
<title>reviewInsert</title>
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
    <h3>리뷰 작성</h3>
    <hr>
  </div>
  
<form action="/review/reviewinsert" method="post" enctype="multipart/form-data">
    <div class="mb-3">
      <label for="formGroupExampleInput" class="form-label">제목</label>
      <input type="text" name="review_title" class="form-control" id="formGroupExampleInput" placeholder="제목을 입력하세요">
    </div>
    <div class="mb-3">
      <label for="formGroupExampleInput2" class="form-label">평가</label>
      <input type="text" name="review_evaluation" class="form-control" id="formGroupExampleInput2" placeholder="Another input placeholder">
    </div>
    <div class="mb-3">
    <div class="review_rating">
      <div class="warning_msg">별점</div>
      <p id="star"> <!-- 부모 -->
        <a href="#" value="1" name="reivew_best">★</a> <!-- 자식들-->
        <a href="#" value="2" name="reivew_best">★</a>
        <a href="#" value="3" name="reivew_best">★</a>
        <a href="#" value="4" name="reivew_best">★</a>
        <a href="#" value="5" name="reivew_best">★</a>
       <p>
  </div>
</div>
  <div class="mb-3">
    <label>상세 내용</label>
    <div class="form-floating">
      <textarea name="reivew_content" class="form-control" placeholder="Leave a comment here" id="floatingTextarea2" style="height: 100px"></textarea>
      <label for="floatingTextarea2">Comments</label>
    </div>
  </div>
  <div class="mb-3">
  <label>사진 등록</label>
  <div class="input-group mb-3">
    <input type="file" class="form-control" id="inputGroupFile02">
    <label class="input-group-text" for="inputGroupFile02">Upload</label>
  </div>
</div>
<button type="submit" class="btn btn-primary btn-sm">작성</button>
<button type="button" class="btn btn-success btn-sm">수정</button>
<button type="button" class="btn btn-secondary btn-sm">삭제</button>
</form>
</div>


<script src="http://code.jquery.com/jquery-latest.js"></script> 
<script>
$('#star a').click(function(){ 
	 $(this).parent().children("a").removeClass("on");    
	 $(this).addClass("on").prevAll("a").addClass("on");
	 console.log($(this).attr("value"));
});
</script>
</body>
</html>

