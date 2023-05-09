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
	<!-- ex18_one.jsp -->
	<h1>두번째 페이지</h1>
	<%-- <div>a: <%=a %></div> 에러 --%>
	<%-- <div>b: <%=b %></div> 에러 --%>
	<div>c: <%=pageContext.getAttribute("c") %></div> <!-- null 유지 안댐-->
	<div>d: <%=request.getAttribute("d") %></div>     <!-- null forward로 이동할 때만 유지  -->
	<div>e: <%=session.getAttribute("e") %></div>     <!-- 접속 종료 안했으니 유지 -->
	<div>f: <%=application.getAttribute("f") %></div> <!-- 접속 종료 안했으니 유지 --> 

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script>

</script>
</body>
</html>
