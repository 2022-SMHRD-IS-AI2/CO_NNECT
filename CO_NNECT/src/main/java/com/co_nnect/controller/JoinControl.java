package com.co_nnect.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.co_nnect.model.UserDAO;
import com.co_nnect.model.UserVO;


public class JoinControl extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 개인정보와 같은 보안에 충실해야 하는 정보는 POST 방식으로 전송하기에 인코딩을 해줘야한다.
		request.setCharacterEncoding("UTF-8");
		
		// 처음에 회원가입 시 입력받는 정보(FORM태그 내에서 입력받는 정보) 가져오기
		String email = request.getParameter("email");
		String id = request.getParameter("id");
		String pw = request.getParameter("finalPw");
		String nick = request.getParameter("nick");
		
		// 해당 유저 가입정보 데이터베이스로 보낼 UserVO 객체 생성
		UserVO vo = new UserVO(id,pw,nick,email);
		
		// 데이터베이스와 연결할 메서드를 호출할 DAO 객체 생성과 동시에 회원가입 정보 입력 메서드 호출하여 int type의 변수에 담아줌
		// insert, update, delete 와 같은 db에 직접적으로 수정을 가하는 것들은 반환타입이 int 이다. 기억할 것.
		int cnt = new UserDAO().insertUser(vo);
		
		// 포워딩방식 joinSuccess.jsp로 이동 -> email을 request영역에 저장
				RequestDispatcher rd = request.getRequestDispatcher("WelcomeJoin.jsp");
				request.setAttribute("email", email);
				request.setAttribute("id", id);
				rd.forward(request, response);
				
				if(cnt>0) {
					System.out.println("회원가입 성공");
				}else {
					System.out.println("회원가입 실패");
					response.sendRedirect("login.html");
				}
		
		
		
	}

}
