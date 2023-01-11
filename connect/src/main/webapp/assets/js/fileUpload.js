const myFiles = document.querySelector("#photo");
const delFiles = document.querySelector("#deleteFile");

let fileNums = 0;

function logFilenames(){
  const fileInput = document.querySelector("#photo");
  const files = fileInput.files;
  const fileListLength = files.length;
  for (let i = 0; i < fileListLength; i++) {
    console.log(files.item(i).name);
  }
}

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