<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://me2.do/5BvBFJ57">
<style>
	body{
		/* background-image : url(images/rect_icon01.png); */
	}
	
	table {
		background-color:white;
	}
	
</style>
</head>
<body>
	<!-- 
	쿠키, Cookie
	- 개인 정보를 저장하는 저장소
	- 브라우저가 관리하는 저장소
	
	- JSP(Servlet), Javascript 등 쿠키에 접근해서 조작 가능
	
	쿠키의 종류(session cookie)
	1. 메모리쿠키
		- 메모리에는 저장되고, 디스크에는 저장 안된다.
		- 브라우저가 실행중에만 저장
		- 브러우저가 종료되면 쿠키도 삭제
		- 은행은 계정보안 철저히 해야해서 아이디를 기억하면 안된다.
		- 그래서 이거 쓸때도 있음
		- Expires/ Max-Age부분이 Session이면 Session쿠키
		
	2. 하드쿠키(persistent cookie)
		- 브라우저가 종료되도 유지
		- 하드 디스크, 유효기간을 셋팅, 만료되야 파기된다.
		- Expires/ Max-Age부분이 특정한 기간이 기록
	 -->

	<h2>배경 화면 선택(테마)</h2>
	
	<table>
		<tr>
			<td><img src="images/rect_icon01.png"></td>
			<td><input type="radio" name ="background" value="rect_icon01.png" checked></td>
		</tr>
		<tr>
			<td><img src="images/rect_icon02.png"></td>
			<td><input type="radio" name ="background" value="rect_icon02.png"></td>
		</tr>
		<tr>
			<td><img src="images/rect_icon03.png"></td>
			<td><input type="radio" name ="background" value="rect_icon03.png"></td>
		</tr>
	</table>
	<div style="background-color: white;">
		<a href="ex20_cookie_one.jsp">첫번째 페이지</a>
		<a href="ex20_cookie_two.jsp">두번째 페이지</a>
		<a href="ex20_cookie_three.jsp">세번째 페이지</a>
	</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="js/cookie.js"></script>
<script>
	/* document.cookie = 100;
	console.log(document.cookie) 
	이런식으로 저장은 안하고 key, value식으로 저장한다. 
	*/
	//key = value&key=value.. 
	setCookie('name','홍길동');
	/* console.log(getCookie('name')); */
	console.log('***'+getCookie('background' == ''));
	
	if(getCookie('background') == '') {
		// 첫 방문
		const date  =new Date();
		date.setFullYear(date.getFullYear()+1);
		// 이 때, 선택한 테마를 쿠키에 저장도 한다.
		setCookie('background', 'rect_icon01.png', 365);
	}
	else {
		// 재방문 
		$('body').css('background-image', `url(images/\${getCookie('background')})`);
		
		// 자스 forEach(item, index)
		// 제이쿼리 each(index, item)
		
		$('input[name=background]').each((index, item)=>{
			if( $(item).val() == getCookie('background') ){
				$(item).attr('checked', true);	
			} else {
				$(item).attr('checked', false);
			}
			
		});
	}
	
	/* $('body').css('background-image', `url(images/\${$(this).val()})`); */
	
	$('input[name=background]').change(function(){
		//alert($(this).val()); > ★ 템플릿 스트링 쓸 때 역슬래시 써라 !! jsp에선 그렇다. 
		$('body').css('background-image', `url(images/\${$(this).val()})`);
		/* 	const date  =new Date();
		date.setFullYear(date.getFullYear()+1); */ // 이미 정의되어 있음
		// 이 때, 선택한 테마를 쿠키에 저장도 한다.
		setCookie('background', $(this).val(), 365);
	});
</script>
</body>
</html>
