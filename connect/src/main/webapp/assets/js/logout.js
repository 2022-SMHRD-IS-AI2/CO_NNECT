let logout = document.querySelector("#logout");


function logoutFunc(){

    $.ajax({

        url : 'LogOutControl',
        type : 'get',
        success:function(){
            console.log("로그아웃 완료");
            window.location.href = './login.jsp';
        },
        error:function(){
            console.log("로그아웃 실패");
        }



    })



};

logout.addEventListener("click",logoutFunc);
