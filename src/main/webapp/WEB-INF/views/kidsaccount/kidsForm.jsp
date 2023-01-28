<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="../include/header.jsp"%>
<%@include file="../include/floatingMenu.jsp"%>

<link rel="stylesheet" href="/resources/css/kidsAccount/kidsForm.css">

<body>
<div class="inner">
    <div class="view-account">
            <div class="module-inner">
                <div class="side-bar">
                    <div class="user-info">
                        <!-- <img class="img-profile img-circle img-responsive center-block" src="https://i0.wp.com/adventure.co.kr/wp-content/uploads/2020/09/no-image.jpg" alt=""> -->
                    
                            <!-- <p>${KidsDto.kids_nickname}</p> -->
                            <!-- <p> ${KidsDto.kids_point}</p> -->
                    </div>
            		<nav class="side-menu">
        				<ul class="nav">
        					<!-- <li class="active"><a href="#"><span class="fa fa-user"></span> Profile</a></li>
        					<li><a href="#"><span class="fa fa-cog"></span> Settings</a></li> -->
        				</ul>
        			</nav>
                </div>

                <div class="content-panel">
                    <h2 class="title">키즈 계정 설정</h2>
                     	<form method="post" enctype="multipart/form-data">
                     <fieldset class="fieldset">
                        <h3 class="fieldset-title">프로필 설정</h3>
                        <div class="form-group">
                            
                            <div class="imgbox">
                                <img src="https://i0.wp.com/adventure.co.kr/wp-content/uploads/2020/09/no-image.jpg" class="image-box" />
                            </div>
                            <div class="uld-bt-box">    
                                <label for="file" class="upload-btn">
                                           <input id="file" type="file" accept="image/*" name="files">
                                                <span>프로필 사진 설정</span>
                                        </label>
                               
                                 </div>
                                 <div class="form-group">
                                    <div class="nickname-box">
                                        <input type="text" name="kids_nickname" class="nickname" placeholder="닉네임을 입력해주세요" required="required" minlength="2" maxlength="8">
                                        <br>
                                        <small>2글자 이상 8글자 이하</small>
                                       </div>
                                   </div>
                                </div>
                            </fieldset>
                 

                 <div class="submitbt" ><br>
                 <input type="submit" value="등록" formaction="/kidsaccount/AddProfile">
                </div>
                 </div>

                
                <div class="content-panel">
                        <fieldset class="fieldset">
                            <h3 class="fieldset-title">산타에게 편지를</h3>
                            <div class="form-group">
                                <div class="imgbox">
                                    <img src="https://i0.wp.com/adventure.co.kr/wp-content/uploads/2020/09/no-image.jpg" class="image-box" />
                                </div>
                                    <div class="uld-bt-box">
                                    <label for="file2" class="upload-btn">
                                        <input id="file2" type="file" name="files">
                                        <span>편지 업로드</span>
                                    
                                        </label>
                                    </div>
                            </div>
                        </fieldset>

                        <div class="submitbt"><br>
                          <input type="submit" value="등록" onclick=santamailCheck();>
                      </form>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    const fileDOM = document.querySelector('#file');
    const previews = document.querySelectorAll('.image-box');
    
    fileDOM.addEventListener('change', () => {
      const reader = new FileReader();
      reader.onload = ({ target }) => {
        previews[0].src = target.result;
      };
      reader.readAsDataURL(fileDOM.files[0]);
    });
    
    const fileDOM2 = document.querySelector('#files');
    
    fileDOM2.addEventListener('change', () => {
      const imageSrc = URL.createObjectURL(fileDOM2.files[0]);
      previews[1].src = imageSrc;
    });
    
    
    function santamailCheck(){
    	alert("먼저 계정을 만들어주세요!");
    }
    
    </script>

<%@include file="../include/footer.jsp" %>