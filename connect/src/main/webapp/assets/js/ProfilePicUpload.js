const myFiles = document.querySelector("#photo");
const delFiles = document.querySelector("#deleteFile");
/*const sendText = document.querySelector("#sendText");
const submit = document.querySelector("#submit"); */

let fileNums = 0;
let fileName = null;
let text=null;
function logFilenames(){
  const fileInput = document.querySelector("#photo");
  const files = fileInput.files;
  const fileListLength = files.length;
  for (let i = 0; i < fileListLength; i++) {
    console.log(files.item(i).name);
    fileName = files.item(i).name;
  }
  sendFileName();
  
}

/* 파일 이름을 보내주기 */

function sendFileName(){
	console.log("파일이름 보내기")
	if (fileName != null){
	    $.ajax({
        // 어디로 요청할 것인가? -> 중복확인 폼
        url : 'ProfilePicControl',
        data : {'ProfilePicName':fileName},
        type : 'get',
        success:function(){
            console.log("파일이름 전송 완료");
        
        },
        error: function(){
            alert("통신 실패!!");
        }
    });
	
	
}
	
}


/*function sendText(){
	console.log("텍스트 보내기")
		
	    $.ajax({
        // 어디로 요청할 것인가? -> 중복확인 폼
        url : 'getFileNameControl',
        data : {'sendText':sendText},
        type : 'get',
        success:function(){
            console.log("텍스트 전송 완료");
            console.log(sendText);
        
        },
        error: function(){
            alert("통신 실패!!");
        }
    });
	
	

} */

/* 첨부파일 삭제 */
function delFile(e){
	console.log("파일삭제");
    let this_fileTR = e.parentNode.parentNode.parentNode; //console.log(this_fileTR);
    if(fileNums <= 1){
        return false;
    }else{
        this_fileTR.parentNode.removeChild(this_fileTR);
        fileNums--;
    }//if,else
}//delFile

/*function fileReset( form )
{
    console.log("삭제할거야");
    form.upload.select();    
    document.selection.clear();
}*/
// delFiles.addEventListener("click",fileReset);
myFiles.addEventListener("change", logFilenames);
/*submit.addEventListener("submit",sendText); */