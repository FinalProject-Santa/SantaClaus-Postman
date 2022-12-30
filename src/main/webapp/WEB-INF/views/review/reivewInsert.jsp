<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Poor+Story&display=swap" rel="stylesheet">
<style>
  * {
    font-family: 'poor story', cursive !important;
  }
  
 
</style>
</head>
<title></title>
<body>
<div class="container" style="margin : 0 auto">
  <div>
    <h2>리뷰 작성</h2>
    <hr>
  </div>
  
  <form> 
    <div class="mb-3">
      <label for="formGroupExampleInput" class="form-label">제목</label>
      <input type="text" class="form-control" id="formGroupExampleInput" placeholder="Example input placeholder">
    </div>
    <div class="mb-3">
      <label for="formGroupExampleInput2" class="form-label">Another label</label>
      <input type="text" class="form-control" id="formGroupExampleInput2" placeholder="Another input placeholder">
    </div>
    <div class="mb-3">
    <div class="review_rating">
      <div class="warning_msg">별점</div>
      <div class="rating">
          <!-- 해당 별점을 클릭하면 해당 별과 그 왼쪽의 모든 별의 체크박스에 checked 적용 -->
          <input type="checkbox" name="rating" id="rating1" value="1" class="rate_radio" title="1점">
          <label for="rating1"></label>
          <input type="checkbox" name="rating" id="rating2" value="2" class="rate_radio" title="2점">
          <label for="rating2"></label>
          <input type="checkbox" name="rating" id="rating3" value="3" class="rate_radio" title="3점" >
          <label for="rating3"></label>
          <input type="checkbox" name="rating" id="rating4" value="4" class="rate_radio" title="4점">
          <label for="rating4"></label>
          <input type="checkbox" name="rating" id="rating5" value="5" class="rate_radio" title="5점">
          <label for="rating5"></label>
      </div>
  </div>
</div>
  <div class="mb-3">
    <label>상세 내용</label>
    <div class="form-floating">
      <textarea class="form-control" placeholder="Leave a comment here" id="floatingTextarea2" style="height: 100px"></textarea>
      <label for="floatingTextarea2">Comments</label>
    </div>
  </div>
  <div class="mb-3">
  <label>사진 추가</label>
  <div class="input-group mb-3">
    <input type="file" class="form-control" id="inputGroupFile02">
    <label class="input-group-text" for="inputGroupFile02">Upload</label>
  </div>
</div>
<button type="submit" class="btn btn-primary btn-sm">작성</button>
<button type="button" class="btn btn-success btn-sm">수정</button>
<button type="button" class="btn btn-secondary btn-sm">삭제</button>
</div>


</form>


</body>