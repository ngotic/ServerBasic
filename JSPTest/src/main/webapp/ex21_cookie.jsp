<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://me2.do/5BvBFJ57">
<style>
	#txtid, #txtpw {
		width: 120px;
	}
	
	table  th {
		width: 120px !important;
	}
	
	table td{
		width: 180px !important;
	}
</style>
</head>
<body>
	<!--  ex21_cookie.jsp -->
	<h1>로그인</h1>
	<table class="vertical" style="width : 300px;">
		<tr>
			<td>아아디</td>
			<td><input type="text" id="txtid"></td>
		</tr>
		<tr>
			<td>암호</td>
			<td><input type="password" id="txtpw"></td>
		</tr>
	</table>
	<div>
		<input type="checkbox" id="cb">아이디기억하기
		<input type="checkbox" id="cb">자동로그인>이건 경고창도 띄움위험함
		<input type="button" value="로그인" id="btn">
	</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="js/cookie.js"></script>
<script>
	$('#txtid').focus();
	$('#btn').click(function(){
			if($('#txtid').val() == 'hong' && $('#txtpw').val()=='1234'){
				//로그인성공
				location.href='ex20_cookie_one.jsp';
				// ★ attr로 접근안되는건 prop으로 접근
				if($('#cb').prop('checked')) {
					//alert('O');
					setCookie('id', $('#txtid').val(), 365); // 이미 cookie.js에 Date가 있음
					// 마지막꺼 지정 안하면 메모리 쿠키다.
					// 365 쓰면 쿠키는 1년동안 살아있다. 하드쿠키
				} else {
					//alert('X');
					// 쿠키 삭제 
					setCookie('id', null, -1); // 쿠키 삭제는 따로 메서드가 없다. 
					// -1는 어제임 그러면 지금은 못쓴다. 이게 삭제다. 
				}
			} else {
				alert(' 아아디 or 암호가 일치하지 않습니다. ')
			}		
	});
	
	if(getCookie('id')!=''){
		$('#txtid').val(getCookie('id'));
		$('#txtpw').focus(); // 아이디 기억시 
		$('#cb').prop('checked', true);
	} else {
		$('#txtid').focus(); // 아이디 없으면
	}
	
	
</script>
</body>
</html>
