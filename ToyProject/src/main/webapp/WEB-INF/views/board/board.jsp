<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<%@ include file="/WEB-INF/views/inc/asset.jsp" %>

<style>
	
	/* 리스트 정리, 그리고 글쓴지 얼마 안된 경우 표시하고 싶다. */
	#list th:nth-child(1) { width: 50px; }
	#list th:nth-child(2) { width: auto;  }
	#list th:nth-child(3) { width: 70px; }
	#list th:nth-child(4) { width: 120px; }
	#list th:nth-child(5) { width: 50px; }
	
	#list td { text-align: center; }
	#list td:nth-child(2) { text-align: left; }
	
	.isnew {
		font-size: 14px;
		color: tomato;
	}
</style>
</head>
<body>
	<!-- template.jsp -->
	<%@ include file="/WEB-INF/views/inc/header.jsp" %>
	<main id="main">
		<h1>게시판 <small>목록</small></h1>
		
		<table id="list">
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>이름</th>
				<th>날짜</th>
				<th>조회수</th>
			</tr>
			<c:forEach items="${list}" var="dto">
			<tr>
				<td>${dto.seq}</td>
				<td>
					${dto.subject}
					<c:if test="${dto.isnew < 30/ 24 / 60}"> <!-- 글쓴지 30분 안되면 새글이다.  -->
						<span class="isnew">new</span>
					</c:if>
					
				</td>
				<td>${dto.name}</td>
				<td>${dto.regdate}</td>
				<td>${dto.readcount}</td>
				<!-- 날짜 시간을 여기 클라이언트 단에서 안건드리고 서블릿단에서 건든다. -->
			</tr>
			</c:forEach>
		</table>
		<div>
			<button type="button" class="add primary" onclick="location.href='/toy/board/add.do';">글쓰기</button>
		</div>
	
	</main>

<script>

</script>
</body>
</html>
