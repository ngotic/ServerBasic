<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%
   	long tick = session.getCreationTime();
   
   	Calendar time = Calendar.getInstance();
	   
   	time.setTimeInMillis(tick);
   
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
 	<!-- ex16_session.jsp -->
 	
 	<h1>세션</h1>
 	
 	<h2>세션 정보 확인</h2>
 	<div>Session Id: 구별용도 <%= session.getId() %> </div>
 	<div>Session Creation Time: 만든시간 <%= String.format("%tF %tT", time, time)  %> </div>
 	<div>Session Max Inactive Interval: 타이머임 30분정도? <%=session.getMaxInactiveInterval() %></div>
	<div>Session isNew: 지금만든거냐? 아까 만든거 쓰고 있냐? 새로고침하면 false이다. <%=session.isNew() %></div>
	<% if(session.getAttribute("data") != null) { %>
		<div>session.data : <%= session.getAttribute("data") %></div>
	<% } else {  %>
		<div>session.data : 비었음 </div>
	<% } %>
		
	<h2>세션 조작</h2>
	<a href="ex16_set.jsp">세션값 저장하기</a>
	<a href="ex16_del.jsp">세션값 삭제하기</a>
	<a href="ex16_reset.jsp">세션 초기화</a>
	<a href="ex16_interval.jsp">세션 만료 시간 지정</a>
	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script>

</script>
</body>
</html>
