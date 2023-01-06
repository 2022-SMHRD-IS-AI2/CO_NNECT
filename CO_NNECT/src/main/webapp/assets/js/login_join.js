// 프로필 작성란 띄우기
let next = document.querySelector("#next");
let join_setting = document.querySelector(".join_setting");

const setting=()=>{
	join_setting.style.display='block'
}
next.addEventListener('click',setting)

// 회원가입 창으로 돌아가기
let back = document.querySelector("#back");

const join_us=()=>{
	join_setting.style.display='none'
}
back.addEventListener('click',join_us)

// 로그인 창으로 돌아가기 (닫기 버튼)
let join_us_close = document.querySelector("#join_us_close");
const JoinClose=()=>{
	join_us.style.display='none'
}
join_us_close.addEventListener('click',JoinClose)
