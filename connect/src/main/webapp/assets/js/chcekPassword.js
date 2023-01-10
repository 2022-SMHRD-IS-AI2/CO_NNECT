let firstPw = document.querySelector("#firstPw");
let finalPw = document.querySelector("#finalPw");
let field = document.querySelector("#field");

let check = document.querySelector("#checkPw");

function checkPw(){
console.dir(field);
    if(firstPw.value != finalPw.value){
        check.innerText = "비밀번호가 다릅니다.";
    }else{
        check.innerText = "비밀번호가 일치합니다.";
    }

}

field.addEventListener('click',checkPw);
field.addEventListener('focus',checkPw);