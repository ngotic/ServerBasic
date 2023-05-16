package com.test.memo;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/del.do")
public class Del extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//Del.java
		// 데이터 가져오기
		// DB작업
		// 피드백
		
		// 1. 
		req.setCharacterEncoding("UTF-8");
		// 2.
		String seq = req.getParameter("seq");
	
		MemoDAO dao = new MemoDAO();
			
		
		int result = dao.del(seq);
		
		if(result == 1) { // 다른 jsp로 가는게 아니라 이렇게 서블릿단에서 피드백 
			resp.sendRedirect("/memo/list.do");
		} else {
			PrintWriter writer = resp.getWriter();
			writer.write("<script>alert('failed'); history.back();</script>");
			writer.close();
		}

	}

}