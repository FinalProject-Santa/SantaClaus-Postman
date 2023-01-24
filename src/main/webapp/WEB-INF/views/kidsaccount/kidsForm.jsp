<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<style>
body{
background:#f9f9fb;    
}

fieldset{
border-color: #e8e8e8;
}
.view-account{
background:#FFFFFF; 
margin-top:20px;
}
.view-account .pro-label {
font-size: 13px;
padding: 4px 5px;
position: relative;
top: -5px;
margin-left: 10px;
display: inline-block
}

.view-account .side-bar {
padding-bottom: 30px
}

.view-account .side-bar .user-info {
text-align: center;
margin-bottom: 15px;
padding: 30px;
color: #616670;
border-bottom: 1px solid #f3f3f3
}

.view-account .side-bar .user-info .img-profile {
width: 120px;
height: 120px;
margin-bottom: 15px
}

.view-account .side-bar .user-info .meta li {
margin-bottom: 10px
}

.view-account .side-bar .user-info .meta li span {
display: inline-block;
width: 100px;
margin-right: 5px;
text-align: right
}

.view-account .side-bar .user-info .meta li a {
color: #616670
}

.view-account .side-bar .user-info .meta li.activity {
color: #a2a6af
}

.view-account .side-bar .side-menu {
text-align: center
}

.view-account .side-bar .side-menu .nav {
display: inline-block;
margin: 0 auto
}

/* .view-account .side-bar .side-menu .nav>li {
font-size: 14px;
margin-bottom: 0;
border-bottom: none;
display: inline-block;
float: left;
margin-right: 15px;
margin-bottom: 15px
} */

.view-account .side-bar .side-menu .nav>li:last-child {
margin-right: 0
}

.view-account .side-bar .side-menu .nav>li>a {
display: inline-block;
color: #9499a3;
padding: 5px;
border-bottom: 2px solid transparent
}

.view-account .side-bar .side-menu .nav>li>a:hover {
color: #616670;
background: none
}

.view-account .side-bar .side-menu .nav>li.active a {
color: #40babd;
border-bottom: 2px solid #40babd;
background: none;
border-right: none
}

.theme-2 .view-account .side-bar .side-menu .nav>li.active a {
color: #6dbd63;
border-bottom-color: #6dbd63
}

.theme-3 .view-account .side-bar .side-menu .nav>li.active a {
color: #497cb1;
border-bottom-color: #497cb1
}

.theme-4 .view-account .side-bar .side-menu .nav>li.active a {
color: #ec6952;
border-bottom-color: #ec6952
}

.view-account .side-bar .side-menu .nav>li .icon {
display: block;
font-size: 24px;
margin-bottom: 5px
}

.view-account .content-panel {
padding: 50px
}

.view-account .content-panel .title {
margin-bottom: 15px;
margin-top: 0;
font-size: 18px
}

.view-account .content-panel .fieldset-title {
padding-bottom: 15px;
border-bottom: 1px solid #eaeaf1;
margin-bottom: 30px;
color: #616670;
font-size: 16px
}


@media (max-width:767px) {
.view-account .content-panel .title {
    text-align: center
}
.view-account .side-bar .user-info {
    padding: 0
}
.view-account .side-bar .user-info .img-profile {
    width: 60px;
    height: 60px
}
.view-account .side-bar .user-info .meta li {
    margin-bottom: 5px
}


.view-account .content-panel .content-utilities .page-nav {
    position: static;
    margin-bottom: 15px
}

.view-account .content-panel .avatar .figure img {
    float: none;
    margin-bottom: 15px
}
.view-account .file-uploader {
    margin-bottom: 15px
}
.view-account .mail-subject {
    max-width: 100px;
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis
}
.view-account .content-panel .mails-wrapper .mail-item .time-container {
    position: static
}
.view-account .content-panel .mails-wrapper .mail-item .time-container .time {
    width: auto;
    text-align: left
}
}

@media (min-width:768px) {
.view-account .side-bar .user-info {
    padding: 0;
    padding-bottom: 15px
}
.view-account .mail-subject .subject {
    max-width: 200px;
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis
}
}

@media (min-width:992px) {
.view-account .content-panel {

    border-left: 1px solid #f3f3f7;
    margin-left: 200px
}
.view-account .mail-subject .subject {
    max-width: 280px;
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis
}
.view-account .side-bar {
    position: absolute;
    width: 200px;
    min-height: 600px
}
.view-account .side-bar .user-info {
    margin-bottom: 0;
    border-bottom: none;
    padding: 30px
}
.view-account .side-bar .user-info .img-profile {
    width: 120px;
    height: 120px
}
.view-account .side-bar .side-menu {
    text-align: left
}
.view-account .side-bar .side-menu .nav {
    display: block
}
.view-account .side-bar .side-menu .nav>li {
    display: block;
    float: none;
    font-size: 14px;
    border-bottom: 1px solid #f3f3f7;
    margin-right: 0;
    margin-bottom: 0
}
.view-account .side-bar .side-menu .nav>li>a {
    display: block;
    color: #9499a3;
    padding: 10px 15px;
    padding-left: 30px
}
.view-account .side-bar .side-menu .nav>li>a:hover {
    background: #f9f9fb
}
.view-account .side-bar .side-menu .nav>li.active a {
    background: #f9f9fb;
    border-right: 4px solid #40babd;
    border-bottom: none
}
.theme-2 .view-account .side-bar .side-menu .nav>li.active a {
    border-right-color: #6dbd63
}
.theme-3 .view-account .side-bar .side-menu .nav>li.active a {
    border-right-color: #497cb1
}
.theme-4 .view-account .side-bar .side-menu .nav>li.active a {
    border-right-color: #ec6952
}
.view-account .side-bar .side-menu .nav>li .icon {
    font-size: 24px;
    vertical-align: middle;
    text-align: center;
    width: 40px;
    display: inline-block
}
.image-box {  
      width: 200px;
      height: 200px;
      object-fit: cover;
      display: block;
      margin: 20px auto;
    }

}

.upload-btn {
      border: 1px solid #ddd;
      padding: 6px 12px;
      display: inline-block;
      cursor: pointer;
}
     
input[type=file] {
        display: none;
}

.nickname-box {
    text-align: center;
}

input.nickname {
    padding: 10px;
    font-size: 12pt;
}

.uld-bt-box{
    text-align: center;
    padding-bottom: 10px;
}


.submitbt{
    margin-left: 0;
    text-align: center;
}
</style>
<body>
<div class="container">
    <div class="view-account">
        <section class="module">
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
                     <fieldset class="fieldset">
                        <h3 class="fieldset-title">프로필 설정</h3>
                        <div class="form-group">
                            
                            <div class="imgbox">
                                <img src="https://i0.wp.com/adventure.co.kr/wp-content/uploads/2020/09/no-image.jpg" class="image-box" />
                            </div>
                            <div class="uld-bt-box">    
                                <label for="file" class="upload-btn">
                     		<form action="/kidsaccount/AddProfile" method="post" enctype="multipart/form-data">
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
                 

                 <div class="submitbt"><br>
                 <input type="submit" value="등록">
                 </form>
                 
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
                                        <form action="/kidsaccount/AddSantamail" method="post" enctype="multipart/form-data">
                                        <input id="file2" type="file" name="files">
                                        <span>편지 업로드</span>
                                    
                                        </label>
                                    </div>
                            </div>
                        </fieldset>

                        <div class="submitbt"><br>
                            <input type="submit" value="등록">
                              </form>
                       </div>
                </div>
            </div>
        </section>
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
    </script>

</body>
</html>