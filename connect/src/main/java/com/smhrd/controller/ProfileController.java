package com.smhrd.controller;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import com.smhrd.model.ProfileDAO;
import com.smhrd.model.ProfileVO;
import com.smhrd.model.UserDAO;
import com.smhrd.model.UserVO;


public class ProfileController extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// post 방식 인코딩
				request.setCharacterEncoding("UTF-8");
				
				// MultipartRequest에서 필요한 매개변수 설정
				// 모든 요청의 정보가 담겨있는 request 객체
				// 업로드 된 파일(이미지, 동영상, 코드블럭)을 저장할 경로
				
				//파일 저장할 폴더
				String path = request.getServletContext().getRealPath("./profilePic");
				
				System.out.println("파일 저장경로 : "+path);

				
				// 파일의 max size = 대충 15메가 정도. 트위터 용량 사이즈 ㅋㅋ
				int maxSize = 15*1024*1024;
				
				// 인코딩 방식
				String encoding="UTF-8";
				
				// 중복제거
				DefaultFileRenamePolicy rename = new DefaultFileRenamePolicy();
				
				// 파일 업로드 -> MultipartRequest -> cos.jar
				HttpSession session = request.getSession();
		
				MultipartRequest multi = null;
				String filename = null;
				
				UserVO loginUser = (UserVO)session.getAttribute("loginUser");
				String id = loginUser.getId();
				

				System.out.println("아이디는 "+id);
				
				String nick = null;
				String status = null;
				String intro = null;
				String skill = null;
				String language = null;
				
				ProfileVO vo = null;
				
				// 사진을 첨부했을 경우 판별
				Boolean imgFileName = (Boolean)session.getAttribute("ProfilePic");
				System.out.println(imgFileName);
				
				if (imgFileName!=null) {
					System.out.println("사진 이름 받아옴 : "+imgFileName);
					multi = new MultipartRequest(request,path,maxSize,encoding,rename);
					filename = URLEncoder.encode(multi.getFilesystemName("file"),"UTF-8");
					
					System.out.println("파일이름"+filename);
					
					nick = multi.getParameter("set_name");
					status = multi.getParameter("set_devel");
					skill = multi.getParameter("set_skill");
					language = multi.getParameter("set_language");
					intro = multi.getParameter("set_intro");
					
					int cnt=0;
					int cnt2=0;
					
					Map<String, String> map = new HashMap<>();

					map.put("userNick", nick);
					map.put("userId", id);
						vo = new ProfileVO(id,status,skill,language,intro,filename);
						cnt = new ProfileDAO().updateProfilePic(vo);
						cnt2 = new UserDAO().updateNick(map);
						if(cnt>0) {
							System.out.println("업데이트 성공1");
							
						}else {
								System.out.println("업데이트 실패1");
							}

				}
//				if(imgPath!=null && videoPath==null) {
//					// 사진을 첨부하고 동영상은 X
//					multi = new MultipartRequest(request,path,maxSize,encoding,rename);
//					filename = URLEncoder.encode(multi.getFilesystemName("Photo"),"UTF-8");
//					text = multi.getParameter("textContent");
//					
//				}else if(imgPath==null && videoPath!=null) {
//					// 동영상을 첨부하고 사진은 X
//					multi = new MultipartRequest(request,path,maxSize,encoding,rename);
//					filename = URLEncoder.encode(multi.getFilesystemName("Video"),"UTF-8");
//					text = multi.getParameter("textContent");
//					
//				}
				else{
					
					System.out.println("여기야?제발");
					multi = new MultipartRequest(request,path, maxSize, encoding);
					nick = multi.getParameter("set_name");
					status = multi.getParameter("set_devel");
					skill = multi.getParameter("set_skill");
					language = multi.getParameter("set_language");
					intro = multi.getParameter("set_intro");
					
					
//				}
				
					
				
				int cnt=0;
				int cnt2=0;
				if(filename==null) {
					System.out.println("또여기니");
					vo = new ProfileVO(id,status,skill,language,intro);
					Map<String, String> map = new HashMap<>();

					map.put("userNick", nick);
					map.put("userId", id);
					
					cnt = new ProfileDAO().updateProfile(vo);
					cnt2 = new UserDAO().updateNick(map);
					
				}
				
				}
				
				RequestDispatcher rd = request.getRequestDispatcher("profile.jsp");
				request.setAttribute("profilePicPath", path);
				rd.forward(request, response);
		
	}

}
