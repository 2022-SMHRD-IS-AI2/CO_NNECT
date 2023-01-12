<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.util.List" %>	
<%@page import="java.util.ArrayList"%>
        <%@page import="com.smhrd.model.UserVO" %>
    <%@page import="com.smhrd.model.UserDAO" %>
            <%@page import="com.smhrd.model.PostVO" %>
    <%@page import="com.smhrd.model.PostDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./assets/css/style.css">
	<link rel="stylesheet" href="./assets/css/main.css">
	<script src="./assets/jquery/jquery-3.6.3.js"></script>
	<script src="./assets/jquery/jquery-3.6.3.min.js"></script>
<title>Insert title here</title>
</head>
<body>

	<!-- 세션에서 유저 정보 얻어오기 -->
	<%
	
	UserVO loginUser = (UserVO)session.getAttribute("loginUser");
	UserDAO dao = new UserDAO();
	
	if(loginUser==null){
		response.sendRedirect("login.jsp");
	}else{
		String id = loginUser.getId();
		String email = loginUser.getEmail();
		
		System.out.println("타임라인페이지 세션확인 : "+id);
		
		List<PostVO> vo = new PostDAO().showTimeline();
		System.out.println("vo 길이 : "+vo.size());
		System.out.println("vo 길이 : "+vo.get(0));
		System.out.println("vo 자체출력 : "+vo);
	
	

	
	
	%>
				
					<div class="scroll">
					<%
					if(vo!=null){
            		for(int i=0;i<vo.size();i++){%>
						<div class="post">
							<div class="post_code">
								코드블럭
							</div>
							<div id="thisImg"><%if(vo.get(i).getFilename()!=null){%><img src="./file/<%=vo.get(i).getFilename()%>" width="40%"></div>
							<%}else{ %>
							<div id="thisImg"></div><%} %>
							<div id="text"><%=vo.get(i).getContent() %></div>
							<!-- post_code end -->
							<div class="post_tag fb">
							<%if(vo.get(i).getHashtag()!=null){%>
								<p><%=vo.get(i).getHashtag() %></p>
								<%}else{ %>
								<p>해시태그</p><%} %>
								<ul class="post_good fa">
									<li><img src="./assets/img/post_icons/heart-regular.svg"></li>
									
									<li>졓아 <%=vo.get(i).getLike()%></li>
									
									<li>졓아</li>
									<li>댓글</li>
									<li>슼랩</li>
								</ul>
							</div>
							<!-- post_tag end -->
						</div>
						<%} }
						
						else{%>
						<div class="post">
							<div class="post_code">
								코드블럭
							</div>
							<div id="thisImg"></div>
							<div id="text"></div>
							<!-- post_code end -->
							<div class="post_tag fb">
								<p>해시태그</p>
								<ul class="post_good fa">
									<li><img src="./assets/img/post_icons/heart-regular.svg"></li>
									<li>졓아</li>
									<li>댓글</li>
									<li>슼랩</li>
								</ul>
							</div>
							<!-- post_tag end -->
						</div><%} }%>
						<!-- post1 end -->


						
						</div>
				<!-- scroll end -->
				
</body>
</html>