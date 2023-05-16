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


	table tr td {
	 	display:inline-block;
		width:50px;
		height:50px;
		font-size:0px;
		background-color : white;
	}
</style>
</head>

<!-- <body oncontextmenu="return false;"> -->

<body oncontextmenu="return false;">
	<h1>[실행]</h1>
	<table>
		<tr>
			<td>0</td>
			<td>1</td>
			<td>2</td>
			<td>3</td>
			<td>4</td>
		</tr>
		<tr>
			<td>5</td>
			<td>6</td>
			<td>7</td>
			<td>8</td>
			<td>9</td>
		</tr>
		<tr>
			<td>10</td>
			<td>11</td>
			<td>12</td>
			<td>13</td>
			<td>14</td>
		</tr>
		<tr>
			<td>15</td>
			<td>16</td>
			<td>17</td>
			<td>18</td>
			<td>19</td>
		</tr>
		<tr>
			<td>20</td>
			<td>21</td>
			<td>22</td>
			<td>23</td>
			<td>24</td>
		</tr>
	</table>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script>

// AJax 처리는 은근히 느리다.
// View단 처리를 먼저 빠르게 하는 방법을 생각하자
	let ele = $('table tr td');
	
	loadCellStatus();
	
	$('table tr td').mousedown(function(){
		if(event.buttons == 1){
			
			if ( $(this).css('background-color') == 'rgb(255, 215, 0)'){
				$(this).css('background-color','white');	
			} else { 
				$(this).css('background-color','gold');
			}
					
			// rgb(255, 215, 0) : 골드
			// rgb(255, 0, 0) : 레드
			
			let divide = Math.floor(parseInt($(this).text())/5); // y
			let rest = (parseInt($(this).text()))%5; // x

			//  이전 값이 
			//  0 , 2 이면 >>>1
			//  1 이면 0으로 
			$.ajax({
				type:'POST',
				url: '/question/ajaxtabledataadd.do',
				data: 'y='+divide+'&x='+rest+'&ck='+ 1,
				dataType: 'json',
				success: (result)=>{ // json이야 ~ 
					if(result.result==1){
						// alert('성공');
					} else {
						// alert('실패');
					}
				},
				error: (a, b, c)=> console.log(a, b, c)
			});
			
		}
		else if(event.buttons == 2){
			
			if ( $(this).css('background-color') == 'rgb(255, 0, 0)'){ //2 
				$(this).css('background-color','white');	
			} else { // 흰색 or 노랑색이면 > 0, 1  
				$(this).css('background-color','red');
			}
			
			// 현재 state 기준으로 on, off
			// rgb(255, 215, 0) : 골드
			// rgb(255, 0, 0) : 레드
			// 이전 값이 
			//  0 , 1 이면 >>>2
			//  2 이면 0으로 
			
			let divide = Math.floor(parseInt($(this).text())/5); // y
			let rest = (parseInt($(this).text()))%5; // x
			let ck=2;
		
			$.ajax({
				type:'POST',
				url: '/question/ajaxtabledataadd.do',
				data: 'y='+divide+'&x='+rest+'&ck='+ 2,
				dataType: 'json',
				success: (result)=>{ // json이야 ~ 
					if(result.result==1){
						// alert('성공');
					} else {
						// alert('실패');
					}
				},
				error: (a, b, c)=> console.log(a, b, c)
			});
		}
		else if( event.buttons == 4 ) {
			$('table tr td').each((index, item)=>{
				$(item).css('background-color','white');
				resetCellStatus();
			})
		}
	});
	
	
	function resetCellStatus(){
		$.ajax({
			type:'POST',
			url: '/question/ajaxtabledataadd.do',
			data: 'y='+0+'&x='+0+'&ck='+ 0,
			dataType: 'json',
			success: (result)=>{ // json이야 ~
				if(result.result==1){
					// alert('성공');
				} else {
					// alert('실패');
				}
			},
			error: (a, b, c)=> console.log(a, b, c)
		});
	}
	
	
	function loadCellStatus(){ // 전체 업데이트 
		$.ajax({
			type:'GET',
			url: '/question/ajaxtabledataadd.do',
			
			dataType: 'json',
			success: (result)=>{ // json이야 ~
				$(result).each((index, item)=>{
					let ck = item.ck;
					let x = item.x;
					let y = item.y;
					if( ck =='1') {
						$(ele[index]).css('background-color','gold');
					} else if( ck =='0') {
						$(ele[index]).css('background-color','white');
					} else if( ck =='2'){
						$(ele[index]).css('background-color','red');
					}
				});
			},
			error: (a, b, c)=> console.log(a, b, c)
		});
	}
	
	
</script>
</body>
</html>
