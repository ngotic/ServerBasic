<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MEMO</title>
<%@include file="/WEB-INF/views/inc/asset.jsp" %>
<style>

</style>
</head>
<body>
	<!--  edit.hsp -->
	<h1>Memo<small>Edit</small></h1>
	<form method="POST" action="/memo/edit.do">
	<table>
		<tr>
			<th>메모</th>
			<td><textarea name="memo" id="memo" required value="123">${dto.memo}</textarea></td>
													
		</tr>
		<tr>
			<th>카테고리</th>
			<td>
				<select name="category" id ="category">
					<c:forEach items="${clist}" var="cdto">
						<option value="${cdto.seq}">${cdto.name}</option>
					</c:forEach>
				</select>
			</td>
			<input type="hidden" name="seq" value="${dto.seq}">
		</tr>
	</table>
	
	<div>	
		<input type="button" value="돌아가기" onclick="location.href='/memo/list.do';">
		<input type="submit" value="수정하기" class="primary">
	</div>
	</form>

<script>
	/* alert(${dto.cseq}); */
	$("#category").val(${dto.cseq});
</script>
</body>
</html>
