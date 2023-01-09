
// 다음 칸을 입력하려고 넘어갔을 때 경고문구를 띄우려고 한다
// 따라서 이메일의 다음 칸인 아이디와 아이디의 다음칸인 이름 입력칸을 클릭하였을 때
// 문구가 뜨도록 설정하기 위해 아이디 입력칸과 닉네임 입력칸을 선택하여 가져와준다.
let email = document.querySelector("#ifIdClick");
let id = document.querySelector("#ifNameClick");

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
                $('.doubleC:first-child').text('사용할 수 없는 이메일입니다.');
            }else{
                $('.doubleC:first-child').text('사용 가능한 이메일입니다.');
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
                $('.doubleC:nth-child(2)').text('사용할 수 없는 아이디입니다.');
            }else{
                $('.doubleC:nth-child(2)').text('사용 가능한 아이디입니다.');
            }
        
        },
        error: function(){
            alert("통신 실패!!");
        }
    });

};

email.addEventListener('click',emailDC);
id.addEventListener('click',idDC);