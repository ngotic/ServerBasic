package com.test.file;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/edit.do")
public class Edit extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 
		System.out.println("----test----");
		
		// Edit.java
		//1. 번호 가져오기(seq)
		//2. DB 작업 > DAO 위임 > select
		//3. 결과 반환 > JSP 호출하기
		
		String seq = req.getParameter("seq");
		FileDAO dao = new FileDAO();
		FileDTO dto = dao.get(seq);
		req.setAttribute("dto", dto); // 여기 dto 안에는 글번호 있니?? 
		
		//Edit.java
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/edit.jsp");
		dispatcher.forward(req, resp);
	}

}
