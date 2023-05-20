<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<%@ include file="/WEB-INF/views/inc/asset.jsp" %>

<style>
	#login { width: 350px; }
	#login th { width: 120px; }
</style>
</head>
<body>
	<!-- template.jsp > login.jsp -->
	<%@ include file="/WEB-INF/views/inc/header.jsp" %>
	<main id="main">
		<h1>회원 <small>로그인</small></h1>
		<form method="POST" action="/toy/user/login.do">
		<table class="vertical" id="login">
			<tr>
				<th>아이디</th>
				<td><input type="text" name="id" id="id" required class="short"></td>
			</tr>
			<tr>
				<th>암호</th>
				<td><input type="password" name="pw" id="pw" required class="short"></td>
			</tr>
		</table>
		<div>
			<button type="submit" class="back" onclick="location.href='/toy/index.do';">돌아가기</button>
			<button type="submit" class="login primary">로그인</button>
		</div>
		</form>
		
		<div style="display:flex;">
			<!-- 버튼하나 눌러버리면 hidden 태그에 담긴 것이 서버로 넘어가서 로그인이 된다.  -->
			<form method="POST" action="/toy/user/login.do">
				<input type="hidden" name="id" value="hong">
				<input type="hidden" name="pw" value="1111">
				<input type="submit" value="hong">
			</form>
			
			<form method="POST" action="/toy/user/login.do">
				<input type="hidden" name="id" value="Kim">
				<input type="hidden" name="pw" value="0000">
				<input type="submit" value="Kim">
			</form>
			
			<form method="POST" action="/toy/user/login.do">
				<input type="hidden" name="id" value="하나둘">
				<input type="hidden" name="pw" value="123">
				<input type="submit" value="하나둘">
			</form>
			
			<form method="POST" action="/toy/user/login.do">
				<input type="hidden" name="id" value="admin">
				<input type="hidden" name="pw" value="1111">
				<input type="submit" value="관리자">
			</form>
		</div>
	</main>

<script>

</script>
</body>
</html>
