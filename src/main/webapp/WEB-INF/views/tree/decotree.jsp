<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<style>
.ornament{
  width: 90px;
  height: 90px;
  cursor:pointer;
}

#tree-container #tree-or-container{
  position: relative;

}
 
#tree-container #tree-or-container .ornament{
  position: absolute;
}

#or-container{
	width: 300px;
	height: 500px;
	float:right;
	display: grid;
	grid-template-columns: 100px 100px 100px;
	grid-template-rows: 100px 100px 100px;
}
#container{
	width: 500px;
	float:left;
}
#btnarea{
	position:absolute
}

</style>
<title></title>
<body style="margin: 100px auto;">
<div style="width:1200px;">
	<div id="or-container" style="border: 2px solid black;">
	   <img src='/resources/image/treeimg/snowman.png' alt="" class="ornament" draggable="true" data-key="o1"><input type="hidden" class="img" name="or_name" value="o1">
	   <img src='/resources/image/treeimg/snowman.png' alt="" class="ornament" draggable="true" data-key="o1"><input type="hidden" class="img" name="or_name" value="o1">
	   <img src='/resources/image/treeimg/snowman.png' alt="" class="ornament" draggable="true" data-key="o1"><input type="hidden" class="img" name="or_name" value="o1">
	   <img src='/resources/image/treeimg/snowman.png' alt="" class="ornament" draggable="true" data-key="o1"><input type="hidden" class="img" name="or_name" value="o1">
	   <img src='/resources/image/treeimg/star.png' alt="" class="ornament" draggable="true" data-key="o2"><input type="hidden" class="img" name="or_name" value="o2">
	   <img src='/resources/image/treeimg/star.png' alt="" class="ornament" draggable="true" data-key="o2"><input type="hidden" class="img" name="or_name" value="o2">
	   <img src='/resources/image/treeimg/star.png' alt="" class="ornament" draggable="true" data-key="o2"><input type="hidden" class="img" name="or_name" value="o2">
	   <img src='/resources/image/treeimg/star.png' alt="" class="ornament" draggable="true" data-key="o2"><input type="hidden" class="img" name="or_name" value="o2">
	   <img src='/resources/image/treeimg/star.png' alt="" class="ornament" draggable="true" data-key="o2"><input type="hidden" class="img" name="or_name" value="o2">
	   <img src='/resources/image/treeimg/wreath.png' alt="" class="ornament" draggable="true" data-key="o3"><input type="hidden" class="img" name="or_name" value="o3">
	   <img src='/resources/image/treeimg/wreath.png' alt="" class="ornament" draggable="true" data-key="o3"><input type="hidden" class="img" name="or_name" value="o3">
	   <img src='/resources/image/treeimg/wreath.png' alt="" class="ornament" draggable="true" data-key="o3"><input type="hidden" class="img" name="or_name" value="o3">
	   <img src='/resources/image/treeimg/wreath.png' alt="" class="ornament" draggable="true" data-key="o3"><input type="hidden" class="img" name="or_name" value="o3">
	   <img src='/resources/image/treeimg/wreath.png' alt="" class="ornament" draggable="true" data-key="o3"><input type="hidden" class="img" name="or_name" value="o3">
	   <img src='/resources/image/treeimg/wreath.png' alt="" class="ornament" draggable="true" data-key="o3"><input type="hidden" class="img" name="or_name" value="o3">
	</div>
	 
		<form action="/tree/treeOrder" method='post' id="myfrom">
	<div id="container" style="border: 1px solid black;">
		<div id="tree-container">
		  <div id="tree-or-container">
		    <img alt="" src="/resources/image/treeimg/cartoon-tree.png">
		  </div>
		</div>
	</div>
	<div id="btnarea">
		<input type="submit" id="buy_btn" value="구매">
		<input type="button" id="save_btn" value="저장">
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
 
</body>
</html>