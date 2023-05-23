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
	#info img{
		border : 1px solid #AAA;
		padding : 3px;
		width : 150px;
		height : 180px;
		object-fit:cover;
	}
	#pic {
		width: 170px;
		text-align: center;
	}
	#info th:nth-child(2),
	#info th:nth-child(4) { width: 90px; }
	
	#info td:nth-child(3),
	#info td:nth-child(5) { width: 193px; }
	

	#count th {width: 170px;}
	#count td {width: 198px;}
	
</style>
</head>
<body>
	<!-- template.jsp -->
	<%@ include file="/WEB-INF/views/inc/header.jsp" %>
	<main id="main">
		<h1>회원 정보 <small>이것 저것</small></h1>
		콘텐츠 내용
		
		<table id="info">
			<tr>
				<td rowspan="3" id="pic"><img src ="/toy/asset/pic/${dto.pic}"></td>
				<th>이름</th>
				<td>${dto.name}</th>
				<th>아이디</th>
				<td>${dto.id}</th>
			</tr>
			<tr>
				<th>등급</th>
				<td>${dto.lv =='1' ? '일반회원': '관리자'} </th>
				<th>이메일</th>
				<td>${dto.email}</th>
			</tr>
			<tr>
				<td colspan="4">${dto.profile}</td>
			</tr>
		</table>
		<h2>활동 내역</h2>
		
		<table id="count">
			<tr>
				<th>게시물 수</th>
				<td>${map.bcount}회</td>
				<th>댓글 수</th>
				<td>${map.ccount}회</td>
			</tr>
		</table>
	</main>

<script>

</script>
</body>
</html>
