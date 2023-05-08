package com.test.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//1 a. javax.servlet.Servlet 인터페이스를 구현한다.         > 복잡하다.
//  a. javax.servlet.http.HttpServlet 클래스를 상속받는다.  > 간편하다. > 사용*** > 대부분 이걸로 쓴다.


//2. doGet / doPost 메소드 선언 
//- 둘 중에 하나 선언 or 둘 다 선언 
//- 클라이언트(브라우저)의 요청이 들어오면 자동으로 호출되는 메소드 
//- doPost, doGet을 호출 ~ 동적으로 HTML 페이지를 만드는 역할
//- 메소드 작성 규칙 
//a. 매개 변수 작성(2개)
//	1. java.servlet.http.HttpServletRequest
//	2. java.servlet.http.HttpServletResponse
//
//b. 예외 미루기
//	1. java.io.IOException    // 페이지를 동적으로 생성 > 외부 입출력 
//	2. java.servletException  // 서블릿 작업 때문에 


public class Ex02 extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
			
			// BufferedWriter > 생성된 파일 > HDD에 저장 
			// PrintWriter > 생성된 파일 > 톰켓을 통해서 브라우저에게 반환
			response.setCharacterEncoding("UTF-8"); // 브라우저에 보이는 인코딩 설정
			PrintWriter writer = response.getWriter();
			
			writer.println("<html>");
			writer.println("<head>");
			writer.println("<meta charset='UTF-8'>");  // HTML파일 인코딩 이거 꼭 확인
			// 'UTF-8' 이거 조심
			writer.println("</head>");
			
			writer.println("<body>");
			writer.println("<h1>서블릿 페이지</h1>");
			writer.println("<p>서블릿을 사용해서 만들었습니다.</p>");
			writer.println("</head>");
			writer.println("</html>");
			
			writer.close();
			
			// Ctrl + F11
			
			// 자바 파일은(class) 웹(http://)에서 호출이 불가능하다. 
			// http://localhost:8090/servlet/servlet/com.test.servlet.Ex02 > 알바생을 불렀다. > 404 Not Found
			
			// 자바 파일을 브라우저를 통해 웹에서 호출할 수 있는 방법이 필요!! 
			// - 가상 주소 
			// - webapp > WEB-INF > web.xml
			// - 처음 만들 때 이거 체크해야 한다. 
			
		
	}

}
