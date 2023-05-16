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
	<!-- ex07.jsp -->
	<h1>Ajax <small>데이터 형식</small></h1>
	
	<div>	
		<h2>Text</h2>
		<input type="button" value="확인" id="btn1">
		<div id="div1"></div>
	</div>
	
	
		<hr>
	<div>	
		<h2>XML</h2>
		<input type="button" value="확인" id="btn2">
		<div id="div2"></div>
	</div>
	
		<hr>
	<div>	
		<h2>JSON***</h2>
		<input type="button" value="확인" id="btn3">
		<div id="div3"></div>
	</div>
	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script>

	$('#btn1').click(()=>{
		$.ajax({
			type:'GET',
			url : '/ajax/ex07data.do',
			data: 'type=1',
			dataType : 'text', // 서버가 Ajax에게 돌려주는 데이터 형식 같이 선언해야 한다.
			// (text, xml, json)
			success : (result) => {
				$('#div1').text(result)
			},
			error : (a, b, c) => console.log(a, b, c)
		});
	});
	
	$('#btn2').click(()=>{
		
		
	/* 	$.ajax({
			type:'GET',
			url : '/ajax/ex07data.do',
			data: 'type=2',
			dataType : 'text', // 서버가 Ajax에게 돌려주는 데이터 형식 같이 선언해야 한다.
			// (text, xml, json)
			success : (result) => {
				// $('#div1').text(result)
				const lines = result.split('\r\n'); // 엔터 때문에 하나 더 들어감
				lines.forEach(line=>{
					const items = line.split(',');
					$('#div2').append(
						`
							<div>\${items[0]} - \${items[4]}</div>
						`
					);
				});
			},
			error : (a, b, c) => console.log(a, b, c)
		});
		 */
		 
		/* $.ajax({
			type:'GET',
			url : '/ajax/ex07data.do',
			data: 'type=3',
			dataType : 'xml', // 서버가 Ajax에게 돌려주는 데이터 형식 같이 선언해야 한다.
			// (text, xml, json)
			success : (result) => { // $('#div1').text(result)
				//$('#div2').text(result)
				$('#div2').text($(result).find('question').text());
				//$('#div2').text($(result).find('#q1').text());
			},
			error : (a, b, c) => console.log(a, b, c)
		}); */
		
		
		$.ajax({
		type:'GET',
		url : '/ajax/ex07data.do',
		data: 'type=4',
		dataType : 'xml', // 서버가 Ajax에게 돌려주는 데이터 형식 같이 선언해야 한다.
		// (text, xml, json)
		success : (result) => { // $('#div1').text(result)
			$(result).find('item').each((index, item)=>{
				$('#div2').append(
					`
						<div>
							\${$(item).find('seq').text()}
							:
							\${$(item).find('name').text()}
							:
							\${$(item).find('address').text()}
						</div>
					`
				);
				
			});// 사람수 만큼 찾아준다.
		},
		error : (a, b, c) => console.log(a, b, c)
		}); 
	});
	
	$('#btn3').click(()=>{
		$.ajax({
			type: 'GET',
			url : '/ajax/ex07data.do',
			data:'type=6',
			dataType:'json',
			success : (result)=>{
				// result = {"question":"가장 자신 있는 프로그래밍 언어는?"}
				// alert(result.question);
				$(result).each((index, item)=>{
					$('#div3').append(
						`
							<div>\${item.name}</div>
						`
					); //SyntaxError: Unexpected token ']', ..."대문구 회기동"},]" is not valid JSON
				});
			},
			error: (a, b, c) => console.log(a, b, c)
		});
	
	});


</script>
</body>
</html>
