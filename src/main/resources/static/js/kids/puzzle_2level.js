/**
 * 
 */
const container = document.querySelector(".image-container");
const mixButton = document.querySelector(".mix-button");
const restartButton = document.querySelector(".restart-button");
const mainButton = document.querySelector(".main-button");
const gameText = document.querySelector(".game-text");
const playTime = document.querySelector(".play-time");
const text = document.querySelector("#text_2");

const tileCount = 16; //타일의 개수

let tiles = [];

const dragged = {
    el: null,
    class: null,
    index: null
}

isPlaying = false;

var timeleft = 5;
var downloadTimer = setInterval(function(){
  if(timeleft <= 0){
    clearInterval(downloadTimer);
  }
  document.getElementById("progressBar").value = 5 - timeleft;
  timeleft -= 1;
}, 1000);

setGame();

//functions
function checkStatus(){
    const currentList = [...container.children];
    const unMatchedList = currentList.filter((child, index) => Number(child.getAttribute("data-index")) !== index)
    if(unMatchedList.length === 0){
        gameText.style.display = "block";
        isPlaying = false;
        mixButton.style.visibility = "hidden";
        text.innerHTML = "2단계까지 성공했어요!";
    }
}

function setGame(){
    isPlaying = true;
    container.innerHTML = "";
    tiles = creatImageTiles();
    tiles.forEach(tile=>container.appendChild(tile))
    setTimeout(()=>{
        container.innerHTML = "";
        shuffle(tiles).forEach(tile=>container.appendChild(tile))
    },6000)
}

function mix(){
    container.innerHTML = "";
    shuffle(tiles).forEach(tile=>container.appendChild(tile))
}

function creatImageTiles(){
    const tempArray = [];
    Array(tileCount).fill().forEach((_, i)=>{
        const li = document.createElement("li");
        li.setAttribute('class', 'litag');
        li.setAttribute("data-index", i);
        li.setAttribute('draggable', 'true');
        li.classList.add(`list${i}`);
        tempArray.push(li)
    }) //배열 생성
    return tempArray;
}

function shuffle(array){
    let index = array.length -1;
    while(index > 0){
        const randomIndex = Math.floor(Math.random()*(index+1));
        [array[index], array[randomIndex]] = [array[randomIndex], array[index]]
        index --;
    }
    return array;
}

//events
container.addEventListener('dragstart', e => {
    if(!isPlaying) return;
    const obj = e.target;
    dragged.el = obj;
    dragged.class = obj.className;
    dragged.index = [...obj.parentNode.children].indexOf(obj); //가지고 있는 원소가 불러짐
})
container.addEventListener('dragover', e => {
    e.preventDefault();
})
container.addEventListener('drop', e => {
    if(!isPlaying) return;
    const obj = e.target;

    if(obj.className !== dragged.class){
        let originPlace;
        let isLast = false;

        if(dragged.el.nextSibling){
            originPlace = dragged.el.nextSibling
        }else{
            originPlace = dragged.el.previousSibling
            isLast = true;
        }
        const droppedIndex = [...obj.parentNode.children].indexOf(obj);
        dragged.index > droppedIndex ? obj.before(dragged.el) : obj.after(dragged.el)
        isLast ? originPlace.after(obj) : originPlace.before(obj)
    }
    checkStatus();

})

mixButton.addEventListener('click', () => {
    mix();
})

restartButton.addEventListener('click', () => {
    gameText.style.display = "none";
    mixButton.style.visibility = "visible";
    text.innerHTML = "5초 뒤에 퍼즐이 섞여요!";

    var timeleft = 5;
    var downloadTimer = setInterval(function(){
    if(timeleft <= 0){
        clearInterval(downloadTimer);
    }
    document.getElementById("progressBar").value = 5 - timeleft;
    timeleft -= 1;
    }, 1000);

    setGame();
})