package com.co_nnect.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.co_nnect.model.UserDAO;


public class idCheckControl extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String inputE = request.getParameter("id");
		
		UserDAO dao = new UserDAO();
		boolean idDC = dao.idDC(inputE);
		
		System.out.println(idDC);
		
		PrintWriter out = response.getWriter();
		out.print(idDC);
	
	
	}
		
		
		
		
	

}
