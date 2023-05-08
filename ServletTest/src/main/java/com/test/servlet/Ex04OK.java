package com.test.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class Ex04OK extends HttpServlet{
	
	// doGet >> <from method="GET">
	
	// doGet과 doPost 이름만 다르다.
	// doPost >> <from method="POST">
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//http://localhost:8090/servlet/ex04ok?name=aaa 이게 들어옴
		
		// <input type='text' name = 'name'>
		
		// 1. 데이터 수신하기
		// req.getParameter("HTML 태그의 name값");
		String name  = req.getParameter("name"); // 텍스트 박스에 입력한 문자열
		System.out.println(name);
		
		// 2. 응답 페이지 만든다. 데이터 잘 받았어요~ 
		
		
		resp.setCharacterEncoding("UTF-8");
		
		PrintWriter writer = resp.getWriter();
		
		writer.println("<html>");
		writer.println("<head>");
		writer.println("<meta charset='UTF-8'>");
		writer.println("</head>");
		writer.println("<body>");
		writer.println("<h1>데이터 수신완료</h1>");
		// writer.println("<form method='GET' action='수신하는 알바생(서블릿) 주소를 넣는다. '>");
		// 모든 url은 소문자로 만들자 action으로 보내는 주소는 context path를 넣어야 한다. 

		
		
		writer.println("<div>데이터 수신 완료</div>");
		writer.println("<div>데이터:" + name + "</div>");

		writer.println("</body>");
		writer.println("</html>");
		
		writer.close();
	}
	
	// 
	
}
