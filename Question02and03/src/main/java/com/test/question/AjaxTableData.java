package com.test.question;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ajaxtabledata.do")
public class AjaxTableData extends HttpServlet {
	
	private AjaxTableDAO ajaxdao = new AjaxTableDAO();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//AjaxTableData.java
		String temp = ajaxdao.readTable();
		resp.setContentType("application/json");
		resp.setCharacterEncoding("UTF-8");
		PrintWriter writer = resp.getWriter();
		writer.print(temp);
		writer.close();
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		String y = req.getParameter("y");
		String x = req.getParameter("x");
		System.out.println("doPost 호출되었어요! "+x+','+y);
		int result = ajaxdao.updateTable(x,y);
		System.out.println("result" + result);
		
		PrintWriter writer = resp.getWriter();
		writer.printf("{\"result\": %d}", result);
		writer.close();
	}
	

}