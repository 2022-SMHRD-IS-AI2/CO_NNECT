const modal = document.querySelectorAll(".modal");
const img = document.querySelectorAll(".img");
const modal_img = document.querySelectorAll(".modal_content");
const span = document.querySelectorAll(".close");

console.log(img.length);

for(let i=0;i<img.length;i++){
	
	function modalDisplay(text){
  modal[i].style.display = text;
}
	
	img[i].addEventListener('click', ()=>{
	modalDisplay("block");
	modal_img[i].src = img[i].src;
});
}


for(let i=0;i<img.length;i++){
	
		function modalDisplay(text){
  modal[i].style.display = text;
}
	span[i].addEventListener('click', ()=>{
  modalDisplay("none");
});
modal[i].addEventListener('click', ()=>{
  modalDisplay("none");
});

	
}


