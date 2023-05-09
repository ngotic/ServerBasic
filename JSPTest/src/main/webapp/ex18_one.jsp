<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	

	// 상태 유지를 하고 싶다!!
	// one.jsp > (이동) > two.jsp
	// 이동 방식이랑 상관있는경우, 이동방식 말고 다른 경우가 있는 경우 
	//1. 지역변수
	int a = 10;
	
	//3. pageContext 
	pageContext.setAttribute("c", 30); // 이친구는 페이지 바뀌면 죽으니까 여전히 null이다. 
	
	//4. request 
	request.setAttribute("d", 40);
	
	//5. session 
	session.setAttribute("e", 50);
	
	//6. application 
	application.setAttribute("f", 60);
	
	pageContext.forward("ex18_two.jsp"); // 이거 씀으로 인해서 request가 이제 보인다. 
	
	// 내장 객체중에서 데이터 저장의 4가지가 있는데 그 이유가 생명주기가 달라서 그렇다. 
	// 여기서 써먹은 걸 어디까지 써먹을래~ 하고 골라서 준 것이다. 
	// 너무 과하거나 모자르면 쓸데가 없다. 그래서 request, session이 메인이다. 
	
%>
<%!
	//2. 멤버변수
	int b = 10;
	
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
	<!-- ex18_one.jsp -->
	<h1>첫번째 페이지</h1>
	<a href="ex18_two.jsp">이동하기</a>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script>

</script>
</body>
</html>
