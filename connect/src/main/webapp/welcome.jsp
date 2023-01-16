<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Document</title>
	<link rel="stylesheet" href="./assets/css/style.css">
	<link rel="stylesheet" href="./assets/css/welcome.css">
</head>
<body>
<%
	String email = (String)request.getAttribute("email");
	String id = (String)request.getAttribute("id");

%>

	<div class="join_us">
		<div class="j_us fc">
			
			<div class="j_logo">
				<p>Co-nnect</p>
				<!-- 위에 글씨 지우고 로고 넣기~ -->
				<h2>코넥트와 함께 하시게 된 것을<br>
                    환영합니다!
                </h2>
                <p>정보를 확인해주세요</p>
			</div>
			<div class="j_line"></div>


			<form action="a" method="post" id="JOIN" class="fc">

                <table>
			<tr>
                <td>Email: <%=email %></td>
        </tr>
        <tr>
            <td></td>
        </tr>
        <tr>
            <td>ID: <%=id %></td>
        </tr>

            </table>
        
				<a href="main.jsp"><input type="text" value="로그인 하러 가기" id="next"></a>
				<!-- type값 submit으로 바꾸기 -->
        
			</form>



		</div>
	</div>
	<script src="./assets/js/login_join.js"></script>
</body>
</html>