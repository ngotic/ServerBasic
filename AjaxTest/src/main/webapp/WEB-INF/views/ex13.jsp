<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://me2.do/5BvBFJ57">
<style>
	#list{
	}
	
	#list th:nth-child(1){ width: 160px; }
	#list th:nth-child(2){ width: 250px; }
	#list th:nth-child(3){ width: 100px; }
	#list th:nth-child(4){ width: 100px; }
	#list th:nth-child(5){ width: 158px; }
	#list td:nth-child(1) img{
		 width:150px;
		 height:150px;
		 object-fit:cover;
	 }
	#list td { text-align : center; }
	
</style>
</head>
<body>
	<h1>Product List</h1>
	<table id="list">
		<thead>
		<tr>
			<th>사진</th>
			<th>제품명</th>
			<th>가격</th>
			<th>색상</th>
			<th>편집</th>
		</tr>
		</thead>
		<tbody>
		<c:forEach items="${list}" var="dto">
		<tr>
			<td><img src="/ajax/pic/${dto.pic}"></td>
			<td>${dto.name}</td>
			<td><fmt:formatNumber value="${dto.price}"/>원</td>
			<td>${dto.color}</td>
			<td>
				<div>
					<input type="button" value="수정" onclick ="edit();">
					<input type="button" value="삭제" onclick ="del(${dto.seq});">
				</div>
				<div style="display:none;">
					<input type="button" value="확인" onclick ="editok(${dto.seq});">
					<input type="button" value="취소" onclick ="cancel();">
				</div>
				
				
				
				
			</td>
		</tr>
		</c:forEach>
		</tbody>
	
	</table>
	<hr>
	
	<form id="form1">
	<table id ="add">
		<tr>
			<th>제품명</th>
			<td><input type="text" name ="name" id="name"></td>
		</tr>
		<tr>
			<th>가격</th>
			<td><input type="number" name="price" id="price" min="0" max="10000000" step="1000"></td>
		</tr>
		<tr>
			<th>색상</th>
			<td>
				<select name="color" id="color">
					<option value="검정색">검정색</option>
					<option value="흰색">흰색</option>
					<option value="회색">회색</option>
				</select>
			</td>
		</tr>
		<tr>
			<th>사진</th>
			<td><input type="file" name="pic"></td>
		</tr>
	</table>
	</form>
	
	<div>
		<input type="button" value="상품 등록하기" id="btn">
	</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script>

	$('#btn').click( ()=>{
		
		// 일반 텍스트 + 첨부 파일 > Ajax 통해서 전송  
		// const formData = new FormData($('#form1')[document.getElementById('form1')]);
		const formData = new FormData(document.getElementById('form1'));
		$.ajax({ // 새로고침없이 파일첨부
			type: 'POST',
			url: '/ajax/ex13add.do',
			enctype: 'multipart/form-data',
			processData: false,
			contentType: false,
			
			data : formData, // 이러면 form이 담긴 데이터를 전송한다.// ★ toLocaleString은 parseInt로 바꾸고 해야한다. 
			dataType:'json',
			success : (result)=> {
				if(result.result == 1) {
					alert(11);
					let tr = `
						<tr>
							<td><img src="/ajax/pic/\${result.pic}"></td>
							<td>\${$('#name').val()}</td>
							<td>\${parseInt($('#price').val()).toLocaleString()}원</td>
							<td>\${$('#color').val()}</td>
							<td>
								 <div>
			                        <input type="button" value="수정" onclick="edit();">
			                        <input type="button" value="삭제" onclick="del(\${result.seq});">
			                     </div>
			                     <div style="display:none;">
			                        <input type="button" value="확인" onclick="editok(\${result.seq});">
			                        <input type="button" value="취소" onclick="cancel();">
			                     </div>
							</td>
						</tr>
					`;
					$('#list tbody').prepend(tr);
					$('#name').val('');
					$('#price').val('');
					$('#color').val('검정색');
				} else {
					alert('failed');
				}
				
			}, error: (a, b, c) => console.log(a, b, c)
		});
	});
	
	let temp_name='';
	let temp_price='';
	let temp_color='';
	
	function edit(seq) {
		let tr = event.target.parentElement.parentElement.parentElement;
		
		let name = $(tr).children().eq(1).text();
		$(tr).children().eq(1).html('<input type="text" value="'+name+'">'); // 폼을 따로 안만들고 누르는 순간 이렇게 만든다. 
		
		let price = $(tr).children().eq(2).text();
		$(tr).children().eq(2).html('<input type="number" class="short" value="'+price.replace('원','').replace(/,/g, '')+'" min="0" max="100000000" step="1000">'); // 폼을 따로 안만들고 누르는 순간 이렇게 만든다.
		
		let color = $(tr).children().eq(3).text();
		$(tr).children().eq(3).html(
				`
				<select name="color" id="color2">
					<option value="검정색">검정색</option>
					<option value="흰색">흰색</option>
					<option value="회색">회색</option>
				</select>
				`
		);
		
		$('#color2').val(color);
		$(event.target).parent().parent().children().last().show();
		$(event.target).parent().hide();
		
		temp_name=name;
		temp_price=price;
		temp_color=color;
		
		
		
	}
	
	function del(seq){ // 내가 클릭했던 순간을 기억 그것을 ajax 안에서 사용하는 것 ! 
		// ★ callback함수라 event.target 못쓴다. this못쓴다. 
		// ★ 그래서 closure를 사용해서 이전에 함수가 호출했던 순간을 기억한다. 
		let tr = event.target.parentElement.parentElement.parentElement; // tr
		alert(seq);
		
		$.ajax({
			type: 'POST',
			url : '/ajax/ex13del.do',
			data : {
				seq : seq
			},
			dataType : 'json',
			success : (result)=>{
				if(result.result == 1) {
					alert('성공');
					// 화면에 있는 상품을 삭제 
					$(tr).remove();

				} else {
					alert('failed');
				}
			},
			error: (a, b, c) => console.log(a, b, c)
		});
	}
	
	function editok(seq) {
	
		let btn = event.target;
		let name = $(btn).parent().parent().parent().children().eq(1).children().eq(0).val();
		$(btn).parent().parent().parent().children().eq(1).text(name);
		let price = $(btn).parent().parent().parent().children().eq(2).children().eq(0).val();
		$(btn).parent().parent().parent().children().eq(2).text(price);
		let color = $(btn).parent().parent().parent().children().eq(3).children().eq(0).val();
		$(btn).parent().parent().parent().children().eq(3).text(color);
		// alert(color);	
		$.ajax({
			type:'POST',
			url:'/ajax/ex13edit.do',
			data: {
				seq:seq,
				name:name,
				price:price,
				color:color
			},
			dataType:'json',
			success: (result)=>{
				
				$(btn).parent().hide();
				$(btn).parent().parent().children().first().show();
				
			}
		});
		
	}
	
	function cancel() {
		$(event.target).parent().hide();
		$(event.target).parent().parent().children().first().show();
		
		$(event.target).parent().parent().parent().children().eq(1).text(temp_name);
		$(event.target).parent().parent().parent().children().eq(2).text(temp_price);
		$(event.target).parent().parent().parent().children().eq(3).text(temp_color);
	}
	
	
	
	// CSR 우리가 지금 하는것 CSR(Client Side Rendering)
	// SSR : 화면에 보이는 페이지 내용을 어디서 만드느냐의 차이 
</script>
</body>
</html>
