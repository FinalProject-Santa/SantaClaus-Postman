<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@include file="../include/header.jsp"%>
<%@include file="../include/floatingMenu.jsp"%>

<link rel="stylesheet" href="/resources/css/kidsAccount/kidsModify.css">


<body>

<div class="inner">
  <div class="view-account">
    <section class="module">
       <div class="module-inner">
          <div class="side-bar">
             
             <div class="user-info">
              <c:set var="i" value="${no-1}"/>
              
                <c:if test="${!empty list[i].kids_thumbnail}">
                 <img class="img-profile img-circle img-responsive center-block" src="/resources/files/${list[i].kids_thumbnail}" alt="프로필 사진이없습니다.">
                </c:if>
                                
                 <c:if test="${empty list[i].kids_thumbnail}">
                   <img class="img-profile img-circle img-responsive center-block" src="/resources/image/customer/SnowSculptures.jpg" class="image-box" />
                 </c:if>
               </div> 
                    		
                
               <div class="user-info2">
                    		
               <p>${list[i].kids_nickname}</p>
               <p>포인트 : ${list[i].kids_point} point</p>
         <c:choose><c:when test="${sticker[i].sticker_count eq null}">
               <p>칭찬스티커 : 0개</p>
            </c:when>
           <c:otherwise>
               <p>${sticker[i].sticker_count}개</p>
           </c:otherwise>
            </c:choose>
                           
     <input type="button" class="bt" id="delete" value="계정삭제">
         
			 
			 
			 </div>
 
         <nav class="side-menu"></nav>
              
              </div>
			</div>
			
                <div class="content-panel">
                   <h2 class="title">키즈 계정 변경</h2>
                    <h3 class="fieldset-title">프로필 변경</h3>
                      <div class="imgbox">
                       	<c:if test="${!empty list[i].kids_thumbnail}">
                          <img src="/resources/files/${list[i].kids_thumbnail}" class="image-box" />
                         </c:if>
                                
                        <c:if test="${empty list[i].kids_thumbnail}">
                           <img src="/resources/image/customer/SnowSculptures.jpg" class="image-box" />
                         </c:if>
                                
             		 <form method="post" enctype="multipart/form-data">
                            
                            <div class="uld-bt-box">    
                               <label for="file" class="upload-btn">
                                  <input id="file" type="file" accept="image/*" name="files">
                                  <span>프로필 사진 설정</span>
                                </label>
                              </div>
                             
                             <div class="form-group">
                                  <div class="nickname-box">
                                    <input type="text" name="kids_nickname" class="nickname" required="required" placeholder="${list[i].kids_nickname}" minlength="2" maxlength="8" style="text-align:center; ">
                                  <small>(2글자 이상 8글자 이하)</small>
                                  </div>
                              </div>
                         
                 

                  	  <div class="submitbt"><br>
                   		<input type="submit" class="bt" value="변경" formaction="/kidsaccount/updateProfile">
                		</div>
                       </form>
                 </div>
			</div>
                
               <div class="content-panel">
                 <h3 class="fieldset-title">산타에게 편지를</h3>
                   <div class="form-group">
                      <div class="imgbox">
               
               			<c:if test="${!empty list[i].kids_letter_img}">
                          <img src="/resources/files/${list[i].kids_letter_img}" class="image-box" />
                         </c:if>
                                
                        <c:if test="${empty list[i].kids_letter_img}">
                        <img src="https://i0.wp.com/adventure.co.kr/wp-content/uploads/2020/09/no-image.jpg" class="image-box" />
                         </c:if>
               
                       </div>

					<form method="post" enctype="multipart/form-data">
					 <div class="uld-bt-box">
						<label for="file2" class="upload-btn"> 
						<input id="file2" type="file" name="files"> 
							<span>편지 업로드</span>
						</label>
					 </div>

						<div class="submitbt">
						 <br><input type="submit" class="bt" value="등록" formaction="/kidsaccount/AddSantamail">
						</div>
					</form>
				</div>
            </div>
        </section>
    </div>
</div>



<%@include file="../include/footer.jsp" %>


<script>
$("#delete").click(function(){
	var deleteCk = confirm("정말 삭제하시겠습니까?");
	if(deleteCk){
		location.href='profileDelete/${list[i].kids_no}';
	} 
});

    const fileDOM = document.querySelector('#file');
    const previews = document.querySelectorAll('.image-box');
    
    fileDOM.addEventListener('change', () => {
      const reader = new FileReader();
      reader.onload = ({ target }) => {
        previews[0].src = target.result;
      };
      reader.readAsDataURL(fileDOM.files[0]);
    });
    
    const fileDOM2 = document.querySelector('#file2');
    
    fileDOM2.addEventListener('change', () => {
      const imageSrc = URL.createObjectURL(fileDOM2.files[0]);
      previews[1].src = imageSrc;
    });    
</script>
