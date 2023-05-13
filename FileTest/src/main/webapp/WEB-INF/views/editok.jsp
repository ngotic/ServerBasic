<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	<!-- editok.jsp -->

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script>

	// 수정 성공시 
	<c:if test="${result == 1}">
		//location.href= '/file/view.do'; 
		// 번호를 넘겨줘야 하는데 번호가 없으면 보시려는 게시물이 삭제되었습니다. 뜨게함
		location.href= '/file/view.do?seq=${seq}'; // 번호를 알아야 한다.
	</c:if>
	
	// 수정 실패시 
	<c:if test="${result == 0}">
		alert("failed");
		history.back();
	</c:if>
	
</script>
</body>
</html>
