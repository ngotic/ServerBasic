<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<%
// 쿠키는 브라우저에 저장한다. 이 객체를 클라이언트쪾으로 보냉
	//Cookie cookie = new Cookie("color", "blue");

	// 브라우저저장하는법
	//response.addCookie(cookie);
	
	
	
	Cookie[] list = request.getCookies(); // 쿠키를 들고온다. 
	
	for(Cookie c : list){
		System.out.println(c.getName() +","+ c.getValue());
	}
	// 어떤 특정업무할 때 쓴다.

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


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script>

</script>
</body>
</html>
