<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://me2.do/5BvBFJ57">
<style>
	#files > div{
		margin-bottom: 5px;
	}
	.item {
		margin-bottom: 5px;
	}
</style>
</head>
<body>
	<h1>다중 파일 업로드</h1>
	<form method="POST" action="/file/multifileok.do" enctype="multipart/form-data">
		<div>
			<div>이름 : </div>
			<div><input type="text" name="name"></div>
		</div>
		<div id="files">
			<div>파일 : </div>
			<div class="item"><input type="file" name="attach1"></div>
			<div id="list"></div>
			<div><input type="button" value="+" id="btnadd"></div>
		</div>
		<div>
			<input type="submit" value="업로드">
		</div>
	</form>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script>
// -버튼을 바깥에 추가하지말고
// - 기존에 있는 item에 삭제버튼을 붙여서 
	let n =2;
	$('#btnadd').click(()=>{ // html은 상관없는데 jsp에서는 !! ★ el로 알아먹으니까 $앞에 \ 붙인다
		$('#list').append(`<div class="item">
								<input type="file" name="attach\${n}">
								<input type="button" value="X" 
									onclick="$(this).parent().remove();">
						   </div>`); // 부모 아이템으로 해서 지워야 한다!!! 제이쿼리시 child parent
		n++;
	});
	
</script>
</body>
</html>
