<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<link rel="stylesheet" href="/resources/css/nytree/decotree.css">
<body>
<%@include file="../include/header.jsp" %>
<%@include file="../include/floatingMenu.jsp"%>

<div class="divdiv" style="width:900px; padding-top: 5%;" >
	<div id="or-container">
	   <img src='/resources/image/treeimg/오너1.png' alt="" class="ornament" draggable="true" data-key="o1"><input type="hidden" class="img" name="or_name" value="o1">
	   <img src='/resources/image/treeimg/오너2.png' alt="" class="ornament" draggable="true" data-key="o2"><input type="hidden" class="img" name="or_name" value="o2">
	   <img src='/resources/image/treeimg/오너3.png' alt="" class="ornament" draggable="true" data-key="o3"><input type="hidden" class="img" name="or_name" value="o3">
	   <img src='/resources/image/treeimg/오너4.png' alt="" class="ornament" draggable="true" data-key="o4"><input type="hidden" class="img" name="or_name" value="o4">
	   <img src='/resources/image/treeimg/오너5.png' alt="" class="ornament" draggable="true" data-key="o5"><input type="hidden" class="img" name="or_name" value="o5">
	   <img src='/resources/image/treeimg/오너6.png' alt="" class="ornament" draggable="true" data-key="o6"><input type="hidden" class="img" name="or_name" value="o6">
	   <img src='/resources/image/treeimg/오너7.png' alt="" class="ornament" draggable="true" data-key="o7"><input type="hidden" class="img" name="or_name" value="o7">
	   <img src='/resources/image/treeimg/오너8.png' alt="" class="ornament" draggable="true" data-key="o8"><input type="hidden" class="img" name="or_name" value="o8">
	   <img src='/resources/image/treeimg/오너10.png' alt="" class="ornament" draggable="true" data-key="o10"><input type="hidden" class="img" name="or_name" value="o10">
	   <img src='/resources/image/treeimg/오너11.png' alt="" class="ornament" draggable="true" data-key="o11"><input type="hidden" class="img" name="or_name" value="o11">
	   <img src='/resources/image/treeimg/오너12.png' alt="" class="ornament" draggable="true" data-key="o12"><input type="hidden" class="img" name="or_name" value="o12">
	   <img src='/resources/image/treeimg/오너13.png' alt="" class="ornament" draggable="true" data-key="o13"><input type="hidden" class="img" name="or_name" value="o13">
	   <img src='/resources/image/treeimg/오너16.png' alt="" class="ornament" draggable="true" data-key="o16"><input type="hidden" class="img" name="or_name" value="o16">
	   <img src='/resources/image/treeimg/오너17.png' alt="" class="ornament" draggable="true" data-key="o17"><input type="hidden" class="img" name="or_name" value="o17">
	   <img src='/resources/image/treeimg/오너18.png' alt="" class="ornament" draggable="true" data-key="o18"><input type="hidden" class="img" name="or_name" value="o18">
	   <img src='/resources/image/treeimg/오너19.png' alt="" class="ornament" draggable="true" data-key="o19"><input type="hidden" class="img" name="or_name" value="o19">
	   <img src='/resources/image/treeimg/오너20.png' alt="" class="ornament" draggable="true" data-key="o20"><input type="hidden" class="img" name="or_name" value="o20">
	   <img src='/resources/image/treeimg/오너22.png' alt="" class="ornament" draggable="true" data-key="o22"><input type="hidden" class="img" name="or_name" value="o22">
	   <img src='/resources/image/treeimg/오너23.png' alt="" class="ornament" draggable="true" data-key="o23"><input type="hidden" class="img" name="or_name" value="o23">
	   <img src='/resources/image/treeimg/오너24.png' alt="" class="ornament" draggable="true" data-key="o24"><input type="hidden" class="img" name="or_name" value="o24">
	   <img src='/resources/image/treeimg/오너25.png' alt="" class="ornament" draggable="true" data-key="o25"><input type="hidden" class="img" name="or_name" value="o25">
	   <img src='/resources/image/treeimg/오너26.png' alt="" class="ornament" draggable="true" data-key="o26"><input type="hidden" class="img" name="or_name" value="o26">
	   <img src='/resources/image/treeimg/오너27.png' alt="" class="ornament" draggable="true" data-key="o27"><input type="hidden" class="img" name="or_name" value="o27">
	</div>
	 
<form action="/tree/treeOrderForm" method='post' id="myfrom">
	<div id="container">
		<div id="tree-container">
		  <div id="tree-or-container">
		    <img alt="" src="/resources/image/treeimg/트리1.png">
		  </div>
		</div>
	</div>
	<div id="btnarea">
		<input type="button" id="re_btn" value="다시 꾸미기" onClick="window.location.reload()">
		<input type="button" id="save_btn" value="저장">
		<input type="submit" id="buy_btn" value="구매">
	</div>
</form>
</div>
<script src="https://html2canvas.hertzen.com/dist/html2canvas.min.js"></script>
<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.9.0/jquery.js"></script>
 <script>
  //  // 1. canvas 엘리먼트를 취득한다.
/*   const canvas = document.getElementById('myCanvas');

  // 2. 2d모드의 그리기 객체를 취득한다. => 이 객체를 통해 canvas에 그림을 그릴 수 있다.
   const ctx = canvas.getContext("2d");
 
  // 3. 이미지 객체 생성
  const img = new Image();
 
 // 4. 이미지 소스 설정g
 img.src = '/resources/image/treeimg/cartoon-tree.png';
 
  // 5. 이미지 로드이벤트- 콜백함수 등록
 img.onload = function(){
      // 이미지 그리기
      ctx.drawImage(img, 100, 100);
   }
  */
 
   
document.querySelectorAll("#or-container .ornament").forEach((element) => {
   element.addEventListener("dragstart", (event) => {

//        const id = event.target.dataset["ornament"];

//const posX = event.offsetX;
//const posY = event.offsetY;

const posX = event.offsetX;
const posY = event.offsetX; 
//event.dataTransfer.setData("text/plain", `${event.target.dataset["ornament"]},${posX});

       event.dataTransfer.setData("text/plain", `\${event.target.dataset.key},\${posX},\${posY}`);
       console.log(event.target.dataset.key);
     });
   });
   
 document.querySelector("#tree-container").addEventListener("dragover",(event) => {
   event.preventDefault();
   event.stopPropagation();
   console.log("dragover",event);
 });

 document.querySelector("#tree-container").addEventListener("drop", (event) => {
   event.preventDefault();
   event.stopPropagation();
   console.log("drop",event);

   const treeContainer = document.querySelector("#tree-container");
   

   console.log(treeContainer.offsetTop);
   console.log(treeContainer.offsetLeft);
 
   const [id, posX, posY] = event.dataTransfer.getData("text/plain").split(",");   

   const relativeX = event.pageX - treeContainer.offsetLeft - parseInt(posX);
   const relativeY = event.pageY - treeContainer.offsetTop - parseInt(posY);

   //const ornaId = event.dataTransfer.getData("text/plain");
   const ornaElement = document.querySelector(`#or-container .ornament[data-key=\${id}]`);
   const imgElement = document.querySelector(`#or-container .ornament[data-key=\${id}] + input`);
	

   const clonedOrnaElement = ornaElement.cloneNode();
   const clonedImgElement = imgElement.cloneNode();

   console.log(relativeX);
   console.log(relativeY);
   
   clonedOrnaElement.style.left = relativeX+"px";
   clonedOrnaElement.style.top = relativeY+"px";

   
   document.querySelector("#tree-container #tree-or-container").appendChild(clonedOrnaElement);
   document.querySelector("#tree-container #tree-or-container").appendChild(clonedImgElement);
// ornaElement.remove();
   console.log(clonedOrnaElement);
 });

 $("#save_btn").on("click", function(){
	 screenShot($("#container"));
 });
 function screenShot(target){
	 if(target != null && target.length>0){
         var t = target[0];
         html2canvas(t).then(function(canvas){
     	var myImg = canvas.toDataURL("image/png");
         //myImg = myImg.replace("data:image/png;base64,", "");
         console.log(myImg);
         
         let imgtag = document.createElement("input");
         imgtag.setAttribute('type','hidden');
         imgtag.setAttribute('name','myimg');
         imgtag.setAttribute('value',myImg);
         
         myfrom.appendChild(imgtag);
         });
	 }
 };
 

/*  /*  $("#buy_btn").on("click", function(e){
	 screenShot($("#container"));

 
 function screenShot(target){
	 if(target != null && target.length>0){
         var t = target[0];
         html2canvas(t).then(function(canvas){
     	var myImg = canvas.toDataURL("image/png");
         myImg = myImg.replace("data:image/png;base64,", "");
         console.log(myImg);
         e.preventDefault();
         //myImg = "dfsf";
         $.ajax({
             type:"POST",
             data:{"myImg":myImg},
			 dataType:"text",
             url:"",
             success:function(data){
                 console.log(data);
                 $('#myfrom').submit();
             },
             error:function(a,b,c){
                 alert("save_error");
             }
             
         });
	 	});
 	}
 }
  }); */ 
  
</script>
 <%@include file="../include/footer.jsp" %>
</body>
</html>