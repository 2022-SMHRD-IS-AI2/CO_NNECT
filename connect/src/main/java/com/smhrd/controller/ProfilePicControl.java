package com.smhrd.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.PostDAO;
import com.smhrd.model.ProfileDAO;



public class ProfilePicControl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String imgFileName = request.getParameter("ProfilePicName");
//		String textSended = request.getParameter("sendText");
//		request.setAttribute("textaccepted", textSended);
		
		ProfileDAO dao = new ProfileDAO();
		boolean fileIsExist = dao.fileIsOk(imgFileName);
		
		HttpSession session = request.getSession();
		session.setAttribute("ProfilePic", fileIsExist);
		
		
		
		
		
		
	}

}
