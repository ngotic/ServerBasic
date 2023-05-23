<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<%@ include file="/WEB-INF/views/inc/asset.jsp" %>
<!-- <script src="/toy/asset/js/summernote-lite.js"></script>
<script src="/toy/asset/js/summernote-ko-KR.js"></script>
<link rel="stylesheet" href="/toy/asset/css/summernote-lite.css">
 -->

<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
  
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

<style>
button::before {
	content:'';
}
</style>
</head>
<body>
	<!-- template.jsp -->
	<%@ include file="/WEB-INF/views/inc/header.jsp" %>
	<main id="main">
		<h1>게시판 <small>수정하기</small></h1>
		<form method="POST" action="/toy/board/edit.do">
		<table class="vertical">
			<tr>
				<th>제목</th>
				<td><input type="text" name="subject" id="subject" required class="full" value="${dto.subject}"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td>
				<%-- <textarea name="content" id="content" required class="full">${dto.content}</textarea> --%>
				</td>
				
				<textarea id="summernote" name="content" value="${dto.content}">${dto.content}</textarea>
				
			</tr>
		</table>
		
		<div>
			<button type="button" class="back" onclick="history.back();">돌아가기</button>
			<button type="submit" class="edit">수정하기</button>
		</div>
		<input type="hidden" name="seq" value="${dto.seq}">
		</form>
		<input type="button" name="seq" value="테스트 버튼" id="btntest">
	</main>

<script>
$('#btntest').click(function(){
	alert($('#summernote').val());
});



$(document).ready(function() {
    $('#summernote').summernote(
    );
});
</script>
</body>
</html>
