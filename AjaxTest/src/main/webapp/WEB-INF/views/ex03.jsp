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
	#chart {
	
	
	}
	
	#chart > div{
		border : 1px solid #999;
		font-size: 12px;
		padding: 4px;
		text-align : right;
		
		margin-bottom: 5px;	
	}
	
	#chart > div:nth-child(1){
		 background-color:tomato; 
		 color:white;
	}
	#chart > div:nth-child(2){
		 background-color:gold;
		
	}
	#chart > div:nth-child(3){
		 background-color:cornflowerblue;

		 color:white;
	}
	#chart > div:nth-child(4){
		 background-color:orange; 
	
	}
</style>
</head>
<body>
	<!-- ex03 -->
	<h1  id="title">설문 조사</h1>
	<div id="question">주제 : <span></span></div>
	<div id="chart">
		
		<div><span class="item"></span>(<span class="cnt"></span>)</div>
		<div><span class="item"></span>(<span class="cnt"></span>)</div>
		<div><span class="item"></span>(<span class="cnt"></span>)</div>
		<div><span class="item"></span>(<span class="cnt"></span>)</div>
	
	</div>
	
	<hr>
	메모 : <input>
	
	<iframe src="/ajax/ex03data.do"  style="display:none"></iframe> 
	<!-- <iframe src="http://yes24.com" width="600" height="300"></iframe> -->
	<!-- iframe은 조각페이지다.  -->
	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script>
	
</script>
</body>
</html>
