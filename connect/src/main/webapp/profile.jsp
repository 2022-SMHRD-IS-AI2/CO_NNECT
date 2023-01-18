<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.smhrd.model.UserVO" %>
<%@page import="com.smhrd.model.UserDAO" %>
<%@page import="com.smhrd.model.PostVO" %>
<%@page import="com.smhrd.model.PostDAO" %>
<%@page import="com.smhrd.model.ProfileVO" %>
<%@page import="com.smhrd.model.ProfileDAO" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="./assets/css/style.css">
	<link rel="stylesheet" href="./assets/css/profile.css">
<script src="./assets/jquery/jquery-3.6.3.js"></script>
<script src="./assets/jquery/jquery-3.6.3.min.js"></script>
	<title>Document</title>
</head>
<body>

<%-- <%
UserVO loginUser = (UserVO)session.getAttribute("loginUser");
UserDAO dao = new UserDAO();
String nick = loginUser.getNick();
String email = loginUser.getEmail();

%> --%>

<!-- 자동로그인 관련 스크립트릿 -->
	<%
	HttpSession exitSession = request.getSession(false);
	
	String id = null;
	String email = null;
	String status = null;
	String skills = null;
	String programs = null;
	String introduction = null;
	String profile_pic = null;
	String nick = null;
	
	UserVO loginUser = (UserVO)session.getAttribute("loginUser");
	UserDAO dao = new UserDAO();
	ProfileVO ProfileUserSession = (ProfileVO)session.getAttribute("loginUserProfile");
	ProfileDAO dao2 = new ProfileDAO();
	
	if(exitSession!=null && loginUser!=null){
		System.out.println("세션이 있다");
		
		
		// System.out.print(loginMember.getAddress());
		
		id = loginUser.getId();
		email = loginUser.getEmail();
		
		nick = new PostDAO().getMyNick(id);
		
		ProfileVO ProfileUser = (ProfileVO)dao2.selectProfileEMAIL(email);
		
		status = ProfileUser.getStatus();
		skills = ProfileUser.getSkills();
		programs = ProfileUser.getPrograms();
		introduction = ProfileUser.getIntroduction();
		profile_pic = ProfileUser.getProfile_pic();
	}
	else if(exitSession == null || loginUser == null || ProfileUserSession==null){
		System.out.println("자동로그인이라 세션이 없다");
		// 쿠키 객체 가져오기
			Cookie[] cookies = request.getCookies();
		
		if(cookies!=null){
			System.out.println("쿠키값이 잇음");
		}else{
			System.out.println("쿠키값이 없음");
		}
			System.out.println("1");
			if(cookies!=null){
				for(Cookie c : cookies){ // for each 문
					if(c.getName().equals("loginId") && c.getValue()!="default"){
						System.out.println("2");
						/* System.out.print(c.getValue()); */
						System.out.println("아이디 쿠키 존재");
						
						
						loginUser = dao.setSessionID(c.getValue());
						session.setAttribute("loginUser", loginUser);
						
						id = loginUser.getId();
						email = loginUser.getEmail();
						
						nick = new PostDAO().getMyNick(id);
						ProfileVO ProfileUser = (ProfileVO)dao2.selectProfileEMAIL(email);
						
						status = ProfileUser.getStatus();
						skills = ProfileUser.getSkills();
						programs = ProfileUser.getPrograms();
						introduction = ProfileUser.getIntroduction();
						profile_pic = ProfileUser.getProfile_pic();
						
					}else if(c.getName().equals("loginEmail") && c.getValue()!="default"){
						System.out.println("3");
						/* System.out.print(c.getValue());*/
						System.out.println("이메일 쿠키 존재");
						
						
						loginUser = dao.setSessionEmail(c.getValue());
						session.setAttribute("loginUser", loginUser);
						
						id = loginUser.getId();
						email = loginUser.getEmail();
						
						nick = new PostDAO().getMyNick(id);
						ProfileVO ProfileUser = (ProfileVO)dao2.selectProfileEMAIL(email);
						
						status = ProfileUser.getStatus();
						skills = ProfileUser.getSkills();
						programs = ProfileUser.getPrograms();
						introduction = ProfileUser.getIntroduction();
						profile_pic = ProfileUser.getProfile_pic();
						
					}else if(nick==null && email==null){
						response.sendRedirect("login.jsp");
					}
			}
			}
				else if(cookies==null){
					System.out.println("4");
						System.out.println("쿠키도 세션도 없음");
						response.sendRedirect("login.jsp");
					}/* else{
						response.sendRedirect("login.jsp");
					} */
				
				}else{
					response.sendRedirect("login.jsp");
				}
	
	
	String path = (String)request.getAttribute("profilePicPath");
	String path2 = path+"\\";
	String realPath = path2+profile_pic;
	System.out.println(path2+profile_pic);
	%>
	
	<div class="wrap fc">
		<div class="l_wrap">
			<div class="logo">
				<img src="./assets/img/logo.png">
			</div>
			<!-- logo end -->
			<ul class="side_menu green">
				<li><a href="main.jsp"><img src="./assets/img/icons in color/menubar/home.png"></a></li>
				<li><a href="profile.jsp"><img src="./assets/img/icons in color/menubar/my_gr.png"></a></li>
				<li><a href="connectionjsp"><img src="./assets/img/icons in color/menubar/connections_gr.png"></a></li>
				<li><a href="set_profile.jsp"><img src="./assets/img/icons in color/menubar/setting_gr.png"></a></li>
				<li><a href="login.jsp"><img src="./assets/img/icons in color/menubar/exit_gr.png"></a></li>
			</ul>
			<!-- side_menu green end -->

			<ul class="side_menu white">
				<li><a href="main.jsp"><img src="./assets/img/icons in color/menubar/home.png"></a></li>
				<li><a href="profile.jsp"><img src="./assets/img/icons in color/menubar/my_gr.png"></a></li>
				<li><a href="connection.jsp"><img src="./assets/img/icons in color/menubar/connections.png"></a></li>
				<li><a href="set_profile.jsp"><img src="./assets/img/icons in color/menubar/setting.png"></a></li>
				<li><a href="login.jsp"><img src="./assets/img/icons in color/menubar/exit.png"></a></li>
			</ul>
		<!-- side_menu white end -->
		</div>
		<!-- l_wrap end -->

		<div class="c_wrap">
			<div class="search fc">
				<input class="s2" type="button" name="glass">
				<input class="s1" type="text" name="search" placeholder="Search">
			</div>
			<!-- search end -->

			<ul class="mybox fb">
				<li>
					<p>Current status</p>
					<p>
						<a href="set_profile.jsp"><%=status %></a>
					</p>
				</li>
				<li>
					<p>Skills</p>
					<p>
						<a href="set_profile.jsp"><%=skills %></a>
					</p>
				</li>
				<li>
					<p>Programs</p>
					<p>
						<a href="set_profile.jsp"><%=programs %></a>
					</p>
				</li>
			</ul>

			<div class="git_pool">
				<jsp:include page="./gitindex.jsp" />
			</div>

			<div class="contents fc">
				<div class="c_block fb">
					<div class="c_profile">
					<img src="./profilePic/<%=profile_pic%>">
					</div>
					<!-- c_profile end -->
					<div class="code_text fb">
						<div id="previewArea">
							<div id="preview"></div>
						</div>
				<form action="writePostControltoMyProfile" method="post" enctype="multipart/form-data">
					<textarea class="c_coding fb" name="textContent"></textarea>
					<label for="file" class="attach">
					
					<div class ="attach_li"><img src="./assets/img/icons/image-regular.svg"><input type="file" id="photo" accept=".jpg,.jpeg,.png,.gif" name="Photo"><span>Photo</span></div>
               <div class ="attach_li"><img src="./assets/img/icons/video-solid.svg"><input type="file" id="video" accept="video/*" name="Video"><span>Video</span></div>
               <div class ="attach_li"><img src="./assets/img/icons/code-solid.svg"><span>Code</span></div>
 
               <div class ="post_ds"><input type="button"  value="삭제" id="deleteFile" onclick="delFile(this)"></div>
               <div class ="post_ds"><input type="submit"  alt="제출"></div> 
					
					<!-- <div><img src="./assets/img/icons/image-regular.svg"><input type="file" id="photo" accept=".jpg,.jpeg,.png,.gif" name="Photo"></div>
					<div><img src="./assets/img/icons/video-solid.svg"><input type="file" id="video" accept="video/*" name="Video"></div>
					<div><img src="./assets/img/icons/paperclip-solid.svg"><input type="file" name="Attach"></div>
					<div><img src="./assets/img/icons/code-solid.svg"><input type="file" name="Code"></div>
					<div><input type="button"  value="삭제" id="deleteFile" onclick="delFile(this)"></div>
					<div><input type="submit"  alt="제출"></div> -->
					</label>
					<!-- attach end -->
				</form>
				</div>
					<!-- code text end -->
				</div>
				<!-- c_block end -->

				<div class="post_wrap">

				<jsp:include page="./profile_timeline.jsp" />
				</div>
				<!-- post_wrap end -->
			</div>
			<!-- contents end -->
		</div>
		<!-- c_wrap end -->

		<div class="r_wrap">
			<div class="profile_wrap fc">
				<div class="profile_img">
				<%if(profile_pic!=null){ %>
					<img src="./profilePic/<%=profile_pic%>">
					<%} else{%>
					<img alt="" src="">
					<%} %>
				</div>
				<div class="profile_info fc">
					<div class="info fc">
						<div class="info_tit">
							<h1> <%=nick %> </h1>
							<p><%=status %></p>
						</div>
						<div class="info_fn"><%=introduction %></div>
						<div class="info_skill"><%=programs %></div>
						<ul class="info_email">
							<li><a href="#"><img src=""><%=email %></a></li>
							<li><a href="#"><img src="">http://www.portfolio.gild.com</a></li>
						</ul>
						<ul class="info_sns fc">
							<li><a href=""><img src="./assets/img/icons in color/profile/insta.png"></a></li>
							<li><a href=""><img src="./assets/img/icons in color/profile/facebook.png"></a></li>
							<li><a href=""><img src="./assets/img/icons in color/profile/twitter.png"></a></li>
							<li><a href=""><img src="./assets/img/icons in color/profile/git.png"></a></li>
						</ul>
					</div>
				</div>
			<!-- profile_info end -->
			</div>
			<!-- profile_wrap -->
			<div class="dm_box fa">
			<div class="t_logo"><img src="./assets/img/t_logo.png"><span>TISTORY</span></div>
			<div class="ts_new">N</div>
		 </div>
						
				<div class="dm fc" id="DM">
					<ul class="dm_tit fa" id="DM_tit">
						<li><img src="./assets/img/icons in color/message/message.png"><span class="a"> Massage</span></li>
						<li>
							<img src="./assets/img/icons in color/message/Ellipse 12.png">
							<img src="./assets/img/icons in color/message/Ellipse 12.png">
							<img src="./assets/img/icons in color/message/Ellipse 12.png">
						</li>
					</ul>
					<div class="f_wrap fc" id="f_wrap">
						<div class="dm_text">
							<div class="txt">
								<img src="./assets/img/chevron-left-solid.svg">
							</div>
							<div class="chatting">
								<input name="a" placeholder="채팅을 입력하세요">
							</div>
						</div>
						<div id="dm_fr">
						<ul class="friend fb">
							<li></li>
							<li>Co-nnect_ID</li>
						</ul>
						<ul class="friend fb">
							<li></li>
							<li>Co-nnect_ID</li>
						</ul>
						<ul class="friend fb">
							<li></li>
							<li>Co-nnect_ID</li>
						</ul>
						<ul class="friend fb">
							<li></li>
							<li>Co-nnect_ID</li>
						</ul>
						<ul class="friend fb">
							<li></li>
							<li>Co-nnect_ID</li>
						</ul>
						<ul class="friend fb">
							<li></li>
							<li>Co-nnect_ID</li>
						</ul>
						<ul class="friend fb">
							<li></li>
							<li>Co-nnect_ID</li>
						</ul>
						<ul class="friend fb">
							<li></li>
							<li>Co-nnect_ID</li>
						</ul>
						<ul class="friend fb">
							<li></li>
							<li>Co-nnect_ID</li>
						</ul>
					</div>
					<!-- dm_fr -->
				</div>
				<!-- f_wrap end -->
				</div>
				<!-- dm end -->
		</div>
		<!-- r_wrap end -->
	</div>

	<script src="./assets/js/script.js"></script>
	<script src="./assets/js/logout.js"></script>
	<script src="./assets/js/fileUpload.js"></script>
	<script src="./assets/js/imgpreview.js"></script>

</body>
</html>