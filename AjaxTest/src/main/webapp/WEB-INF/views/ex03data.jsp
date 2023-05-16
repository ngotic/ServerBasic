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
	<!-- ex03data page -->

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script>
	// 상위 window.top를 한번에 받아올 수 있ㄷ.  
	// 안쪽 문서 > 바깥쪽 문서
	// top.document.getElementById('title').textContent = 'test';
	top.document.getElementById('question').textContent = '${dto.question}';
	// iframe에서 top은 최상위인데 최상위노드 속성을 변경 
	// https://xorms0707.tistory.com/10
	
	<c:forEach var="i" begin="0" end="3">
		top.document.getElementsByClassName('item')[${i}].textContent = '${dto.item[i]}';
		top.document.getElementsByClassName('cnt')[${i}].textContent = '${dto.cnt[i]}';
		top.document.querySelectorAll('#chart > div')[${i}].style.width = '${dto.cnt[i] * 40}px';
	</c:forEach>
	
	
	setTimeout(function() {
		location.reload();
	}, 5000);// 이러면 5초 있다가 새로고침, 또 5초 있다가 새로고침 
	
</script>
</body>
</html>


