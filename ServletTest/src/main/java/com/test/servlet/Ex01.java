package com.test.servlet;

import java.io.BufferedWriter;
import java.io.FileWriter;

// 서블릿(x) > 일반 클래스(O)
public class Ex01 { // 서블릿 클래스가 되어야 동적으로 동작이 된다. > 일반클래스면 안되고 그러면 진짜로 서블릿 버전의 페이지를 만들어보자
	
	public static void main(String[] args) {
		
		// 동적으로 HTML 페이지 만들기
		// - test.txt
		// - test.dat
		// - test.html
		try {
			
			BufferedWriter writer = new BufferedWriter(new FileWriter(".\\src\\main\\webapp\\ex01.html"));
			// 동적으로 
			writer.write("<html>");
			writer.write("<head>");
			writer.write("<meta charset='UTF-8'>");
			writer.write("</head>");
			writer.write("<body>");
			writer.write("<h1>서블릿 페이지 입니다.</h1>");
			writer.write("<p>안녕하세요.</p>");
			writer.write("<p>자바로 만든 페이지입니다.</p>");
			writer.write("<p>오늘의 날씨: 맑음 </p>");
			writer.write("</body>");
			writer.write("</html>");
			writer.close();
			// http://localhost:8090/servlet/ex01.html
			System.out.println("complete");
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
				
		
	}	
	
	

}
