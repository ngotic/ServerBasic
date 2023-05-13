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
	<div>txt : ${txt}</div>
	<div>orgfilename : ${orgfilename}</div>
	<div>filename : ${filename}</div>
	
	<!-- download는 자기가 받아온걸 무조건 하드에 저장하라는 옵션이다. 이거 붙이면 이미지도 다운로드 된다.  -->
	<hr>											
	<div>다운로드 : <a href="/jsp/uploads/${filename}" download=${filename}>${filename}</a> </div>
	<!--  이미지 파일은 열린다. 다른 파일은 다운 받아지는데
	열리는 것도 다운로드다. 왜 열리고 안열리냐? 브라우저 때문이다. 
	해석 가능하면 보여준다. 아니면 떠넘긴다. 이미지를 다른 이름으로 링크저장하면 다운로드가 된다.  -->
	
	<a href="http://naver.com" download>네이버</a>
	
	
	<hr>
	<div>
		다운로드 > 하드디스크에 있는 파일명, 원래 파일명 그대로
		<a href ="/jsp/file/download.do?filename=${filename}&orgfilename=${orgfilename}">${orgfilename}</a>
		<a href ="/file/download.do?filename=${filename}&orgfilename=${orgfilename}">${orgfilename}</a>		
		<a href ="<c:url value='/file/download.do?filename=${filename}&orgfilename=${orgfilename}'/>">이렇게</a> 
	</div>
	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script>

</script>
</body>
</html>
