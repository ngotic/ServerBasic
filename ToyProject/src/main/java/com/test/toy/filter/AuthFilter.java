package com.test.toy.filter;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


// r
public class AuthFilter implements Filter{
	
	
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		System.out.println("권한 필터 생성");
		
	}
	
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) // reqponse나 reqpuse쓸려면 형변환해라
			throws IOException, ServletException {
		System.out.println("권한 체크 필터 동작");
		HttpServletRequest req = (HttpServletRequest)request;
		HttpSession session = req.getSession();
		
		System.out.println(req.getRequestURI());
		
		if (session.getAttribute("id") == null ) { // 뒷구멍을 막는다. add.do 주소를 알아낸다 하더라도 다 막는다. 
			if (req.getRequestURI().endsWith("add.do") || req.getRequestURI().endsWith("del.do") || req.getRequestURI().endsWith("edit.do")) {
				PrintWriter writer = ((HttpServletResponse)response).getWriter();
				writer.write("<script>alert('failed'); location.href='/toy/index.do'; </script>");
				writer.close();
				return ;
			}
		}
		
		//if(req.getRequestURI().endsWith(null)) // 내가 쓴글에 접근했다? 이건 필터로 하기 힘들다.
		chain.doFilter(request, response);
	}
	
	@Override
	public void destroy() {
		System.out.println("권한 필터 소멸");
	}
}