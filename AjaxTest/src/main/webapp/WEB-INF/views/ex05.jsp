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
	<!-- ex05.jsp -->
	<h1>Ajax 요청</h1>
	<div>
		<input type="button" value="확인" id="btn1">
		<hr>
		<div id="div1"></div>
	</div>
	<hr>
	
	<div>
		<input type="text" id="txt2">
		<input type="button" value="확인" id="btn2">
	
		<hr>
		<div id="div2"></div>
	</div>
	<!-- <form method="POST" action="/ajax/ex05data.do" enctype="text/"> -->
	<hr>
		<div>
			<input type="text" id="txt3"  name="txt3">
			<input type="submit" value="확인2" id="btn3">
		<hr>
			<div id="div3"></div>
		</div>
	<!-- </form> -->
	
	<hr>
	
	<div>
		다른 작업 : <input type="text">
	</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script>
	$('#btn1').click(function(){
		const ajax = new XMLHttpRequest();
		
		ajax.onreadystatechange = function(){
			if(ajax.readyState == 4 && ajax.status == 200) {
				// 요청한 데이터를 올바르게 수신할 수 있는 순간 !! 
				$('#div1').text(ajax.responseText);
				// alert(ajax.responseText);
			}
		};
		
		// 브라우저로 서블릿 호출이나 data로 서블릿 호출이나 동일하다. 
		// ajax.open('GET', '/ajax/ex05.txt');  // 텍스트 파일을 get요청
		ajax.open('GET', '/ajax/ex05data.do', true);  // 텍스트 파일을 get요청
		 // 연결 + 접속 + 요청 // 리턴값 처럼 수신하진 않는다.
		ajax.send(); 
		// > 콜백함수로 이벤트를 통해서 돌려받는다. 
	});
	
/* 	$('#btn2').click(()=>{
		const ajax = new XMLHttpRequest();
		// ajax > (데이터) > 서버
		// 1. GET   > QueryString
		// 2. POST  > 
		//ajax.open('GET', '/ajax/ex05data.do?txt2=' + $('#txt2').val());
		ajax.open('POST', '/ajax/ex05data.do'); 
		// 서버가 반응함 POST로 반응 > 넘겨준게 없으니까 null 
		// 넘겨준게 없으니까 별도의 다른 방식으로 넘겨야 한다. 		
		ajax.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
		//ajax.send("txt2=222");
		ajax.send('txt2='+$('#txt2').val());
		
	}); */
	
	$('#btn3').click(()=>{
		const ajax = new XMLHttpRequest();
		// 데이터 수신
		ajax.onreadystatechange = function(){
			if(ajax.readyState == 4 && ajax.status == 200) {
				$('#div3').text(ajax.responseText);
			}
		};
		
		ajax.open('GET', '/ajax/ex05data.do?txt3='+$('#txt3').val());
		ajax.send(); // 연결 + 접속 + 요청 > 동기
		//ajax.send('txt3='+$('#txt3').val());
		
	});
	 
</script>
</body>
</html>
