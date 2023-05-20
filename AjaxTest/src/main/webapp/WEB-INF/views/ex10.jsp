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
	<h1>Ajax</h1>
	<!-- form전송에서 action이 없으면 자기자신으로 새로고침이 된다.  -->
	<form id="form1">
		<div>
			<input type="text" name="txt1" id="txt1" value="강아지">
		</div>
		<div>
			<input type="text" name="txt2" id="txt2" value="고양이">
		</div>
		<div>
			<input type="text" name="txt3" id="txt3" value="토끼">
		</div>
		<div>
			<input type="text" name="txt4" id="txt4" value="사자">
		</div>
		<div>
			<input type="text" name="txt5" id="txt5" value="호랑이">
		</div>
		<div>
			<input type="submit" id="btn1" value="보내기" >
		</div>
	</form>
	
	<hr>
	
	<div>
		<input type="button" value="가져오기	" id="btn2">
	</div>
	<div id="result" class="panel" title="result"></div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script>
	const obj = { // 이건 굉장히 체계적이고 이걸 전송할 수 있도록 지원을 해준다. 
		txt1 : $('#txt1').val(),
		txt2 : $('#txt2').val(),
		txt3 : $('#txt3').val(),
		txt4 : $('#txt4').val(),
		txt5 : $('#txt5').val()
	};
	/*
	// 
	$('#form1').submit(( ) => {
		$.ajax({
			type:'GET',
			url: '/ajax/exdata.do',
			data: obj, // 이렇게 넣으면 끝이다.
			//data : jsonStr, // 이거 안됨
      //data : data, //이것도 된다! 
			success: (result) => {},
			error: (a, b, c)=>console.log(a,b,c)
		});
		event.preventDefault(); // 
		return false;           // 
	});
	*/
	
	
 	$('#form1').submit(( ) => {
		alert(JSON.stringify("{'txt1' : '딸기', 'txt2' : '바나나', 'txt3' :'포도', 'txt4':'배', 'txt5':'멜론' }"));
		$.ajax({
			type:'POST',
			url: '/ajax/ex10data.do',
			//data: obj, // 이렇게 넣으면 끝이다.
			contentType: 'application/json',
			//data : JSON.stringify(obj),
			//data : "{\"txt1\" : \"딸기\", \"txt2\" : \"바나나\", \"txt3\" :\"포도\", \"txt4\":\"배\", \"txt5\":\"멜론\" }", 
			//data : "{'txt1' : '딸기', 'txt2' : '바나나', 'txt3' :'포도', 'txt4':'배', 'txt5':'멜론' }", // json String 이거 안됨
			//data : data, //oK 된다.
			//data: JSON.stringify("{'txt1' : '딸기', 'txt2' : '바나나', 'txt3' :'포도', 'txt4':'배', 'txt5':'멜론' }"), // 이거도 안된다.
			dataType: 'json',
			success: (result) => {},
			error: (a, b, c)=>console.log(a,b,c)
		});
		event.preventDefault();
		return false; 
	});  
	
	// form이 전송이 일어나는 것을 막고 클릭 이벤트 처럼 만든 것이다.
	
	
	// ★ 전송해줄 데이터타입은 객체로 넣어도 되고, 쿼리스트링 방식으로도 된다. 


	 
	
	let data = 'txt1=' + $('#txt1').val()
			+ '&txt2=' + $('#txt2').val()
			+ '&txt3=' + $('#txt3').val()
			+ '&txt4=' + $('#txt4').val()
			+ '&txt5=' + $('#txt5').val();
	 
	
	// alert(data);
	/* 
	$.ajax({
			type:'GET',
			url: '/ajax/exdata.do',
			data:'',
			success: (result) => {},
			error: (a, b, c)=>console.log(a,b,c)
		});
	
	
	
	$('#form1').submit(()=>{
		$.ajax({
			type:'GET',
			url:'/ajax/ex10data.do',
			data: data,
			success: (result) => {},
			error : (a, b, c) => console.log(a, b, c)
			
		})
	}); */
	
	/*
	$('#form1').submit(()=>{
		alert($('#form1').serialize()); // 보내는 방법 3
		alert(decodeURI($('#form1').serialize())); // 보내는 방법 3
		// 이거 쓰면 한방에 다 들어간다. 
		// ★ 반드시 name이 있어야 한다. 출력되는건 이미 퍼센트 인코딩이 되어 있다.
		$.ajax({
			type:'GET',
			url:'/ajax/ex10data.do',
			data: $('#form1').serialize(), // 편하다.
			success: (result) => {},
			error : (a, b, c) => console.log(a, b, c)
			
		})
	}); */
	
	
	/* $('#form1').submit(()=>{
		//<input type="checkbox" name="aaa">
		const list = ['사과', '바나나', '딸기', '포도', '귤'];
		$.ajax({
			type:'GET',
			url:'/ajax/ex10data.do',
			traditional: true, // ★ 요렇게 한쌍> 이것이 ajax 배열 넘기기 옵션 
			data: {            // ★ 
				list:list
			}, // 편하다.
			success: (result) => {},
			error : (a, b, c) => console.log(a, b, c)
			
		})
	}); */
	
	// Object 형태로 보내던지, 
	
	
	/*
	$('#form1').submit(()=>{
		// 객체화 
		const obj = { // 이건 굉장히 체계적이고 이걸 전송할 수 있도록 지원을 해준다. 
				txt1 : $('#txt1').val(),
				txt2 : $('#txt2').val(),
				txt3 : $('#txt3').val(),
				txt4 : $('#txt4').val(),
				txt5 : $('#txt5').val()
			};
		alert(JSON.stringify(obj)); // 자바스크립트 object를 json 표기 string으로 바꾼다.
		alert(typeof JSON.stringify(obj)); // string
		const list = ['사과', '바나나', '딸기', '포도', '귤'];
		$.ajax({
			type:'POST', //JSON으로 데이터를 보낼 때 반드시 POST로 보낸다. 
			url:'/ajax/ex10data.do',
			contentType: 'application/json', //★ 이건 요청하는 서블릿쪽으로 보내는 테이터의 타입 정의  // jsonType은 내가 받는 result에 대한 정의
			data: JSON.stringify(obj), // 서버로 보낸다. 
			success: (result) => {},
			error : (a, b, c) => console.log(a, b, c)
		})
	});
	*/
	
	
	$('#btn2').click(()=>{
		$.ajax({
			type: 'GET',
			url : '/ajax/ex10data.do',
			
			dataType: 'json',
			success: (result) => {
				//$('#result').append('<div>' + result.seq+ '</div>');
				//$('#result').append('<div>' + result.question+ '</div>');
				$(result).each((index, item) =>{
					$("#result").append('<div>'+ item.name + '</div>');
					$("#result").append('<div>'+ item.age + '</div>');
					$("#result").append('<div>'+ item.address + '</div>');
					$("#result").append('<hr>');
				});
			},
			error: (a, b, c) => console.log(a, b, c)
		});
	});
	
	
</script>
</body>
</html>
