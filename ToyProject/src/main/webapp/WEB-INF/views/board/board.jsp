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
	
	.comment-count{
		font-size:12px;
		color:#777;
	}
	
	#searchForm{
		margin-bottom: 15px;
		text-align: center;
	}
	
</style>
</head>
<body>
	<!-- template.jsp -->
	<%@ include file="/WEB-INF/views/inc/header.jsp" %>
	<main id="main">
		<h1><span class="material-symbols-outlined">menu_book</span> 게시판
			<c:if test="${map.search == 'n'}"> 
				<small>목록</small>
			</c:if>
			<c:if test="${map.search == 'y'}"> 
				<small>검색</small>
			</c:if>
			
			<span id="pagebar" style="float: right; margin-top: -5px;">
				<input type="number" id="page" name="page" class="short"  min="1" value="${nowPage}" max="${totalPage}">
				<input type="button" value="이동" onclick="location.href='/toy/board/board.do?page=' + $('#page').val()+ '&column=${map.column}&word=${map.word}';">
				<input type="button" value="이동" onclick="location.href='/toy/board/board.do?page=' + $('#page').val() + '&column=${map.column}&word=${map.word}';">
			</span>
			
		</h1>
		<!-- h1이나 p태그등의 일부 태그들은 안에다가 block 태그를 못적는다. -->
		
		
		<span id="paegbar" style="float: right;">
			<select onchange="location.href='/toy/board/board.do?page='+$(this).val() + '&column=${map.column}&word=${map.word}';">
				<c:forEach var="i" begin="1" end="${totalPage}">
				<option value="${i}" <c:if test="${i == nowPage}">selected</c:if>>${i}페이지</option>
				</c:forEach>
			</select>
		</span>
	
		
		<c:if test="${map.search == 'y'}">
		<div style="text-align: center;">
			'${map.word}'(으)로 검색한 결과 ${totalCount}건이 있습니다.
		</div>
		</c:if>
		
		<table id="list">
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>이름</th>
				<th>날짜</th>
				<th>조회수</th>
			</tr>
			
			<!-- 게시물 없음처리 ↓ 검색 결과가 없을때, 게시판을 처음시작할 때 -->
			<c:if test="${list.size()==0}">
				<tr>
					<td colspan="5">게시물이 없습니다.</td>
				</tr>
			</c:if>
			
			
			<c:forEach items="${list}" var="dto">
			<tr>
				
				<td>
					<c:if test="${dto.depth == 0}">
					${dto.seq}
					</c:if>
					<c:if test="${dto.depth > 0}">
					답변
					</c:if>
				</td>
				<td>
					<c:if test="${dto.depth > 0}">				
						<span class="material-symbols-outlined" style="font-size: 14px; font-weight:bold; margin-left:${dto.depth*20}px;">subdirectory_arrow_right</span>
					</c:if>

					<a href="/toy/board/view.do?seq=${dto.seq}&column=${map.column}&word=${map.word}&search=${map.search}">${dto.subject}</a> 
					
					<c:if test="${dto.ccnt > 0}">
						<span class="comment-count">(${dto.ccnt})</span> 
					</c:if>
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
		
		
		<!-- <form method="GET"> 사용 사례 얘는 무조건 GET으로 한다. 전송버튼 누르면 column, word가 자기자신에게 간다.  -->
		<!-- 이게 왜 GET방식일까? -->
		<form id="searchForm" action="/toy/board/board.do" method="POST">
			<select name="column">
				<option value="subject">제목</option>
				<option value="content">내용</option>
				<option value="name">이름</option>
			</select>
			<input type="text" name="word" class="long" required>
			<input type="submit" value="검색하기">		
		</form>
		
		
		<div id="pagination" style="text-align:center; margin-bottom:10px;">${pagination}</div>
		
		
		<div>
			<c:if test="${not empty id}">
			<button type="button" class="add primary" onclick="location.href='/toy/board/add.do?mode=new';">글쓰기</button>
			</c:if>
			<button type="button" class="list primary" onclick="location.href='/toy/board/board.do';">목록보기</button>
		</div>
	
	</main>

<script>
	<c:if test="${map.search == 'y'}">
	$('select[name=column]').val('${map.column}');
	$('input[name=word]').val('${map.word}');
	</c:if>
</script>
</body>
</html>
