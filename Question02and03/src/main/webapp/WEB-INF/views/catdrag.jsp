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

<c:forEach items="${list}" var="catDto" varStatus="status">
	<img src="images/${catDto.id}" id="cat${status.count}" class="cat" style="left: ${catDto.x}px;top:${catDto.y}px; position:absolute;">
</c:forEach>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="js/jquery-ui.js"></script>
<script>
	// 1. 고양이 5마리의 위치를 불러와서 찍음
	
	$('.cat').each((index, item)=>{
		$(item).draggable({
			cursor:'move',	
			drag:function(event,ui){
				console.log("드래그 중입니다.");
	        },
	        stop:function(event,ui){
	        	console.log(event.clientX+" , "+event.clientY); // 이 때 위치를 담아서 jquery로 전송
	        	console.log(event.target.id);
	        	let catId= event.target.id;
	        	let catfileName = $('#'+catId).attr('src').substring($('#'+catId).attr('src').indexOf('/')+1,
	        														 $('#'+catId).attr('src').length);
				let x = $('#'+catId).css('left').replace('px','');
				let y = $('#'+catId).css('top').replace('px','');
				// alert(x.replace('px','') + ", "+y.replace('px',''));
				
				$.ajax({
					type:'POST',
					url : '/question/catdragdata.do',
					data:{
						id : catfileName,
						x : x,
						y : y
					},
					dataType:'json',
					success : (result) => {
						if (result.result) {
							alert('옮기기 성공');
						} else {
							alert('옮기기 실패');
						}
					},
					error : (a, b, c) => console.log(a, b, c)
				});			
				
		
	        	
	        	
	        }
		});	
	});
	
	
</script>
</body>
</html>
