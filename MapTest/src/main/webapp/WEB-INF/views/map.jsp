<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://me2.do/5BvBFJ57">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />

<style>

	#main{
		display:flex;
		align-items: flex-start;
	}
	#map{
		border : 1px solid gray;
		width: 550px;
		height: 400px;
	}
	#list{
		width: 200px;
		margin-top : 0px;
	}
	
	#list td{
		cursor:pointer;
	}
	#add {
	}
	
	
</style>
</head>
<body>
	<!-- map.jsp -->
	<h1>Map <small>Place</small></h1>
	
	
	<div id="main">
		<div id ="map">지도</div>
		<table id ="list">
			<c:forEach items="${mlist}" var="dto">
			<tr>
				<td style="display:flex; cursor:pointer;" data-lat="${dto.lat}" data-lng="${dto.lng}" data-category="${dto.cseq}" class="item">
					<span class="material-symbols-outlined">${dto.cicon}</span>
					<div style="margin-top: 3px;">${dto.name}</div>
				</td>
			</tr>
			</c:forEach>
			<tr>
				<td id="all">모두 보기 <span class="badge">0</span></td>
			</tr>
		</table>
	</div>
	
	
<!-- 	<div id="main">
		<div id ="map">지도</div>
		<table id="add">
			<tr>
				<th>장소명</th>
			</tr>
			<tr>
				<td>카테고리</td>
			</tr>
			<tr>
				<td>카테고리</td>
			</tr>
			<tr>
				<td>카테고리</td>
			</tr>
		</table>
	</div>
 -->
	<hr>
	
	<form method="POST" action="/map/map.do">
	<table id="add" class="vertical">
		<tr>
			<th>장소명</th>
			<td><input type="text" name="name" id="name" class="long"></td>
		</tr>
		<tr class="item">
			<th>카테고리</th>
			<td>
				<select name="category" id="category">
				<c:forEach items="${clist}" var="cdto">
					<option value="${cdto.seq}">${cdto.name}</option>
				</c:forEach>
				</select>
			</td>
		</tr>
		<tr>
			<th>위치</th>
			<td><div id="position"></div></td>
		</tr>
	</table>
	<div>
		<input type="submit" value="등록하기" id="btn">
	</div>
	<input type="hidden" name="lat" id="lat">
	<input type="hidden" name="lng" id="lng">
	</form>
	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=31ef66b24f93bbb959f9b59dc1f2b78a"></script>
<script>
	var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
	var options = { //지도를 생성할 때 필요한 기본 옵션
		center: new kakao.maps.LatLng(37.4993, 127.0331), //지도의 중심좌표.
		level: 3 //지도의 레벨(확대, 축소 정도)
	};
	
	var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
	
	let m = null;
	
	
	kakao.maps.event.addListener(map, 'click', function(event){
		
		if(m != null ){
			m.setMap(null);
		}
		
		$('#position').text(event.latLng);
		// console.log(event.latLng.getLat() + " / " +event.latLng.getLng());
		$('#lat').val(event.latLng.getLat());
		$('#lng').val(event.latLng.getLng());
		
		var imageSrc = '/map/marker/'+ $('#category').val() + '.png';    
	    var imageSize = new kakao.maps.Size(50, 50) // 마커이미지의 크기입니다
	    var imageOption = {offset: new kakao.maps.Point(25, 50)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
		// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
		var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption);

		// 마커를 생성합니다
	 	var marker = new kakao.maps.Marker({
		   position: event.latLng, 
		   image: markerImage  
		}); 
		
		m = new kakao.maps.Marker({
			position: event.latLng,
			image : markerImage
		});
		
		m.setMap(map);
	});
	const ms = [];
	
	$('#list .item').click(function(){
		
		// if (this.id == 'all')
		
		if (m != null) {
			m.setMap(null);
		}
		
		ms.forEach(item=>{
			item.setMap(null);
		});
		
		let p = new kakao.maps.LatLng($(this).data('lat'), $(this).data('lng'));
		var imageSrc = '/map/marker/'+ $(this).data('category') + '.png';    
	    var imageSize = new kakao.maps.Size(50, 50) // 마커이미지의 크기입니다
	    var imageOption = {offset: new kakao.maps.Point(25, 50)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
	      
		// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
		var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption);

		m = new kakao.maps.Marker({
			position: p,
			image : markerImage
		});
		
		m.setMap(map);
		
		map.panTo(p);
		
		$('#list td').css('background-color', 'transparent');
		$(this).css('background-color', 'gold');
	
	});
	

	$('#all').click(function(){
		
		if (m != null) {
			m.setMap(null);
		}
		
		$('#list td').css('background-color', 'transparent');
		$(this).css('background-color', 'gold');
		
		<c:forEach items="${mlist}" var="dto" varStatus="status">
			let p${status.count} = new kakao.maps.LatLng(${dto.lat}, ${dto.lng});
			var imageSrc = '/map/marker/${dto.cseq}.png';    
		    var imageSize = new kakao.maps.Size(50, 50) // 마커이미지의 크기입니다
		    var imageOption = {offset: new kakao.maps.Point(25, 50)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
		      
			// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
			var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption);
	
			let m${status.count} = new kakao.maps.Marker({
				position: p${status.count},
				image : markerImage
			});
			
			m${status.count}.setMap(map);
			
			ms.push(m${status.count});
			
		</c:forEach>
		
	});

	// 눈에 보이는 마커, 눈에 안보이는 마커 구분할 수 있어야 한다. 
	// 맵 옮겨질 떄 호출 
	kakao.maps.event.addListener(map, 'bounds_changed', function(event){
		// console.log(new Date());
		// console.log(map.getBounds()); // 지도 안에 포함인지 안다.
		
		// 남서쪽
		const sw = map.getBounds().getSouthWest();
		// 북동 
		const ne = map.getBounds().getNorthEast();
		
		// -------------------북동//
		//                      //
		//                       //
		//남서-------------------//
		
		// ne : Lat : 127.03583860,       Lng : 37.5010566381
		// sw : Lat : 127.03000161802768, Lng : 37.49735512926372
		
		// 위도 > 가로선 > lat > x
		// 경도 > 세로선 > lng > y
		
		console.log('sw', sw);
		console.log('ne', ne);
		
		let count = 0;
		
		 <c:forEach items="${mlist}" var="dto" varStatus="status">
			
			if ((ne.getLat() > ${dto.lat} && sw.getLat() < ${dto.lat})
				 &&  (ne.getLng() > ${dto.lng} && sw.getLng() < ${dto.lng})){
				count++;
				$('#list td').eq(${status.index}).css('background-color', 'rgba(255, 215, 0, .3)');
			}
				
		</c:forEach>
		
		$('#all .badge').text(count);
		
	});
	
</script>
</body>
</html>
