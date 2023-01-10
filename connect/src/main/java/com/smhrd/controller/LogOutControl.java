package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;




public class LogOutControl extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		// 쿠키 객체 가져오기
				Cookie[] cookies = request.getCookies();
				
				HttpSession session = request.getSession();
				
//				System.out.println("실행테스트 1");
				
				for(Cookie c : cookies){ // for each 문
				
				if(c.getName().equals("loginId")){
					
					Cookie IDcookie = new Cookie("loginId","default");
					Cookie Ncookie = new Cookie("loginNick","default");
					
					System.out.println("아이디값"+IDcookie.getValue());
					IDcookie.setMaxAge(0); // 유효기간 초기화
					Ncookie.setMaxAge(0); // 유효기간 초기화
					
					response.addCookie(IDcookie);
					response.addCookie(Ncookie);
//					System.out.println("실행테스트 2-1");
					
					
					
					
				}else if(c.getName().equals("loginEmail")){
					Cookie Ecookie = new Cookie("loginEmail","default");
					Cookie Ncookie = new Cookie("loginNick","default");
					
					Ecookie.setMaxAge(0); 
					Ncookie.setMaxAge(0); 
					
					response.addCookie(Ecookie);
					response.addCookie(Ncookie);
//					System.out.println("실행테스트 2-2");
					
					
					
				}
				

				}
				session.invalidate();
				
//				System.out.println("실행테스트 5");
//				response.sendRedirect("./login.jsp");
//				System.out.println("실행테스트 6");
				
		
	}

}
