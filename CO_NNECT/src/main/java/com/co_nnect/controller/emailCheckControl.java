package com.co_nnect.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.co_nnect.model.UserDAO;


public class emailCheckControl extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String inputE = request.getParameter("email");
		
		UserDAO dao = new UserDAO();
		boolean emailDC = dao.emailDC(inputE);
		
		System.out.println(emailDC);
		
		PrintWriter out = response.getWriter();
		out.print(emailDC);
	
	
	}

}
