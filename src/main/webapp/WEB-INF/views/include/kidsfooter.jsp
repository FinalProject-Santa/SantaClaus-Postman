<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
@import url('https://fonts.googleapis.com/css2?family=Gaegu:wght@300;400;700&family=Hi+Melody&display=swap');
footer {
    padding: 15px;
    margin-top: 120px;
    height: 120px;
    font-size:15px;
    line-height:20px;
    /* margin-bottom: 5px; */
}
#footer1{
    width:400px;
}
#footer2{
    width:400px;
    text-align: right;
}
.footerbr{
	margin-bottom: 27px;
}

.header2, .footer2{
    display: flex;
    justify-content: space-between;
    align-items: center;
}
</style>
</head>

	<!-- footer -->
   <footer>
    <div class="footer2">
        <div id="footer1">
            <b>(주)디어산타</b>
            <p>Team: 산타국 우체부</p>
            <p class="footerbr">221206, 서울특별시 산타구 우체동 12-25 2층</p>
            <p>Copyright © 2022 Dear Santa. All rights reserved.</p>
        </div>
        <div id="footer2">
            <p class="footerbr">CONTACT</p>
            <p>T.02212061225 | am 10 ~ pm 5 , sat/sun/holiday off</p>
            <p></p>business mail _ dearsanta@gmail.com</p>
            <p>Instagram _ @dearsanta_official</p>
        </div>
    </div>
    </footer>
    <!-- footer end -->
    
</body>

	<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
	<script>
    function maintoggle(){
        $('#menubox').toggle(400);
    }
    </script>
    
</html>