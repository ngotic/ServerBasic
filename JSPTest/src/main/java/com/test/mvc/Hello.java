package com.test.mvc;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Hello extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 비즈니스 코드 
		// 서블릿 업무 종료 > JSP 호출하기
		// 서블릿 > (이동) > JSP 
		
		// 1. response.sendRedirect()
		// 2. pageContext.forward()  : 얘는 여기서 못쓴다. pageContext에서는 없다. 
		// 원래는 jsp로 갈 때 이 방식을 안쓴다. 
		// 왜 안쓰는지 문제점이 있다. 
	
		// 문제점 : 1. 주소때문 나는 hello.do를 불렀는데 주소창에 http://localhost:8090/jsp/mvc/hello.jsp 이렇다.
		// 내가 결과물이 나왔는데 출력을 해야하면 전달을 해야함 forward는 전달이 가능, redirect는 전달이 안됨
		// 그냥 http://localhost:8090/jsp/hello.do 이쪾 url 쓰는게 낫지 않냐? 
		
		// req.getContextPath()
		// resp.sendRedirect("/jsp/mvc/hello.jsp");
		//System.out.println(req.getContextPath()); //    /jsp 가 출력된다.
		//resp.sendRedirect( req.getContextPath()+"/mvc/hello.jsp"); //http://localhost:8090/jsp/mvc/hello.jsp 이렇게 호출된다.
		resp.sendRedirect("/jsp/address.do");
		
		// ★ 이젠 jsp를 호출하면 안된다. > 이 때 호출하면 값 전달 받으면 null 찍힐듯
		
		int count = 10; //DB 작업 결과물
		
		// 모델 : 하나의 계층에서 또 다른 계층으로 데이터를 전달하는 역할 
		//req.setAttribute("count", count); // 이렇게 넣어두면 된다. 
		// session 에 담아서 주기도 하는데 > 너무 오바다 데이터가 살아있으니까 그니까 굳이 넣지 않아도 될거는 않넣는다. 오버스펙임 
		// application 얘는 더 오바다.    // pageContext는 forward로 이동하면 죽는다. 
		
		
		// 그냥 /가 webapp폴더다. > forward는 이렇게 !
		//RequestDispatcher dispatcher 
			//= req.getRequestDispatcher("/mvc/hello.jsp");
		// jsp를 부를 떈 이렇게 부른다
		//dispatcher.forward(req, resp); // 내가 가진 자원을 인수인계해준다. 그러면서 여기서 페이지 이동이 일어난다.
		//http://localhost:8090/jsp/hello.do 이제 이거로 접속이 된다.
		
		
		// 요청시 서블릿으로 호출하고 돌려줄 것은 jsp를 호출하고 jsp는 
		// 업무를 인수인계 받아서 html 작업을 할 최종 페이지를 만들어서 준다. 
		// 이게 JSP 모델2이다.
		
		/*
		 * RequestDispatcher dispatcher =
		 * req.getRequestDispatcher("/WEB-INF/mvc/hello.jsp"); dispatcher.forward(req,
		 * resp);
		 */
		
		
		// resp.sendRedirect( req.getContextPath()+"/mvc/hello.jsp"); 
		
	}  
	
	
	
	
}
