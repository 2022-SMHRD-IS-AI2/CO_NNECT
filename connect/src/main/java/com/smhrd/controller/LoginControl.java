package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.UserDAO;
import com.smhrd.model.UserVO;


public class LoginControl extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 개인정보와 같은 보안에 충실해야 하는 정보는 POST 방식으로 전송하기에 인코딩을 해줘야한다.
		request.setCharacterEncoding("UTF-8");
		
		// 로그인 시 입력한 아이디 or 이메일 그리고 비밀번호를 가져온다.
		
		String idEmail = request.getParameter("idEmail");
		String pw = request.getParameter("pw");
		
		
		// 로그인 상태 유지 체크여부 확인
		String checkLogin = request.getParameter("l_save");
		
		UserVO a = new UserVO(idEmail,pw);
		UserDAO dao = new UserDAO();
		
		UserVO loginUser = null;
		
//		System.out.println("이메일뭘까 "+a.getEmail());
//		System.out.println("아이디뭘까 "+a.getId());
		if(a.getEmail()!=null) {
			
			loginUser = dao.selectEmailUser(a);
			
			
		}else {
			
			loginUser = dao.selectIdUser(a);
		}
		
		
		if(loginUser != null) {
			System.out.println("로그인 성공");
			HttpSession session = request.getSession();
			session.setAttribute("loginUser", loginUser);
			
			// 로그인유지에 체크가 되어있고 이메일로 로그인 했을 경우
			if(checkLogin!=null) {
				if(checkLogin.equals("유지") && idEmail.indexOf("@")>0) {
					
					// 쿠키 객체 생성, 초 단위 설정하고 바로 전송
					Cookie Ecookie = new Cookie("loginEmail",loginUser.getEmail());
					Cookie Ncookie = new Cookie("loginNick",loginUser.getNick());
					// 유효기간 설정(초 단위)
					Ecookie.setMaxAge(60*60); // 일주일 로 바꿔야함 테스트용으로 30초 해둠
					Ncookie.setMaxAge(60*60); // 일주일
					
					// 클라이언트에 쿠키 전송
					response.addCookie(Ecookie);
					response.addCookie(Ncookie);
					
					
					
					// 로그인유지에 체크가 되어있고 아이디로 로그인 했을 경우
				}else if(checkLogin.equals("유지") && idEmail.indexOf("@")<0) {
					
					// 쿠키 객체 생성, 초 단위 설정하고 바로 전송
					Cookie IDcookie = new Cookie("loginId",loginUser.getId());
					Cookie Ncookie = new Cookie("loginNick",loginUser.getNick());
					// 유효기간 설정(초 단위)
					IDcookie.setMaxAge(60*60); // 일주일
					Ncookie.setMaxAge(60*60); // 일주일
					
					// 클라이언트에 쿠키 전송
					response.addCookie(IDcookie);
					response.addCookie(Ncookie);
					
					
					
				}
			}
			
			response.sendRedirect("main.jsp");
			
		}else {
			System.out.println("로그인 실패");
			response.sendRedirect("login.jsp");
		}
		
	}

}
