<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- ex07.jsp -->
	<h1>데이터 보내기</h1>
	<!-- <form method="GET" action="ex07ok.jsp"> 요거는 상대경로, 아래껀 절대경로 </form> -->
	<form method="GET" action="/jsp/ex07ok.jsp">
		<div>이름: <input type="text" name="name"></div>
		<div><input type="submit" value="보내기"></div>
	</form>
	
</body>
</html>