<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <link rel="stylesheet" href="https://me2.do/5BvBFJ57"> -->
<!-- BootStrap CSS only -->
    
    <link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">  
<style>
	#tbl{
		width:600px;
	}
	#main{
		width: 700px;
		margin:auto;
	}
</style>
</head>
<body>	
	
	<!-- ex09.jsp -->
	<div id="main"> 
	<h1>버튼 만들기</h1>
	<form method="POST" action="ex09ok.jsp">
		<div> d: <%= session.getAttribute("d") %></div>
		<table border="1" class="table table-bordered" id="tbl">
			<tr>
				<th>너비(px)</th>
				<td><input type="number" min="20" max="300" step="10" name="width" value="100"></td>
			</tr>
			<tr>
				<th>높이(px)</th>
				<td><input type="number" min="10" max="200" step="10" name="height" value="50"></td>
			</tr>
			<tr>
				<th>텍스트</th>
				<td>
					<input type="text" name="txt" value="Button">
				</td>
			</tr>
			
			<tr>
				<th>배경색</th>
				<td><input type="color" name="bgColor" value="#ffffff"></td>
			</tr>
			
			<tr>
				<th>글자색</th>
				<td><input type="color" name="fontColor" ></td>
			</tr>
			
			<tr>
				<th>글자크기</th>
				<td><input type="number" name="fontSize" value="16"></td>
			</tr>
			
			<tr>
				<th>버튼개수</th>
				<td><input type="number" name="ea" value="1" min="1" max="30"></td>
			</tr>
			
			<tr>
				<th>버튼 간격</th>
				<td>
					좌우 간격 : <input type="range" name="range1" value="0" min="0" max="50" style="width:100px;"><br>
					상하 간격 : <input type="range" name="range2" value="0" min="0" max="50" style="width:100px;">
				</td>
			</tr>
			
			<tr>
				<th>아이콘</th>
				<td>
					<input type="radio" name="icon" checked>없음
					<input type="radio" name="icon"  value="glyphicon glyphicon-heart"><span class="glyphicon glyphicon-heart"></span>
					<input type="radio" name="icon" value="glyphicon glyphicon-headphones"> <span class="glyphicon glyphicon-headphones"></span>
					<input type="radio" name="icon" value="glyphicon glyphicon-camera"> <span class="glyphicon glyphicon-camera"></span>
					<input type="radio" name="icon" value="glyphicon glyphicon-facetime-video"> <span class="glyphicon glyphicon-facetime-video"></span>
					<input type="radio" name="icon" value="glyphicon glyphicon-magnet"> <span class="glyphicon glyphicon-magnet"></span>
				</td>
			</tr>
			
			<tr>
				<th>테두리</th>
				<td>
					<select name="sel1">
						<option value="f1">감추기</option>
						<option value="f2">보이기</option>
					</select>
				</td>
			</tr>
			
		</table>
		<div>
			<input type="submit" class="btn btn-success" value="만들기">
		</div>
	</form>
	</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script>
	
</script>
</body>
</html>
