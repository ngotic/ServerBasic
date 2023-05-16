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
<body class="narrow">
	<!-- ex06.jsp -->
	<h1>Ajax <small>JQuery</small></h1>
	
	<div>
		<input type="text" id="txt1">
		<input type="button" value="확인" id="btn1">
		<div id="div1"></div>
	</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script>


	//$('#btn1').click(()=>{
	//$('').click(()=>{ // 이렇게 해놓으면 아무것도 안걸린다. 걍 무효화댐
		// $(검색 태그).메소드() > 어떤 범용함수라고 보면 된다.
		// > ajax.send() 
		//$.ajax(); // 이거 자체가 send이다.
		
		/* $.ajax({
			// 페이지 요청 정보 
			type : 'GET',
			url : '/ajax/ex06data.do',
			// 데이터 전송(QueryString + GET/POST)
			data :'txt1=' + $('#txt1').val()
		});*/
		
	/* 	$.ajax({
			// 페이지 요청 정보 
			type : 'GET',
			url : '/ajax/ex06data.do', */
			// 데이터 수신
		/* 	data :'txt1=' + $('#txt1').val(), // 이쪽의 데이터가 넘어가고 
			success : function(result){
				$('#div1').text(result); // 서버에서 응답한 데이터를 수신한다. 
			},  */
			// ajax 예외 처리
/* 			error : function(a, b, c){
				console.log(a, b, c);
			}
		});
	}); */
	
	$('#btn1').click(()=>{
		// Ajax, 비동기(async)
		// 동기통신 요청 액션 > 상대방 액션을 기다린다. > 상대방 결과 듣고 내 일 시작
		// 비동기통신 > 요청 액션 > 바로 다른 일 가능하다. 
		// 비동기 응답할 때마다 채널 새로열고 서로 독립적이다.
		
		// 네트워크 통신
		// 1. 동기 통신 > 요청 이후 아무것도 못해서 멍떄린다. > 이거 잘못쓰면 서버 먹통
		// 2. 비동기 통신 > 요청하고도 내가 할 것 하면 된다. > 아차피 콜백함수 온다. 
		
		$.ajax({
			type:'GET',
			url: '/ajax/ex06data.do',
			async : true, // 비동기(true), 동기(false) 
			success : function(result){
				$('#div1').text(result);
			}, 
			error: function(a, b, c) {
				console.log(a, b, c);
			}
		});
		
		// 비동기 통신이라 요렇게 요상한 형태이다. 
	
	});
	
	
	
	
</script>
</body>
</html>
