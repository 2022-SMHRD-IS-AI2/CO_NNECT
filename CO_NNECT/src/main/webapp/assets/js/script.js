// 디엠 문자 채팅창 함수
let fr = document.querySelector("#dm_fr");
let DmTxt = document.querySelector(".dm_text");
const DmText=()=>{
	DmTxt.style.display='block'
	fr.style.display='none'
}
fr.addEventListener('click',DmText)

let DmImg = document.querySelector(".txt>img");
const Dm_Img=()=>{
	fr.style.display='block'
	DmTxt.style.display='none'
}
DmImg.addEventListener('click',Dm_Img)

// 회원가입창 띄우기
let join = document.querySelector(".join");
let join_us = document.querySelector(".join_us");

const JoinShow=()=>{
	join_us.style.display='block'
	
}
join.addEventListener('click',JoinShow)