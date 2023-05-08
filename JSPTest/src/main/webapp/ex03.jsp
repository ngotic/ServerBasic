<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 이페이지는 이런거야 라는 환경설정 셋팅                                          이 페이지 처리시 문제가 나면 일로 간다.-->
<%@ page import="java.util.Calendar"%>
    
<%
	Calendar now = Calendar.getInstance();
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- ex03.jsp 이거보면 이게 나오겠구나 머리속에서 상상 가능해야 한다.
	이거 가지고 브라우저로 화면 어떻게 만드나??  -->
	<h1>현재 시각</h1>
	<p>오늘은 <%= String.format("%tF", now) %>입니다.</p>
						<!-- 원래 500에러인데 이거 일반 사용자가 보면 안된다.  -->
	<%@ include file="inc/sub.jsp" %>
</body>
</html>