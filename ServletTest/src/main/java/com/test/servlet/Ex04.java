package com.test.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Ex04 extends HttpServlet{
	
	
	
	// 새로고침도 get방식이다.
	// link도 get방식
	//doGet인데 Post쓰면 안되고
	//doPost인데 Get쓰면 안된다.
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		resp.setCharacterEncoding("UTF-8");
		
		PrintWriter writer = resp.getWriter();
		
		writer.println("<html>");
		writer.println("<head>");
		writer.println("<meta charset='UTF-8'>");
		writer.println("</head>");
		writer.println("<body>");
		writer.println("<h1>데이터 보내기</h1>");
		// writer.println("<form method='GET' action='수신하는 알바생(서블릿) 주소를 넣는다. '>");
		// 모든 url은 소문자로 만들자 action으로 보내는 주소는 context path를 넣어야 한다. 
		writer.println("<form method='POST' action='/servlet/ex04ok'>");
		writer.println("<div>이름 : <input type='text' name='name'></div>");
		writer.println("<div></div>");
		writer.println("<div></div>");
		writer.println("<div><input type='submit' value='보내기'></div>");
		writer.println("<a href='/servlet/ex04ok?name=hong'>OK 페이지</a>");
		//받는 쪽 post로 바꾸면 에러난다. 링크는 get요청이다. 
		writer.println("<script>");
		writer.println("window.onclick = function() { location.href='/servlet/ex04ok?name=lee'; };");
		writer.println("</script>");
		
		writer.println("</form>");
		writer.println("</body>");
		writer.println("</html>");
		
		writer.close();
	}
	
	// 링크로 전송, form 태그로 전송 두가지가 있따. 
}
