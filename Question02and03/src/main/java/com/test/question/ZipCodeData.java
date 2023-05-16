package com.test.question;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/zipcodedata.do")
public class ZipCodeData extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//ZipcodeOk.java
		
		req.setCharacterEncoding("UTF-8");
		String dong = req.getParameter("dong");
		
		ZipCodeDAO zipdao = new ZipCodeDAO();
		
		
		System.out.println(">> "+ dong);
		String result = zipdao.list(dong);
		
		resp.setContentType("application/json");
		resp.setCharacterEncoding("UTF-8");
		
		PrintWriter writer = resp.getWriter();
	
		
		System.out.println(result);
		writer.print(result);
		writer.close();
	}

}