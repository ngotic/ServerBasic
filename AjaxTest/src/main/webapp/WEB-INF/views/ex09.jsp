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
	<h1>우편번호 검색</h1>
	<table>
		<tr>
			<th>검색어(동입력)</th>
			<td>
				<input type="text" id="dong" class="short">
				<input type="button" id="btn1" class="short" value="검색하기">
			</td>
		</tr>
		<tr>
			<th>결과</th>
			<td>
				<select id="address1">
					<option value="0">검색해주세요</option>
				</select>
			</td>
		</tr>
		
	</table>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script>
	
	
	$('#dong').keydown(()=>{
		if(event.keyCode == 13){
			$('#btn').click(); // 애뮬레이터 함수 // > 진짜 이벤트가 발생 
		}
	});
	

	$('#address1').change(()=>{ // 변경이 되면 다음칸으로 focus
		$('#address2').focus();
	});

	$('#btn1').click(()=>{
		
		$('#address1').html('');
		
		$.ajax({
				type: 'GET',
				url : '/ajax/ex09data.do',
				data: 'dong='+$('#dong').val(),
				dataType : 'json',
				success: (result) => {
					$(result).each((index, item) => {
						$('#address1').append(
						`
							<option value=''>\${item}</option>
						`		
						);
					});
				},
				error: (a, b, c) => console.log(a, b, c)
		});
	});
</script>
</body>
</html>
