<%@page import="com.test.jsp.Util"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


		<!-- ex06_declaration.jsp -->
	<%
		// 스크립틀릿 > 자바 영역? > 어떤 메소드의 내부 지역 
	
		// 무슨 변수? > 지역 변수 
		// int a = 10;
		
		/* public void test() {} ; 여기가 자바 영역이지만 메서드는 안만들어진다. 자바의 어느 영역인지는 설명안함 */
		
		
		
	%>



	<%
		int a = 10;
		System.out.println(this.a);
		/* public void test(){
		} */
		// 느낌표 안붙이면 지역 
	%>
	
	<%!
		// 클래스 멤버 변수
		int b = 20;
		int a = 30;
		
		// 코드를 선언부에서 재사용이 가능하다. 하나의 JSP에서 호출이 가능하고 다른 페이지에서 호출 x 
		// 그럼 다른 페이지에서 재사용하려면 ?? 이게 얘네들을 안쓰게 하는 방법이다. 
		public int add(int x, int y){ // 얘 잘 안쓴다. 이건 로컬용이다. 현재 페이지에서 쓸 수 있다. 
			return x+y; // 어차피 import하면 되는데 왜 이렇게 씀?? 굳이?? 
		}
	%>
	
	 결과 : <%= add(100, 200) %> 이거는 된다. add메서드가 호출이 된다. 
	 결과 : <%= Util.add(100, 200) %>
	 
</body>
</html>