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
	<h1>세션 만료 시간 지정</h1>
	
	<%	
		// 1800 중에 30초로 줄임
		// 위험해서 웬만하면 조절 안한다. > 어떤 사이트는 만료시간을 줄인다. 
		// 어떤 사이트는 만료시간을 오래 둠, 한페이지를 오래 읽을 수 있으니까 > 블로그 글이 길다.  
		session.setMaxInactiveInterval(30);
	%>
	
	<a href="ex16_session.jsp">돌아가기</a>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script>

</script>
</body>
</html>
