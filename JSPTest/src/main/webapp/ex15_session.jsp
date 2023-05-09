<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//얘는 지역변수다. 방문을 계속 하더라도 상태 유지가 안된다. > 
	/* int a  = 1;
		a += 1; */
	
		
	//session.setAttribute(String name, Object value); > 세션은 상태유지를 가능하게 해주는 역할이다. 
	// 사전검사가 필요
	if(session.getAttribute("count") == null){
		session.setAttribute("count", 1);	
	}
	else {
        //object 타입이라 형변환해줘라
		session.setAttribute("count", (int)session.getAttribute("count") + 1);
	}
		
	
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
	<!-- ex15_session -->
	<h1>세션</h1>
	<div>방문 카운트 :<%= session.getAttribute("count") %> </div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script>

</script>
</body>
</html>
