<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Address</title>
<%@ include file="inc/asset.jsp" %>

<style>

</style>
</head>
<body>
	<!-- add.jsp -->
	<%@ include file="inc/header.jsp" %>
	<div>
	
		<h3>추가하기</h3>
		<form method="POST" action="addok.jsp">
		
		<table class="vertical"> 
			<tr>
				<th>이름</th>
				<!-- DB컬럼이름과 name이랑 똑같이 줘라  -->
				<td><input type="text" name="name" required class="short" autocomplete="off"></td>
			</tr>
			<tr>
				<th>나이</th>
				<td><input type="number" name="age" required class="short" autocomplete="off" min="0" max="150"></td>
			</tr>
			<tr>
				<th>전화</th>
				<td><input type="tel" name="tel" required ></td>
			</tr>
			<tr>
				<th>주소</th>
				<td><input type="text" name="address" required class="long"></td>
			</tr>
		</table>
			
			<div>
				<button type="button" onclick="location.href='list.jsp';">
					<span class="material-symbols-outlined">list</span>목록보기
				</button>
				<button type="submit">
					<span class="material-symbols-outlined">draw</span>추가하기
				</button>
			</div>
			
		</form>
			
	</div>

<script>

	(function() {
		// 더미 입력
		const name = ['김', '이', '정', '최', '박', '민', '경', '현', '선', '진', '한' ];
		
		const address = ['서울시 강남구 역삼동',
			'서울시 강동구 천호동',
			'서울시 강서구 둔천동',
			'서울시 동대문구 회기동', 
			'서울시 은평구 불광동'];
		//$('input[name=name]').val(name[parseInt(Math.random()* name.length )] + name[parseInt(Math.random() * name.length)] + name[parseInt(Math.random() * name.length)]);
		$('input[name=name]').val(name[parseInt(Math.random() * name.length)] + name[parseInt(Math.random() * name.length)] + name[parseInt(Math.random() * name.length)]);
		$('input[name=age]').val(parseInt(Math.random()*20) + 20);
		$('input[name=tel]').val('010-1234-5678');
		$('input[name=address]').val(address[parseInt(Math.random() * address.length)]);
		
	})(); //★ 즉시호출이다. 
</script>
</body>
</html>
