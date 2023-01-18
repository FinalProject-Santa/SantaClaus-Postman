<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
  width: 100px;
  height: 100px;
}

#tree-container #tree-or-container{
  position: relative;

}

#tree-container #tree-or-container .ornament{
  position: absolute;
}

</style>
<title></title>
<body>
<div id="or-container">
   <img src='/resources/image/treeimg/snowman.png' alt="" class="ornament" draggable="true" data-key="o1" id="o1"><input type="hidden" class="or" name="o1" value="1">
   <img src='/resources/image/treeimg/star.png' alt="" class="ornament" draggable="true" data-key="o2" id="o2"><input type="hidden" class="or" name="o2" value="2">
   <img src='/resources/image/treeimg/wreath.png' alt="" class="ornament" draggable="true" data-key="o3" id="o3"><input type="hidden" class="or" name="o3" value="3">
</div>
  

<div id="tree-container">
  <div id="tree-or-container">
    <img src='/resources/image/treeimg/cartoon-tree.png' alt="" class="tree" onclick="makeTree();">
  </div>
</div>


<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.9.0/jquery.js"></script>
 <script>
 
 
 
   
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
	

   const clonedOrnaElement = ornaElement.cloneNode();

   console.log(relativeX);
   console.log(relativeY);
   
   clonedOrnaElement.style.left = relativeX+"px";
   clonedOrnaElement.style.top = relativeY+"px";

   
   document.querySelector("#tree-container #tree-or-container").appendChild(clonedOrnaElement);


   console.log(clonedOrnaElement);
 });

function makeTree(){
	var orId = $("div div .ornament").attr('id');
	console.log(orId);
};
 
 </script>
 
</body>
</html>