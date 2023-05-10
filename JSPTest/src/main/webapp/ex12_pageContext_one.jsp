<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%

// 지역변수 
int a = 10; // 여기 페이지에서만 유효하다.
// > 모든 자원은 페이지를 지역으로 하는 지역자원이다. 
// 그래서 명시적으로 아래처럼 쿼리스트링으로 날려준다. 

// 내장 객체
// pageContect, request, session, application
// - 내부에 컬랙션을 소유한다.
// 이거 아래 html에서 잘나온다.
pageContext.setAttribute("b", 20); // pageContext변수,
request.setAttribute("c", 30); // 서버 메모리에 저장한다., request변수 


// SendRedirect는 클라이언트측 이동이다. 
// > 클라이언트가 2번요청

// pageContext.forward는
// 클라이언트로 돌아가지 않는다. 
// 바로 서버에서 이동한다. 서버측 이동 


//response.sendRedirect("ex12_pageContext_two.jsp"); // 일반적인 이동
pageContext.forward("ex12_pageContext_two.jsp"); // 데이터를 넘기면서 이동할 때는 forward쓴다. 


%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://me2.do/5BvBFJ57">
<style>
/*
    
    서버측 자원의 생명주기
    - 서블릿 or JSP > 여러가지 자원 > 언제 생성 ~ 소멸
    - 현재 JSP 페이지가 실행 중일때 > JSP 페이지 처리 종료 > 
    자원을 html에서 사용했던 자원은 그때그때마다 소멸시킨다. 
    HTML의 특성을 이용해서 링크를 만들 때 쿼리 스트링으로 하면 전송할 수 있다. 
*/
</style>
</head>
<body>

<h1>첫번째 페이지</h1>
	<div> a: <%= a %></div>
	<div> b: <%= pageContext.getAttribute("b") %></div>
	<div> c: <%= request.getAttribute("c") %></div>
	<a href="ex12_pageContext_two.jsp?a=<%= a %>">두번째 페이지로 이동하기</a>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script>

</script>
</body>
</html>
