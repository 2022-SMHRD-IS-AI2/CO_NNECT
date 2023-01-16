<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="com.smhrd.model.UserVO" %>
<%@page import="com.smhrd.model.UserDAO" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Connect, 모두를 연결하다</title>
	<link rel="stylesheet" href="./assets/css/style.css">
	<link rel="stylesheet" href="./assets/css/set_profile.css">
	<script src="./assets/jquery/jquery-3.6.3.js"></script>
	<script src="./assets/jquery/jquery-3.6.3.min.js"></script>
</head>
<body>
<%

UserVO loginUser = (UserVO)session.getAttribute("loginUser");
UserDAO dao = new UserDAO();

String id = loginUser.getId();
String nick = loginUser.getNick();
String email = loginUser.getEmail();

%>

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
		<a href ="profile.jsp" class="back-green">  <img src ="./assets/img/icons/left_errow_green.png"></a>
		<a href ="profile.jsp" class="back-white">  <img src ="./assets/img/icons/left_errow_white.png"></a>
		
	</div>
		</div>


		<div class="s_us fc">
	
	
			<form action="form_result.jsp" method="post" id="setProfileForm" class="fc" enctype="multipart/form-data">
				<div class="set_profile fb">




					<div class="s_pro">
						<!-- <img alt="프로필사진" src="./assets/img/필릭스화보.jpg"> -->
					</div>
					<ul class="set_id fs">
						<li><%=id %></li>

						<div class="upload">
						<button type="button" class = "btn-warning">
							<i class = "file-upload"></i>프로필 사진 변경하기
							<input type="file" name ="file">
							</button>
						</div>
					
					<!-- 클릭시 프로필 사진 업로드 + 사진 크기 조절 들어가야함!! 220*220px이 기준-->
						</ul>



					
						<!-- <a href="login.html"><p>x</p></a> -->
				
				</div>

				<div class="set_name fb">
					<p>닉네임</p>
					<input type="text" name="set_name" placeholder="닉네임">
				</div>

				<div class="set_devel fb">
					<p>분야</p>
					<input type="text" name="set_devel" placeholder="Front End Developer">
				</div>

				<div class="set_intro fb">
					<p>소개</p>
					<textarea name="set_intro"></textarea>
				</div>

				<div class="set_skill fb">
					<p>언어</p>
					<input type="text" name="set_skill" placeholder="#HTML #CSS #JS #PYTHON etc..">
				</div>



				<div class="set_btn fb">
				<!-- <input type="text" value="뒤로가기" id="back"> -->
				<a href="profile.jsp"><input type="submit" value="저장" id="submit"></a>
				<!-- type값 submit으로 바꾸기 -->
			</div>
			</form>
		</div>
	</div>


</div>





	<script src="./assets/js/login_join.js"></script>
	<script src="./assets/js/profile_pic_preview.js"></script>
</body>
</html>