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
<h1>[실행]</h1>
<div>
	검색어(동입력) : <input type="text" id="txt1"><input type="button" id="btn1" value="우편번호 검사하기">
</div>
<div>
	검색 결과 : <select id="sel1">
					<option>검색해주세요</option>
				</select>
</div>
<div>
나머지 주소 : <input type="text" id="txt2">
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script>
	$('#btn1').click(()=>{
		
		
		$.ajax({
			type: 'GET',
			url: '/question/zipcodedata.do',
			data: 'dong=' + $('#txt1').val(),
			dataType: 'json',
			success: (result) => {
				
			 	if(result == null) {
					alert("검색 결과가 없습니다");
				} else {
					$("#sel1").children().remove();
					$(result).each((index, item)=>{
						console.log(item.address);
						$("#sel1").append(`
								<option value="\${item.address}">\${item.address}</option>
								`)
					});
				} 
			},
			error: (a, b, c) => console.log(a, b, c)
		});
		
	});
</script>
</body>
</html>
