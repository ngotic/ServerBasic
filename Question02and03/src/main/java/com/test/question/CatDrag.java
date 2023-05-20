package com.test.question;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/catdrag.do")
public class CatDrag extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req,
			HttpServletResponse resp) throws ServletException,
	IOException {	
		//CatDrag.java 
		// 고양이의 처음 시작 위치를 반환한다.
	
		CatDAO dao = new CatDAO();
		List<CatDTO> list = dao.loadCat();
		
		req.setAttribute("list", list);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/catdrag.jsp");
		dispatcher.forward(req, resp);
	}

}
