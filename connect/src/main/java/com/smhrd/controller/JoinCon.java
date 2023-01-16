package com.smhrd.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.ProfileDAO;
import com.smhrd.model.ProfileVO;
import com.smhrd.model.UserDAO;
import com.smhrd.model.UserVO;



public class JoinCon extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 개인정보와 같은 보안에 충실해야 하는 정보는 POST 방식으로 전송하기에 인코딩을 해줘야한다.
		request.setCharacterEncoding("UTF-8");
		
		// 처음에 회원가입 시 입력받는 정보(FORM태그 내에서 입력받는 정보) 가져오기
		String email = request.getParameter("email");
		String id = request.getParameter("id");
		String pw = request.getParameter("finalPw");
		String nick = request.getParameter("nick");
		
		String status="현재 직무분야 또는 직업을 설정 해 주세요. ex)학생, 프론트엔드 개발자";
		String skills="자신의 기술을 설정 해 주세요. ex)웹사이트 개발, 앱 개발";
		String programs="다루는 프로그래밍 언어를 설정 해 주세요.";
		String introduction="자기소개를 적어주세요.";
		
		// 해당 유저 가입정보 데이터베이스로 보낼 UserVO 객체 생성
		UserVO vo = new UserVO(id,pw,nick,email);
		UserDAO dao = new UserDAO();
		
		// 유저 기본 프로필 정보 데이터베이스로 보낼 ProfileVO 생성
		ProfileVO vo2 = new ProfileVO(id,status,skills,programs,introduction);
		ProfileDAO dao2 = new ProfileDAO();
		
		// 데이터베이스와 연결할 메서드를 호출할 DAO 객체 생성과 동시에 회원가입 정보 입력 메서드 호출하여 int type의 변수에 담아줌
		// insert, update, delete 와 같은 db에 직접적으로 수정을 가하는 것들은 반환타입이 int 이다. 기억할 것.
		int cnt = dao.insertUser(vo);
		int cnt2 = dao2.insertProfile(vo2);
		
		// 포워딩방식 joinSuccess.jsp로 이동 -> email을 request영역에 저장
				RequestDispatcher rd = request.getRequestDispatcher("welcome.jsp");
				request.setAttribute("email", email);
				request.setAttribute("id", id);
				
				if(cnt>0 && cnt2>0) {
					System.out.println("회원가입 성공");
				}else {
					System.out.println("회원가입 실패");
					response.sendRedirect("join.jsp");
				}
		
		
				rd.forward(request, response);
		
	}

}
