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
	<link rel="stylesheet" href="./assets/css/set_link.css">
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
					<p>이메일</p>
					<div class="input_links">
						<input type="text" name="set_email" placeholder="Co-nnect_ID@naver.com">
		
					</div>
					</div>
					<div class="set_email fb">
                    <p>웹사이트</p>
                    <div class="input_links">
					
						<input type="text" name="website" placeholder="www.portfolio.user.com">
					</div>
				</div>
		
				<div class="set_sns fb">


					<p>SNS 계정</p>
               

					<ul class="checkbox fa sns">
						<li><input type="checkbox" name="face"><p>페이스북</p></li>
                        <input type="text" name="website" placeholder="www.facebook.user.com">
					</ul>
                    <p></p>
                    <ul class="checkbox fa sns">
						<li><input type="checkbox" name="insta"><p>인스타그램</p></li>
                        <input type="text" name="website" placeholder="www.instagram.user.com">
					</ul>
                    <p></p>
                    <ul class="checkbox fa sns">
						<li><input type="checkbox" name="twit"><p>트위터</p></li>
                        <input type="text" name="website" placeholder="www.twitter.user.com">
					</ul>
                    <p></p>
                    <ul class="checkbox fa sns">
						<li><input type="checkbox" name="git"><p>깃허브</p></li>
                        <input type="text" name="website" placeholder="www.github.user.com">
					</ul>


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