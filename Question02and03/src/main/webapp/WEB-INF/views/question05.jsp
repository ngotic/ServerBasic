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
<h2>실행</h2>
<body>
	<table style="margin-bottom:40px">
		<tr>
			<th>번호</th>
			<th>이름</th>
			<th>전화</th>
			<th>주소</th>
		</tr>
		<c:forEach items="${list}" var="dto">
		<tr>
			<td>${dto.seq}</td>
			<td>${dto.name}</td>
			<td>${dto.tel}</td>
			<td>${dto.address}</td>
		</tr>
		</c:forEach>
		
	</table>
	
<div style="border:1px solid #777">
<form id="addForm" class="short">
	
	<div>
		<label for="name">이름 : </label>
		<input type="text" id="name" required="required" name="name">
	</div>
	
	<div>
	<label for="tel">전화 : </label>
	<input type="text" id="tel" required="required" name="tel">
	</div>
	
	<div>
	<label for="address">주소 : </label>
	<input type="text" id="address" required="required" onkeydown="addEnter();" name="address">
	</div><br>
	
	<input type="button" value="입력하기" onclick="addList()">
	
</form>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script>

	function addList() {
		
		let formData = new FormData(document.getElementById('addForm'));
		
		$.ajax({
			type: 'POST',
			url: '/question/question05.do',
			data: {
				name: formData.get('name'),
				tel: formData.get('tel'),
				address: formData.get('address') }, 
			dataType: 'json',
			success : (result) => {
				if(result.result == 1)  {
					alert('성공적 추가');	
					
				} else {
					alert('실패');
				}
			},
			error : (a, b, c) => console.log(a, b, c)
		});
	}

</script>
</body>
</html>
