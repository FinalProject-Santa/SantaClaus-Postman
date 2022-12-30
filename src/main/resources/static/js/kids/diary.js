/**
 * 
 */
const canvas = document.getElementById("jsCanvas");
const ctx = canvas.getContext('2d');
const colors = document.getElementsByClassName("jsColor");
const range = document.getElementById("jsRange");
const mode = document.getElementById("jsMode");
const saveBtn = document.getElementById("jsSave");
const erase = document.getElementById("jsErase");
const success = document.getElementById("success_btn");

const INITAL_COLOR = "#000000";
const CANVAS_SIZE_WIDTH = 1000;
const CANVAS_SIZE_HEIGHT = 500;

ctx.strokeStyle = "#2c2c2c";

canvas.width = CANVAS_SIZE_WIDTH;
canvas.height = CANVAS_SIZE_HEIGHT;

ctx.fillStyle = "white";
ctx.fillRect(0, 0, CANVAS_SIZE_WIDTH, CANVAS_SIZE_HEIGHT);

ctx.strokeStyle = INITAL_COLOR;
ctx.fillStyle = INITAL_COLOR;
ctx.lineWidth = 2.5; //라인 굵기

let painting = false;
let filling = false;

function stopPainting(){
    painting = false;
}

function startPainting(){
    painting = true;
}

function onMouseMove(event){
    const x = event.offsetX;
    const y = event.offsetY;
    if(!painting){
        ctx.beginPath();
        ctx.moveTo(x, y);
    }else{
        ctx.lineTo(x, y);
        ctx.stroke();
    }
}

function handleColorClick(event){
    const color = event.target.style.backgroundColor;
    ctx.strokeStyle = color;
    ctx.fillStyle = color;
}

function handleRangeChange(event){
    const size = event.target.value;
    ctx.lineWidth = size;
}

function handleModeClick(){
    if(filling === true){
        filling = false;
        mode.innerText = "Fill";
    }else{
        filling = true;
        mode.innerText = "Paint";
    }
}

function handleCanvasClick(){
    if(filling){
        ctx.fillRect(0, 0, CANVAS_SIZE_WIDTH, CANVAS_SIZE_HEIGHT);
    }
}

function handleSaveClick(){
    const image = canvas.toDataURL("image/png");
    const link = document.createElement("a");
    link.href = image;
    link.download = "PaintJS[EXPORT]";
    link.click();
}

function eraseClick(){
    ctx.strokeStyle = "white";
}

if(canvas){
    canvas.addEventListener("mousemove", onMouseMove);
    canvas.addEventListener("mousedown", startPainting); //페인팅 시작
    canvas.addEventListener("mouseup", stopPainting); //페인팅 멈춤
    canvas.addEventListener("mouseleave", stopPainting); //페인팅 멈춤
    canvas.addEventListener("click", handleCanvasClick);
}

Array.from(colors).forEach(color =>
    color.addEventListener("click", handleColorClick));

if(range){
    range.addEventListener("input", handleRangeChange);
}

if(mode){
    mode.addEventListener("click", handleModeClick);
}

if(saveBtn){
    saveBtn.addEventListener("click", handleSaveClick);
}

if(erase){
    erase.addEventListener("click", eraseClick);
}

const open = () => {
    document.querySelector(".modal").classList.remove("hidden");
}

// const close = () => {
//     document.querySelector(".modal").classList.add("hidden");
// }

document.querySelector("#success_btn").addEventListener("click", open);

//document.querySelector(".closeBtn").addEventListener("click", close);
//document.querySelector(".bg").addEventListener("click", close);

// function onMouseUp(event){
//     stopPainting();
// }