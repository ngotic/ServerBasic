<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String name = "홍길동";
	int age = 20;
	String color = "orange";
	String txt = "<input type='text'>";
	// 이 페이지에서 만든 변수는 이 페이지에서 쓴다.
	String attr = "background-color";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	/* css의 속성으로 넣어도 잘된다. */
	div {
	color : <%= color %>;
	<%= attr %>: gold;
	}

</style>
</head>
<body>
	
	<%
		// 메모리에 변수 3개 만듬
		int a = 10;
		int b = 20;
		int c = a + b;
		String str = name;
		
	%> 
	
	<!--  HTML의 PCDATA로 출력 -->
	<div><%=a %>+ <%= b %>= <%= c %></div>
	
	<div><%= name %></div>
	
	<!--  HTML의 속성값으로 출력 -->
	<input type="text" value="<%=age %>">
	<hr>
	<%= txt %>
	
	<input type="button" value="확인" id="btn1" style="color:<%= color %>">
	
	
	★결과: 
	 표현식은 속에 아무것도 안넣으면 에러가 난다. 표현식을 포함해서 주석을 달아야 한다. <%=  %>
	 이거 jsp 주석이다. 조심하기 ★ 톰캣은 html 주석을 모른다. 그래서 ★★★ JSP 전용 주석이 있다.  
	 HTML 
	 // 톰켓이 먼저 일을한다. 그리고 JSP가 나옴
	 // ★★★ 언어에 맞는 주석을 써라
	 <%-- <%=  %> --%>
	 
	 
	
	 
	<script>
	
		document.getElementById('btn1').onclick = function(){
			alert('<%= name %>');
		};
	</script>
	<%-- // alert(<%= name %>);  홍길동은 문자열이 아니다. --%>
	<%-- // alert(<%= age %>); --%>
</body>
</html>