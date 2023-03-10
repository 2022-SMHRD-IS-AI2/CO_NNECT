<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Document</title>
	<link rel="stylesheet" href="./assets/css/style.css">
	<link rel="stylesheet" href="./assets/css/join.css">
	<script src="./assets/jquery/jquery-3.6.3.js"></script>
	<script src="./assets/jquery/jquery-3.6.3.min.js"></script>
<title>Join us!</title>
</head>
<body>
	<div class="join_us">
			<div class="j_us fc">
				<div id="join_us_close"><a href="login.jsp">x</a></div>
				<div class="j_logo">
					<p>Co-nnect</p>
					<!-- 위에 글씨 지우고 로고 넣기~ -->
					<p>코넥트를 활용하여 <br>
						여러분의 재능을 자랑하세요.</p>
				</div>
				<div class="j_line"></div>
				<form action="JoinCon" method="post" id="JOIN" class="fc">
					<input type="text" name="email" id="inputE" placeholder="이메일 주소를 입력하세요">
					<span id="doubleCE"></span>
					<input type="text" name="id"  id="ifIdClick" placeholder="아이디">
					<span id="doubleCI"></span>
					<input type="text" name="nick"  id="ifNameClick" placeholder="사용자 이름">
					<input type="password" name="pw" id="firstPw" placeholder="비밀번호">
					<input type="password" name="finalPw" id="finalPw" placeholder="비밀번호 재확인">
					<span id="checkPw"></span>
					<!-- <input type="text" name="field" id="field" placeholder="분야 (ex> Front End Developer) "> -->
					<a href="#"><input type="submit" value="제출" id="next"></a>
					<!-- type값 submit으로 바꾸기 -->
				</form>
			</div>
		</div>
		
		<!-- 제이쿼리 스크립트 -->
		
		
		<!-- 로그인 애니메이션 스크립트인거같은데 확인 필요 -->
		<script src="./assets/js/login_join.js"></script>
		
		<!-- 중복확인 스크립트 -->
		<script src="./assets/js/doubleCheck.js"></script>
		<script src="./assets/js/chcekPassword.js"></script>
</body>
</html>