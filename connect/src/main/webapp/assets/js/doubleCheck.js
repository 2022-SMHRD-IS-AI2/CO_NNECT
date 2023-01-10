
// 다음 칸을 입력하려고 넘어갔을 때 경고문구를 띄우려고 한다
// 따라서 이메일의 다음 칸인 아이디와 아이디의 다음칸인 이름 입력칸을 클릭하였을 때
// 문구가 뜨도록 설정하기 위해 아이디 입력칸과 닉네임 입력칸을 선택하여 가져와준다.
let email = document.querySelector("#ifIdClick");
let id = document.querySelector("#ifNameClick");
let submit = document.querySelector("#next");

let ec = document.querySelector("#doubleCE");
let ic = document.querySelector("#doubleCI");

function emailDC(){
    let inputE = $('#inputE').val();
    console.log(inputE);

    $.ajax({
        // 어디로 요청할 것인가? -> 중복확인 폼
        url : 'emailCheckControl',
        data : {'inputE':inputE},
        type : 'get',
        success:function(data){
            if(data === 'true'){
                $('#doubleCE').text('사용할 수 없는 이메일입니다.');
            }else{
                $('#doubleCE').text('사용 가능한 이메일입니다.');
            }
        
        },
        error: function(){
            alert("통신 실패!!");
        }
    });

};

function idDC(){
    let ifIdClick = $('#ifIdClick').val();
    console.log(ifIdClick);

    $.ajax({
        // 어디로 요청할 것인가? -> 중복확인 폼
        url : 'idCheckControl',
        data : {'ifIdClick':ifIdClick},
        type : 'get',
        success:function(data){
            if(data === 'true'){
                $('#doubleCI').text('사용할 수 없는 아이디입니다.');
            }else{
                $('#doubleCI').text('사용 가능한 아이디입니다.');
            }
        
        },
        error: function(){
            alert("통신 실패!!");
        }
    });

};

// 이메일과 아이디 둘 중 하나라도 중복이 있으면 제출버튼을 눌러도 제출 이벤트가 실행되지 않게 하는 함수
function preventSubmit(event){
	if(ec.innerText === '사용할 수 없는 이메일입니다.' || ic.innerText === '사용할 수 없는 아이디입니다.'){
		event.preventDefault();
	}
	
};

email.addEventListener('click',emailDC);
email.addEventListener('focus',emailDC);
id.addEventListener('click',idDC);
id.addEventListener('focus',idDC);
submit.addEventListener('click',preventSubmit);
submit.addEventListener('focus',preventSubmit);