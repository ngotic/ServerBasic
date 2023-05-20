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

	.line {
		display:block;
		width: calc(100% - 20px);
		border : 0px;
		border-bottom: 1px solid #999;
		border-radius: 0;
	}
	
	
	/* 이벤트가 호출시 flex를 넣어줌 그래서 중앙 정렬이 된 메세지가 뜸  */
	#message { 
		width: 100%;
		height: 100vh;
		background-color: rgba(0, 0, 0, .1);
		position : absolute;
		left: 0;
		top:0;
		display: none;
		justify-content: center;
		align-items: center;
	}
	#messgae > div {
		width : 100px;
		height: 20px;
		background-color: white;
	}
	

</style>
</head>
<body>
	<h2>Journal</h2>
	<div>
		<c:forEach items ="${list}" var="dto" varStatus="status">
			<input type ="text"
			       name ="line${status.count}"
			       id   ="line${status.count}"
			       class="line"
			       value="${dto.line}">
		</c:forEach>
<!-- 	<input type="text" name="line2" id="line2" class="line">
	    <input type="text" name="line3" id="line3" class="line">
	    <input type="text" name="line4" id="line4" class="line">
	    <input type="text" name="line5" id="line5" class="line">
	    <input type="text" name="line6" id="line6" class="line">
	    <input type="text" name="line7" id="line7" class="line">
	    <input type="text" name="line8" id="line8" class="line">
	    <input type="text" name="line9" id="line9" class="line">
	    <input type="text" name="line10" id="line10" class="line">
	    <input type="text" name="line11" id="line11" class="line">
	    <input type="text" name="line12" id="line12" class="line">
	    <input type="text" name="line13" id="line13" class="line">
	    <input type="text" name="line14" id="line14" class="line">
	    <input type="text" name="line15" id="line15" class="line"> -->
	</div>
	
	<div id="message">
		<div>자동 저장되었습니다.</div>
	</div>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script>

	let timer = 0;
	
	// alert(document.getElementById('line1')); //Object HTMLInputElement
	
	$('.line').each((index, item)=>{
		// item은 DOM이다. 
		// 차이가 명확하다. 
		//★ alert(item);    // Object HTMLInputElement
		//★ alert($(item)); // Object Object
		console.log($(item).index()); // 0, 1, 2, 3, 4 쭈욱 출력
	});
	
	
	
	$('.line').keydown(function(){
		clearTimeout(timer);
		let temp = this;
		
		timer = setTimeout(function() {

			let seq  = $(temp).index()+1;
			let line = $(temp).val(); // 얘는 클로저가 된다.
			$.ajax({
				type : 'POST',
				url : '/ajax/ex12data.do',
				data : {
					seq : $(temp).index() + 1,
					line: line
				},
				error : (a, b, c) => console.log(a, b, c)
			});
			
			// 안내 메세지
			$('#message').css('display', 'flex');
			setTimeout(function() {
				$('#message').css('display', 'none');
			}, 1000);
			
			
		}, 5000); // 5초 후 임시저장
	});
	
	
	// blur() : 대상이 포커스를 잃었을 때 이벤트를 처리하는 이벤트 핸들러 
	$('.line').blur(function(){
		//alert($(this).eq()) //alert();
		let seq = $(this).index()+1;
		let line = $(this).val(); // 얘는 클로저가 된다.

		$.ajax({
			type : 'POST',
			url : '/ajax/ex12data.do',
			data : {
				seq : $(event.target).index() + 1,
				line: line
			},
			error : (a, b, c) => console.log(a, b, c)
		});
	});
	
</script>
</body>
</html>
