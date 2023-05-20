package com.test.question;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/catdragdata.do")
public class CatDragData extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req,
			HttpServletResponse resp) throws ServletException, IOException {
		String id = req.getParameter("id");
		String x = req.getParameter("x");
		String y = req.getParameter("y");
		
		
		CatDTO dto = new CatDTO();
		CatDAO dao = new CatDAO();
		
		dto.setId(id);
		dto.setX(x);
		dto.setY(y);
		
		int result = dao.updateCatPoint(dto);
		
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json");
		
		PrintWriter writer = resp.getWriter();
		writer.printf("{\"result\" : \"%d\"}", result);
		writer.close();
		
	}

}