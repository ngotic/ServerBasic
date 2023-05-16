package com.test.ajax;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ex01ok.do")
public class Ex01Ok extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//Ex01Ok.java
		AjaxDAO dao = new AjaxDAO();
		int count = dao.count();
		
		// 다량의 클라이언트를 작업하는 경우 이거 필요해, 지금은 불필요하게 만들필요 없음  
		/*
		 * RequestDispatcher dispatcher =
		 * req.getRequestDispatcher("/WEB-INF/views/exo1ok.jsp");
		 * dispatcher.forward(req, resp); */
		
		resp.sendRedirect("/ajax/ex01.do?count="+count);

	}

}
