<%@page import="java.util.Enumeration"%>
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
	<!-- ex10_request_header.jsp -->
	
	<h1>HTTP 요청 메세지 <small>헤더 정보 </small></h1>
	<table>
		<tr>
			<th>해더명(Key)</th>
			<th>해더값(Value)</th>
		</tr>
		<% Enumeration<String> e= request.getHeaderNames();
			while(e.hasMoreElements()){
				String name = e.nextElement(); //nextElement()로 다음거 꺼낸다.
		%>
		<tr>
			<td><%= name %></td>
			<td><%= request.getHeader(name)%></td>
		</tr>
		<%
			}
		%>
		
	</table>
	
	<hr>
	<p>서버 도메인 : <%= request.getServerName() %></p>
	<p>서버 포트번호 : <%=  request.getServerPort()%></p>
	<p>요청 URL : <%= request.getRequestURI() %></p>
	<p>요청 쿼리 문자열 : <%= request.getQueryString() %></p>
	<p>클라이언트 주소(우리꺼 IP) ㅣ <%= request.getRemoteHost() %>
	<p>프로토콜: <%= request.getProtocol() %></p>
	<p>요청 메소드: <%= request.getMethod() %></p>
	<p>루트 컨텍스트: <%= request.getContextPath() %></p>
	<p></p>
	<p></p>
	<p></p>
	<p></p>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script>

</script>
</body>
</html>
