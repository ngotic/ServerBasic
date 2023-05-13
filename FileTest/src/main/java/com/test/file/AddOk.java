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

@WebServlet("/addok.do")
public class AddOk extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//AddOk.java
		
		//1. 파일 업로드 처리
		//2. DB처리
		
		
		
		// 1. 
		String name = "";
		String filename = "";
		
		try {
			
			MultipartRequest multi = new MultipartRequest(
										req,
										req.getRealPath("/files"),
										1024*1024*100,
										"UTF-8",
										new DefaultFileRenamePolicy());
			
			System.out.println(req.getRealPath("/files"));
			
			filename = multi.getFilesystemName("attach");
			name = multi.getParameter("name");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		// 2. 
		FileDAO dao = new FileDAO();
		
		// dao.add(name, filename, add, bb, cc, dd, eee); 
		// 메서드 하나 만들어서 일을 시킴, 매개변수가 2개면, 3개면 4개면 ~~~
		// 매개변수가 많아지면 처리하기 곤란해서 2개이상일 때 상자에 담아서 넘긴다.
		
		FileDTO dto = new FileDTO();
		dto.setName(name);
		dto.setFilename(filename);
		
		int result = dao.add(dto); // 컨트롤러는 이게 성공했는지 실패했는데 궁금하다. 피드백 필요 > 성공하면 1 받고, 실패시 0받고
		
		req.setAttribute("result", result);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/addok.jsp");
		dispatcher.forward(req, resp);

	}

}