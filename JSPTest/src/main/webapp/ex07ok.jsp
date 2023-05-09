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
		
		// 1. GET : 데이터를 URL에 붙여서 전송   > 인코딩 규칙 > URL 규칙에 따름 > 톰켓을 통해서 전송 > 톰켓을 통해서 전송 > 톰켓 현재 UTF-8을 사용
		// 옛날엔 톰켓도 utf-8이 아니었는데 요즘은 같음 그래서 GET방식은 한글이 안깨짐,   
		// 2. POST : 데이터를 패킷에 넣어서 전송 > 인코딩 규칙 > 자바 규칙에 따름  > POST는 UTF-8을 안쓴다. ISO8859인가 EUC-kr이다. > 그래고 인코딩 처리를 해야 한다.
		
		// ex07에서 ------POST-----> ex07ok.jsp로 보내는 리퀘스트에 대한 설정을 아래서 한거고 getParameter Post로 보낸 데이터도 받는것 
		// doGet(HttpServletRequest request, )
		
		// 한글이 안깨짐 한글 깨지고 안깨지는 문제는 나중에 알자 
		// 리퀘스트가 쿼리스트링 수신함 이거 GET으로 오니까 쿼리스트링으로 오고 이걸 받는 것이다.
		request.setCharacterEncoding("UTF-8");
		
		String name = request.getParameter("name");
	
	%>
	
	<div>결과 : <%=name %></div>
	
</body>
</html>