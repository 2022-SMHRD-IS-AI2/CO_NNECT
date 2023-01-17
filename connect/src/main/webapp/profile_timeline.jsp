<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List" %>	
<%@page import="java.util.ArrayList"%>
<%@page import="com.smhrd.model.UserVO" %>
<%@page import="com.smhrd.model.UserDAO" %>
<%@page import="com.smhrd.model.PostVO" %>
<%@page import="com.smhrd.model.PostDAO" %>
<%@page import="com.smhrd.model.ProfileVO" %>
<%@page import="com.smhrd.model.ProfileDAO" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

	<link rel="stylesheet" href="./assets/css/style.css">
	<link rel="stylesheet" href="./assets/css/timeline.css">
	<script src="./assets/jquery/jquery-3.6.3.js"></script>
	<script src="./assets/jquery/jquery-3.6.3.min.js"></script>
	
<title>Connect Everyone</title>
</head>
<body>

	<!-- 세션에서 유저 정보 얻어오기 -->
	<%
	
	UserVO loginUser = (UserVO)session.getAttribute("loginUser");
	UserDAO dao = new UserDAO();
	ProfileVO ProfileUserSession = (ProfileVO)session.getAttribute("loginUserProfile");
	ProfileDAO dao2 = new ProfileDAO();
	
	String status = null;
	String skills = null;
	String programs = null;
	String introduction = null;
	String profile_pic = null;
	/* 세션에서 얻어올 유저 정보가 없을 경우 */
	if(loginUser==null){
		
		/* 로그인부터 하고 오세요~ */
		response.sendRedirect("login.jsp");
	}else{
		
		/* 
		세션에서 얻어온 유저 정보가 있을 경우 
		일단 아이디 이메일 가져오게 함~
		아이디 이메일을 제외한 유저정보 테이블에 있는 해당 유저의 값 다 가져올 수 있음.
		*/
		
		String id = loginUser.getId();
		String email = loginUser.getEmail();
		
		System.out.println("타임라인페이지 세션확인 : "+id); 
		
		ProfileVO ProfileUser = (ProfileVO)dao2.selectProfileEMAIL(email);
		
		status = ProfileUser.getStatus();
		skills = ProfileUser.getSkills();
		programs = ProfileUser.getPrograms();
		introduction = ProfileUser.getIntroduction();
		profile_pic = ProfileUser.getProfile_pic();
		
		/* 작성글을 리스트 형식으로 싹 가져오기 */
		List<PostVO> vo = new PostDAO().showTimelineOnlyMe(id);
		String nick = new PostDAO().getMyNick(id);
		
		/* 테스트로 넣었었다
		
		회원가입을 막 한 상태에서 진입한 경우 작성글이 없어서 타임라인이 불러와지지 않기 때문에
		오류가 생김~
		
		System.out.println("vo 길이 : "+vo.size());
		System.out.println("vo 길이 : "+vo.get(0));
		System.out.println("vo 자체출력 : "+vo); 
		
		*/
		
		String path = (String)request.getAttribute("profilePicPath");
		String path2 = path+"\\";
		String realPath = path2+profile_pic;
		System.out.println("진짜경로"+path2+profile_pic);
	
	%>
				
					<div class="scroll">
					
					<% if(vo!=null){
            		for(int i=0;i<vo.size();i++){
            		
            			String textContent = vo.get(i).getContent() ;
            			String postWriter = vo.get(i).getId();
            		
            			session.setAttribute("text", textContent);
            		%>
						
							
							<%if(vo.get(i).getFilename()!=null){%>
							<div class="post">
							<div class="info_tit2">
								<div class="c_profile2">
									<img src="./profilePic/<%=profile_pic%>">
								</div>
								<a href=""><h1><%=nick %></h1></a>
							</div>
							<div class="post_code">
 							<% if(i==1){%>
								<iframe src="https://codesandbox.io/embed/vanilla-vanilla?fontsize=14&hidenavigation=1&theme=dark"
     style="width:100%;height:500px; border:0;border-radius: 4px; overflow:hidden;"
     title="Vanilla"
     allow="accelerometer; ambient-light-sensor; camera; encrypted-media; geolocation; gyroscope; hid; microphone; midi; payment; usb; vr; xr-spatial-tracking"
     sandbox="allow-forms allow-modals allow-popups allow-presentation allow-same-origin allow-scripts"
   ></iframe><% }%> 
							</div>
							<div id="cotent_area">
							<div class="thisImg">
								<img class="img" src="./file/<%=vo.get(i).getFilename()%>">
								<p class="guidenceText">클릭하여 원본 보기</p>
							</div>
							<div class="modal">
									<span class="close">&times;</span>
									<img class="modal_content" id="img01">
								  </div>
							<div id="text"><textarea readonly class="c_coding2 fb" name="textContent"><c:out escapeXml="false" value="${text}" /></textarea></div>
							<!-- cotent_area end -->
							</div>
							<div class="post_tag fb">
							<%if(vo.get(i).getHashtag()!=null){%>
							<p><%=vo.get(i).getHashtag() %></p>
								<%}else{ %>
							<p>해시태그</p><%} %>
														<ul class="post_good fa">
									<li><img src="./assets/img/like.png"><%=vo.get(i).getLike()%></li>
									<li ><img class="cmtBtn" src="./assets/img/comment.png"></li>
									<li><img src="./assets/img/scrap.png"></li>
								</ul>
							</div>
							<!-- post_tag end -->
																			<form action="">
								<div class="pimgNick2">
									<div class="profile_img_cmt2"><img src="./profilePic/<%=profile_pic%>"></div>
									<span><%=loginUser.getNick() %></span>
									
										<textarea name="commentText" id="commentText"></textarea>
										
									</div>
								</form>
								
							<div class="commentArea">
								
								<ul class="commentUl">
									<li class="commentList">
										<div class="pimgNick">
											<div class="profile_img_cmt"><img src=""></div>
											<span>사서(닉네임)</span>
											<p>댓글 내용입니다 아 작업하기 존나 싫다 진짜 이게 ㅎ현실임?</p>
										</div>
									</li>
									<li class="commentList">
										<div class="pimgNick">
											<div class="profile_img_cmt"><img src="./assets/img/KakaoTalk_20221129_154645668.png"></div>
											<span>이딴게현실</span>
											<p>정신차리고 작업이나 해라 이녀석아,,,</p>
										</div>
									</li>
								</ul>
								
							</div>
							</div>
							
							<%}else{ %>
							<div class="post">
							<div class="info_tit2">
								<div class="c_profile2">
								<img src="./profilePic/<%=profile_pic%>">
								</div>
								<a href=""><h1><%=nick %></h1></a>
							</div>
							<div class="post_code">
						<% if(i==13){%>
								<iframe src="https://codesandbox.io/embed/vanilla-vanilla?fontsize=14&hidenavigation=1&theme=dark"
     style="width:100%; height:500px; border:0; border-radius: 4px; overflow:hidden;"
     title="Vanilla"
     allow="accelerometer; ambient-light-sensor; camera; encrypted-media; geolocation; gyroscope; hid; microphone; midi; payment; usb; vr; xr-spatial-tracking"
     sandbox="allow-forms allow-modals allow-popups allow-presentation allow-same-origin allow-scripts"
   ></iframe><% }%> 
							</div>
							<div id="cotent_area">
							<div id="textnoImg"><textarea readonly class="c_coding2 fb" name="textContent"><c:out escapeXml="false" value="${text}" /></textarea></div>
							</div>
							<div class="post_tag fb">
							<%if(vo.get(i).getHashtag()!=null){%>
								<p><%= vo.get(i).getHashtag() %></p>
								<%}else{ %>
								<p>해시태그</p><%} %>
								<ul class="post_good fa">
									<li><img src="./assets/img/post_icons/heart-regular.svg"></li>
									<li>졓아 <%=vo.get(i).getLike()%></li>
									<li>댓글</li>
									<li>슼랩</li>
								</ul>
							</div>
							</div>
							<!-- post_tag end -->
						 <%} } }else if(vo.size() == 0){%>
						 <h1>이런! 아직 작성한 글이 없네요. 세상을 향한 위대한 발자취를 남겨보세요!</h1>
							<%}
							}%>
							
						</div>
						
						
				<!-- scroll end -->
				<script src="./assets/js/mouseOverModal.js"></script>
				<script src="./assets/js/commentList.js"></script>
</body>
</html>