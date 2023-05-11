package com.test.file;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/filetestok.do")
public class FileTestOk extends HttpServlet {

	@Override           // 이거 post로 안바꾸면 에러가 난다.
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// 문자열 데이터 받아오기 
		// 첨부 파일 가져오기
		                                // multipart/form-data 이거로 받으면 문제임
										// request는 멀쩡하다. getParameter 문제다., getParameterValues()
		System.out.println("문자열 : "+ req.getParameter("txt")); 
		// null 이 나왔는데 이게 동작이 안된거다. 
		
		
		// cor.js
		// -Request > (교체) > MultipartRequest(클래스인데)
		
		req.setCharacterEncoding("UTF-8");
		
		try {
			
			// 실제 요청에 대한 realpath는 따로 있음 
			
			System.out.println(req.getRealPath("/uploads")); // 요청에 대한 realpath이다. 
			
			MultipartRequest multi = new MultipartRequest(
									     req,
									     req.getRealPath("/uploads"),
									     1024 * 1024 * 100,            // 허용 사이즈
									     "UTF-8",
									     new DefaultFileRenamePolicy() // 얘가 이름 바꾸는 일 한다.
									); // 트래픽은 돈이다. 
			// > 최소화하자 > 첨부파일로 인한 데이터 트래픽은 돈을 많이 먹는다.
			
			// 파일 첨부 후 req.getRealPath("/uploads")를 아래로 복사
			// 
			// ★ 파일 업로드 하면 여기에 업로드가 된다. 
			String txt = multi.getParameter("txt");// 메서드 이름을 동일하게 해놨다.
			String orgfilename = multi.getOriginalFileName("attach");
			String filename = multi.getFilesystemName("attach");
			
			req.setAttribute("txt", txt);
			req.setAttribute("orgfilename", orgfilename); // 원본 이름
			req.setAttribute("filename", filename); // 이름 바꿔서 나옴> 중복된 이름이 있으면 뒤에 숫자를 붙여준다.
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		// 직접 처리하면 우리가 할 수 있는 일의 범위가 늘어난다.  
		// 파일이름 조작할 수 있거나 ~ 파일 카운트 수 늘리거나 ~ 
		
		//FileTestOk.java
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/file/filetestok.jsp");
		
		dispatcher.forward(req, resp);
	}

}