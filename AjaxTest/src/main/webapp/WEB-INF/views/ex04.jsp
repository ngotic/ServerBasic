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
<!-- ex04.jsp -->
<h1>Ajax</h1>
<div>
	<input type="text" id="txt1">
	<input type="button" value="버튼" id="btn1">
	<div id="div1"> </div>
</div>

<hr>
<div>
	다른 작업 : <input type="text">
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script>

/*
 * 
Ajax 구현
1. 순수 자바스크립트(원래 Ajax)
2. jQuery Ajax
3. EX6 > PRomise > await
*/

const txt1= document.getElementById('txt1');
const btn1= document.getElementById('btn1');
const div1= document.getElementById('div1');

btn1.addEventListener('click', function() {
	
	// 요청 > 서버로부터 데이터를 받아오기
	// Ajax > 요청 > ajax 객체  > 에이젝스가 정배 > 서버와 통신할 수 있다. (전화기다.)
	const ajax = new XMLHttpRequest();
	ajax.onreadystatechange = function() {
		/*  console.log('readyState' , ajax.readyState); // 4번찎힘 현재 ajax객체 상태다.XMLHttpRequest의 상태를 나타낸다.
		console.log('status', ajax.status);   */
		// ajax.status >  ajax 껀 아님 서버가 클라이언트에게 보내주는 상태코드
		if(ajax.readyState == 4 && ajax.status == 200) {
			// ajax.readyState == 4 이면, 200번대 괜찮다. 서버로부터 안전하게 데이터를 수신했다. 
			div1.textContent = ajax.responseText;
		}
	};
	//
	ajax.open('GET', '/ajax/ex04.txt'); // open도 요청한다. > 호출(X), 설정(O)
	ajax.send(); // 실제 연결(= 호출) > == 전송 버튼(submit)을 누른 효과
	
});
// 링크 페이지 부르기만한다.
// form 페이지를 부르고 데이터를 전송한다.


</script>
</body>
</html>
