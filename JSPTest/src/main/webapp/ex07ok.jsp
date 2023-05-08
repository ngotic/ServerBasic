<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- ex07ok.jsp -->
	<%
		
		// 클라이언트(브라우저)가 전송한 데이터를 수신하기(가져오기)
		// 얘는 import 없이 가져온다.
		
		// doGet(HttpServletRequest request, )
		
		// 한글이 안깨짐 한글 깨지고 안깨지는 문제는 나중에 알자 
		// 리퀘스트가 쿼리스트링 수신함 이거 GET으로 오니까 쿼리스트링으로 오고 이걸 받는 것이다. 
		String name = request.getParameter("name");
	
	%>
	
	<div>결과 : <%=name %></div>
	
</body>
</html>