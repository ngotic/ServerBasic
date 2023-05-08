<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
	// 스크립틀릿 영역 > 자바 영역
	Random rnd = new Random(); // import를 해야하는데.. 불편하다. 
	// 컨트롤 스페이스로 임포트한다. 
	
	int dan = rnd.nextInt(8) + 2;
	
%>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	div {
		margin: 3px 10px;
	}
</style>
</head>
<body>
	<!-- webapp > ex02.jsp -->
	<!-- <h1>구구단 5단</h1>
	<div>5 x 1 = 5</div>
	<div>5 x 1 = 5</div>
	<div>5 x 1 = 5</div>
	<div>5 x 1 = 5</div> 
	자바 영역과 html 영역이 다르다. 
	-->
	
	<h1>구구단 <%= dan %>단</h1>
	<% 
		for (int i=1; i<=9; i++) { 
	%>
	<div><%= dan %> x <%= i %> = <%= i*dan %></div>
	<%
		}
	%>
	
	
	
	
	
	
	<%@ include file="inc/sub.jsp" %>
</body>
</html>