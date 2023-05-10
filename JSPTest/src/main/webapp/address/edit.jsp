<%@page import="com.test.my.DBUtil"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1. 데이터 가져오기 <edit.jsp?seq=10>
	//2. DB작ㅇ버 > select ... where seq = 10;
	//3. 결과 > 컨트롤 입력
	
	//1. 
	String seq = request.getParameter("seq"); 
	// 자기가 밭은 번호를 editok에게도 전달해야 
	// 하는데 이런걸 세션이나 쿠키에 넣지 않는다. 
	
	//2. 
	Connection conn = null;
	PreparedStatement stat = null;
	ResultSet rs = null;
	
	conn = DBUtil.open();
	String sql = "select * from tblAddress where seq = ?";
	stat = conn.prepareStatement(sql);
	stat.setString(1, seq);
	
	rs = stat.executeQuery();
	
	// 깔끔하게 하려고 지역변수에 다 넣었다. 
	String name = "";
	String age = "";
	String tel = "";
	String address ="";
	
	if ( rs.next() ){
		name = rs.getString("name");
		age = rs.getString("age");
		tel = rs.getString("tel");
		address = rs.getString("address");
	}
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Address</title>
<%@ include file="inc/asset.jsp" %>

<style>

</style>
</head>
<body>
	<!-- template.jsp > edit.jsp -->
	<%@ include file="inc/header.jsp" %>
	<div>
		<h3>수정하기</h3>
		<form method="POST" action="editok.jsp">
		
		<table class="vertical"> 
			<tr>
				<th>이름</th>
				<!-- DB컬럼이름과 name이랑 똑같이 줘라  -->
				<td><input type="text" name="name" required class="short" autocomplete="off" value="<%= name %>"></td>
			</tr>
			<tr>
				<th>나이</th>
				<td><input type="number" name="age" required class="short" autocomplete="off" min="0" max="150"></td>
			</tr>
			<tr>
				<th>전화</th>
				<td><input type="tel" name="tel" required ></td>
			</tr>
			<tr>
				<th>주소</th>
				<td><input type="text" name="address" required class="long"></td>
			</tr>
		</table>
			
			<div>
				<button type="button" onclick="location.href='list.jsp';">
					<span class="material-symbols-outlined">list</span>목록보기
				</button>
				<button type="submit">
					<span class="material-symbols-outlined">draw</span>수정하기
				</button>
			</div>
			<!-- list.jsp > (seq) > edit.jsp > (seq) > editok.jsp 소스보기 해라 -->
			<input type="hidden" name="seq" value="<%= seq %>">
		</form>
	</div>

<script>
	$('input[name=age]').val("<%= age%>");
	$('input[name=tel]').val("<%= tel%>");
	$('input[name=address]').val("<%= address%>");
	
</script>
</body>
</html>
