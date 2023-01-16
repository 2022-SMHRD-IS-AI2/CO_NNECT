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
	<link rel="stylesheet" href="./assets/css/password_change.css">
</head>
<body>


	<!-- 정보수정 -->



	<div class="setting_l">

		<div class="join_setting">
	
			<div class ="logo_blank">
				<p></p>
			</div>
			
		<div class="setting_menu">
	
			<div class ="set_m">
			<div class ="setting_l1">
				<a href="set_profile.jsp"><p2>프로필 편집<p2></a>
			</div>
	
			<div class ="setting_l1">
				<a href="set_link.jsp"><p2>앱&웹 링크변경<p2></a>
			</div>
	
			<div class ="setting_l1">
				<a href="password_change.jsp"><p2>비밀번호 변경<p2></a>
			</div>
	
			<div class ="setting_l1">
				<a href="set_account.jsp"><p2>계정관리<p2></a>
			</div>
	
	
		</div>
	<div class="back">
		<a href ="main.jsp" class="back-green">  <img src ="./assets/img/icons/left_errow_green.png"></a>
		<a href ="main.jsp" class="back-white">  <img src ="./assets/img/icons/left_errow_white.png"></a>
		
	</div>
		</div>

		<div class="s_us fc">
	
	
			<form action="a" method="post" id="JOIN" class="fc">

   
			

				<div class="set_email fb">
					<p>현재 비밀번호</p>
					<div class="input_links">
						<input type="text" name="set_email" placeholder="현재 비밀번호">
		
					</div>
                    <p>새 비밀번호</p>
                    <div class="input_links">
					
						<input type="text" name="website" placeholder="영문, 숫자, 8자리 이상">
					</div>
                    <p>비밀번호 재확인</p>
                    <div class="input_links">
					
						<input type="text" name="website" placeholder="비밀번호 재확인">
					</div>
				</div>


				<div class="set_btn fb">
				<!-- <input type="text" value="뒤로가기" id="back"> -->
				<a href="login.jsp"><input type="submit" value="저장" id="submit"></a>
				<!-- type값 submit으로 바꾸기 -->
			</div>
			</form>
		</div>
	</div>


</div>





	<script src="./assets/js/login_join.js"></script>
</body>
</html>