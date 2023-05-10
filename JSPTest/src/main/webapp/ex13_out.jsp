<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://me2.do/5BvBFJ57">
<style>

</style>
</head>
<body>
	<!-- ex13_out.jsp -->
	<h1>구구단</h1>
	<%
		int dan = 5;
	%>
	
	<h2>out 사용 안함 </h2>
	<% for ( int i=1 ; i<=9 ; i++) { %>
	
	<div><%= dan %>  x <%= i %> = <%= dan * i %></div>
	
	<% } %>
	
	<h2>out 사용함 > 우리에게 선택권을 주는 것이다. </h2>
	<% for ( int i=1; i <=9 ; i++ ) { 
		out.println(String.format("<div> %d x %d = %d </div>",
				dan,
				i,
				dan*i)); // 서블릿이 하던 방식이다. 출력용도인데 import 필요 없네 
	}
	%>
		
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script>

</script>
</body>
</html>
