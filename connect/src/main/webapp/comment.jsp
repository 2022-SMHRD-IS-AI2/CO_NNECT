<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List" %>	
<%@page import="java.util.ArrayList"%>
    <%@page import="com.smhrd.model.UserVO" %>
<%@page import="com.smhrd.model.UserDAO" %>
<%@page import="com.smhrd.model.PostVO" %>
<%@page import="com.smhrd.model.PostDAO" %>
<%@page import="com.smhrd.model.ProfileVO" %>
<%@page import="com.smhrd.model.ProfileDAO" %>
<%@page import="com.smhrd.model.CommentVO" %>
<%@page import="com.smhrd.model.CommentDAO" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">


	<link rel="stylesheet" href="./assets/css/style.css">
	<link rel="stylesheet" href="./assets/css/timeline.css">
	<script src="./assets/jquery/jquery-3.6.3.js"></script>
	<script src="./assets/jquery/jquery-3.6.3.min.js"></script>
<title>Insert title here</title>
</head>
<body>

				<%
				UserVO loginUser = (UserVO)session.getAttribute("loginUser");
				ProfileVO ProfileUserSession = (ProfileVO)session.getAttribute("loginUserProfile");
				
				ProfileDAO dao2 = new ProfileDAO();
				
				String status = ProfileUserSession.getStatus();
				String skills = ProfileUserSession.getSkills();
				String programs = ProfileUserSession.getPrograms();
				String introduction = ProfileUserSession.getIntroduction();
				String profile_pic = ProfileUserSession.getProfile_pic();
				
				List<PostVO> vo = new PostDAO().showTimeline();
				
				
				/* List<CommentVO> vo = new CommentDAO().selectCmt(num); */
				
				%>
				
				<div class="commentArea">
								<% if(vo!=null){
            		for(int i=0;i<vo.size();i++){
            			
            			String textContent = vo.get(i).getContent() ;
            			/* String postWriter = vo.get(i).getId(); */
            			int num = (vo.get(i).getSeq()).intValue();
            			
            			List<CommentVO> cmtvo = new CommentDAO().selectCmt(num);
            			
            			/*  String wrtierid = new PostDAO().whoIsWriter(num);
            			String postWriter = new PostDAO().getMyNick(wrtierid);
            			
            			
            			String userProfilePic = new ProfileDAO().getProfilePic(wrtierid);
            			
            			session.setAttribute("text", textContent); */ %>
								<ul class="commentUl">
            			<% if(cmtvo!=null){
            			for(int t=0;t<cmtvo.size();t++){
            				
            				String id = cmtvo.get(t).getMem_id();
            				System.out.println("왜 아이디 안가져와 "+id);
            				/* String nick = new UserDAO().selectNick(id); */
            		%>
									<li class="commentList">
										<div class="pimgNick">
											<div class="profile_img_cmt"><img src="./assets/img/652583_650587_1823.jpg"></div>
											<span><%=id %></span>
											<p><%=cmtvo.get(t).getCmt_content() %></p>
										</div>
									</li>
									
								
								<%}}else{%>
									<li class="commentList">
										<div class="pimgNick">
											<div class="profile_img_cmt"><img src="./assets/img/KakaoTalk_20221129_154645668.png"></div>
											<span>작성자</span>
											<p>댓글이 없습니다. 첫번째 댓글을 남겨보세요.</p>
										</div>
									</li>
									
									
									
									
								<% }}} %>
								</ul>
							</div>
							
				
</body>
</html>