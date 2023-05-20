package com.test.toy.board;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.test.toy.board.repository.BoardDAO;
import com.test.toy.board.repository.BoardDTO;

@WebServlet("/board/add.do")
public class Add extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//Add.java
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/board/add.jsp");
		dispatcher.forward(req, resp);

	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//AddOk.java
		
		// 1. 데이터 가져오기
		// 2. DB 작업 > insert
		// 3. 결과
		
		HttpSession session = req.getSession(); // ★ 
		
		String subject = req.getParameter("subject");
		String content = req.getParameter("content");
		System.out.println("board wirte post !"+subject+content+(String)session.getAttribute("id"));
		BoardDTO dto = new BoardDTO();
		dto.setSubject(subject);
		dto.setContent(content);
		
		if ( session.getAttribute("id") == null ) {
			resp.setCharacterEncoding("UTF-8");
			resp.setContentType("text/html;charset=utf-8"); 
			PrintWriter writer = resp.getWriter();
			// ★ meta 태그는 무조건 head안에 담아서 쓸 것
			/* writer.write("<head><meta charset='UTF-8'></head>"); */
			writer.write("<script>alert('로그인 페이지로 갑니다.'); history.back();</script>");
			writer.close();
		} 
		
		System.out.println("-------");
		
		dto.setId((String)session.getAttribute("id")); //★
		
		
		
		// 로그인을 안하면 세션 id가 없으니까 안되는거null에러
		// 로그인을 하면 된다. 
		
		
		BoardDAO dao = new BoardDAO();
		
		int result = dao.add(dto);
		
		if(result == 1 ) {
			resp.sendRedirect("/toy/board/board.do");
		} else {
			PrintWriter writer = resp.getWriter();
			resp.setCharacterEncoding("UTF-8");
			writer.print("<script>alert('failed.'); history.back();</script>");
			writer.close();
			
		}
		
	}

}
