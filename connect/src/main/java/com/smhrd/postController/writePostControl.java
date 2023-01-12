package com.smhrd.postController;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.smhrd.model.PostDAO;
import com.smhrd.model.PostVO;
import com.smhrd.model.UserVO;


public class writePostControl extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// post 방식 인코딩
		request.setCharacterEncoding("UTF-8");
		
		// MultipartRequest에서 필요한 매개변수 설정
		// 모든 요청의 정보가 담겨있는 request 객체
		// 업로드 된 파일(이미지, 동영상, 코드블럭)을 저장할 경로
		
		//파일 저장할 폴더
		String path = request.getServletContext().getRealPath("./file");
		
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
		
		if(id==null) {
			
		}
		System.out.println("아이디는 "+id);
		
		String text = null;
		PostVO vo = null;
		
		// 사진을 첨부했을 경우 판별
		boolean imgFileName = (boolean)session.getAttribute("fileName");
		
		if (imgFileName==true) {
			System.out.println("사진 이름 받아옴 : "+imgFileName);
			multi = new MultipartRequest(request,path,maxSize,encoding,rename);
			filename = URLEncoder.encode(multi.getFilesystemName("Photo"),"UTF-8");
			text = multi.getParameter("textContent");
			
			int cnt=0;

				vo = new PostVO(text, filename, id);
				cnt = new PostDAO().uploadImg(vo);
				
				if(cnt>0) {
					System.out.println("업로드성공");
					
				}else {
						System.out.println("업로드실패");
					}

		}
//		if(imgPath!=null && videoPath==null) {
//			// 사진을 첨부하고 동영상은 X
//			multi = new MultipartRequest(request,path,maxSize,encoding,rename);
//			filename = URLEncoder.encode(multi.getFilesystemName("Photo"),"UTF-8");
//			text = multi.getParameter("textContent");
//			
//		}else if(imgPath==null && videoPath!=null) {
//			// 동영상을 첨부하고 사진은 X
//			multi = new MultipartRequest(request,path,maxSize,encoding,rename);
//			filename = URLEncoder.encode(multi.getFilesystemName("Video"),"UTF-8");
//			text = multi.getParameter("textContent");
//			
//		}
		else {
			multi = new MultipartRequest(request,path, maxSize, encoding);
			text = multi.getParameter("textContent");
			
//		}
		
			
		
		int cnt=0;
		if(filename==null) {
			
			vo = new PostVO(text, id);
			cnt = new PostDAO().upload(vo);
			
		}
		
		}
		
		RequestDispatcher rd = request.getRequestDispatcher("main.jsp");
		request.setAttribute("requestid", id);
		rd.forward(request, response);
		
		
		
	}

}
