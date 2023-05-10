<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 로그아웃 > 인증 티켓 제거
	session.removeAttribute("id");
	session.removeAttribute("name");
	session.removeAttribute("lv");
	
	// 티켓을 제거 다시 시작페이지로 > 물리적으로 로그아웃이 됨
	response.sendRedirect("index.jsp");
	
	// seesion.setAttribute("user", map); 으로 넣어도 된다. 
%>
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
	<!-- logout.jsp -->
	<h1>로그 아웃</h1>

	
		


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script>

</script>
</body>
</html>
