const commentBtn = document.querySelectorAll(".cmtBtn");
const commentArea = document.querySelectorAll(".commentArea");

const commentUl = document.querySelectorAll(".commentUl");




for(let i=0;i<commentBtn.length;i++){
function commentDisplay(text){
    
let curenntHeight = commentArea[i].clientHeight;
let changeHeight = commentArea[i].clientHeight;


    if(commentUl[i].style.display=="block"){
        commentUl[i].style.display = text;
        commentArea[i].style.display = text;
        curenntHeight = commentUl[i].clientHeight;
        commentArea[i].style.height = changeHeight;
        
    }else{
        commentUl[i].style.display = "block";
        commentArea[i].style.display = "block";
        curenntHeight = commentUl[i].clientHeight;
        changeHeight = commentArea[i].clientHeight;

        commentArea[i].style.height = curenntHeight;
    }
  }

//   function commentHeight(text){
    
    
// console.log("텍스트영역 현재 높이 : "+changeHeight);

// if(curenntHeight!=changeHeight){
//     commentUl.style.height = "0";
//     curenntHeight = commentArea.clientHeight;
//     console.log("텍스트영역 바꿀 높이 : "+curenntHeight);
// }

// }
commentBtn[i].addEventListener("click",()=>{commentDisplay("none")});
}