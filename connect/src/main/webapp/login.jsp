<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.smhrd.model.UserVO" %>
<%@page import="com.smhrd.model.UserDAO" %>
    <%@page import="com.smhrd.model.ProfileVO" %>
    <%@page import="com.smhrd.model.ProfileDAO" %>

<%-- <%@page import="javax.servlet.http.HttpSession" %> --%>

<!DOCTYPE html>
<html lang="ko">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>Document</title>
   <link rel="stylesheet" href="./assets/css/style.css">
   <link rel="stylesheet" href="./assets/css/login.css">
   <link rel="stylesheet" href="./assets/css/transition.css">
</head>
<body>
	<%
			ProfileDAO dao2 = new ProfileDAO();
		// 쿠키 객체 가져오기
		Cookie[] cookies = request.getCookies();
	if(cookies!=null){
		
		for(Cookie c : cookies){ // for each 문
		if(c.getName().equals("loginId") && c.getValue()!="default"){
			/* System.out.print(c.getValue()); */
			
			UserDAO dao = new UserDAO();
			
			UserVO loginUser = dao.setSessionID(c.getValue());
			session.setAttribute("loginUser", loginUser);
			
			String id = (String)loginUser.getId();
			
			ProfileVO ProfileUser = (ProfileVO)dao2.selectProfileEMAIL(id);
			
			session.setAttribute("loginUserProfile", ProfileUser);
			
			response.sendRedirect("main.jsp");
			
		}else if(c.getName().equals("loginEmail") && c.getValue()!="default"){
			/* System.out.print(c.getValue()); */
			
			UserDAO dao = new UserDAO();
			UserVO loginUser = dao.setSessionEmail(c.getValue());
			session.setAttribute("loginUser", loginUser);
			
			String email = (String)loginUser.getEmail();
			
			ProfileVO ProfileUser = (ProfileVO)dao2.selectProfileEMAIL(email);
			
			session.setAttribute("loginUserProfile", ProfileUser);
			
			response.sendRedirect("main.jsp");
		}
		
		}
	}
	
	%>
<!-- login_animate start -->

<div class="animate_wrap">
 <img src="./assets/img/logo.png" class="animate">
</div>

<!-- login_fail -->


<!-- login_main start -->
<div class="all_login_wrap">

   <div class="l_bg">
      <img src="./assets/img/login_background_bg.png">
   </div> 

   <div class="wrap fb">
      <div class="logo">
         <img src="./assets/img/logo.png">
      </div>
      <!-- <div class="side_box">
         <div class="side_line"></div>
      </div> -->
      <div class="l_wrap fc">
         <div class="login_wrap">
         <div class="l_title">
            <h1>Build Up</h1>
            <p>Your Connections & Coding Skills!</p>
         </div>
         
            <div class="l_id fa">
               <form action="LoginControl" method="post">
               <input type="text" name="idEmail" placeholder="아이디(이메일)">
               <input type="password" name="pw" placeholder="비밀번호">
            
            </div>
            <div class="l_sf fb">
               <div class="l_save">
                  
               <input type="checkbox" name="l_save" value="유지">               
               <span>로그인 상태 유지</span>
            
            </div>
            <div class="l_find">
				<!-- 아이디. 비밀번호 찾는 페이지 -->
               <a href="#"><span>아이디/비밀번호 찾기></span></a>
            </div>

            </div>
            <!-- l_sf end -->
            <div class="join_wrap fc">
               <button  type ="submit" class="button"><span>로그인</span></button>
               <a href="join.jsp" class="button2"><span>회원가입</span></a>
            </div>
		</form>
      </div>
      <!-- login_wrap -->
   </div>
   <!-- l_wrap end -->
      
   </div>
   <!-- wrap end -->
</div>
<!-- all_login_wrap end -->

<script src="./assets/js/transition.js"></script>

</body>
</html>