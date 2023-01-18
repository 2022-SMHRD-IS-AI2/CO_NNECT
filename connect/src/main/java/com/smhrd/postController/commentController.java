package com.smhrd.postController;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.CommentDAO;
import com.smhrd.model.CommentVO;
import com.smhrd.model.PostDAO;
import com.smhrd.model.PostVO;
import com.smhrd.model.UserVO;


public class commentController extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		
		String commentText = request.getParameter("commentText");
		
		UserVO loginUser = (UserVO)session.getAttribute("loginUser");
		
		
		String id = loginUser.getId();
		
		int seq = Integer.parseInt(request.getParameter("seq"));
		
		BigDecimal b_seq = new BigDecimal(seq);
		
		CommentVO vo = new CommentVO(b_seq,commentText,id);
		CommentDAO dao = new CommentDAO();
		
		int cnt = dao.insertCmt(vo);
		
		if(cnt>0) {
			System.out.println("업로드성공");
			
		}else {
				System.out.println("업로드실패");
			}
		
		RequestDispatcher rd = request.getRequestDispatcher("main.jsp");
		request.setAttribute("requestid", id);
		rd.forward(request, response);
		
		
		
		
		
		
		
		
		
		
	}

}
