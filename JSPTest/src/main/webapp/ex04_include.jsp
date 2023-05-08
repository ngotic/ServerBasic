<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>include 지시자</h1>
	<p> 어저꾸 저쩌구 </p>
	<p> 어저꾸 저쩌구 </p>
	<p> 어저꾸 저쩌구 </p>
	<p> 어저꾸 저쩌구 </p>
	<p> 어저꾸 저쩌구 </p>
	<p> 어저꾸 저쩌구 </p>
	
	<!-- sub.jsp 불러오기 페이지의 일부분만 가져온다. 
	조각페이지라 한다. 
	조각 페이지는 내용만 살아야 한다. 페이지 통으로 삽입 되는거라 
	겹치는 안되는 애들은 다 지운다. 
	생산성과 유지보수성이 좋아진다. 겉으로는 티가 안나나 관리 차원에서 일부분이
	조각 페이지다 
	-->
	<%@ include file="inc/sub.jsp" %>
	
</body>
</html>