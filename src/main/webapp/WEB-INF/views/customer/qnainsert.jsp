<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  


  
<%@include file="../include/header.jsp"%>
<%@include file="../include/floatingMenu.jsp"%>

<link rel="stylesheet" href="/resources/css/customer/qnainsert.css">


<body>

	<div class="inner">
	
 		<div class="customer_logo">
			<h1>Customer Service</h1>
		</div>

		<div class=customer_menu>
			<button class="c_bt" onclick="location.href='notice';">NOTICE</button>
			<button class="c_bt" onclick="location.href='qnalist';">Q&A</button>
			<button class="c_bt" onclick="location.href='faq';">FAQ</button>
		</div>
    
    <section id="sec_qna">
        <h3>1:1문의</h3>
        
       <form action="/customer/qnainsert" method="post"  enctype="multipart/form-data">
        <label for="qna_title">제목</label>
        	<input type="text" name="qna_title" id="qna_title"><br>
        
        	<span style="padding:20px">문의유형</span>
       		 <select name="qna_type" >
           	  <option>배송문의</option>
           	  <option>상품문의</option>
           	  <option>기타문의</option>
        	</select>
        <br>
      <textarea cols="80px" rows="20px" name="qna_content"></textarea><br>
        <input type="file" name="files">
        <input type="submit" value="등록" onclick="alert('등록되었습니다.')">
      <!-- 비밀글 설정 체크박스 -->
     		<div class="form-check form-check-inline mt-3">
     			<span>비밀글 설정</span>
				<label><input class="form-check-input" type="checkbox" name="secret" value="false" checked="checked" onclick="doOpenCheck(this);">공개</label>
				<label><input class="form-check-input" type="checkbox" name="secret" value="true" onclick="doOpenCheck(this);">비공개</label>
			</div>
        
    </form>
    </section>   
  </div>

<script type="text/javascript">
function doOpenCheck(chk){
    var obj = document.getElementsByName("secret");
    for(var i=0; i<obj.length; i++){
        if(obj[i] != chk){
            obj[i].checked = false;
        }
    }
}
</script>

   

<%@include file="../include/footer.jsp" %>
