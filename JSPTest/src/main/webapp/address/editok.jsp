<%@page import="com.test.my.DBUtil"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1. 데이터 가져오기
	//2. DB 작업 > update
	//3. 피드백 
	
	//1. 
	request.setCharacterEncoding("UTF-8");
	
	String name = request.getParameter("name");
	String age = request.getParameter("age");
	String tel = request.getParameter("tel");
	String address = request.getParameter("address");
	String seq = request.getParameter("seq");
	
	//2. 
	// - webapp > WEB-INF > lib
	
	Connection conn = null;
	PreparedStatement stat = null;
	
	conn = DBUtil.open();
	
	// System.out.println(conn.isClosed()); // 이게 false뜨면 됨
	
	String sql = "update tblAddress set name = ?, age= ?, tel= ?, address=? where seq = ?";
	
	stat = conn.prepareStatement(sql);
	/* System.out.println("***"+sql); */
	stat.setString(1, name);
	stat.setString(2, age);// 에러다. 타입 안맞음자바와 오라클의 관계
	stat.setString(3, tel);
	stat.setString(4, address);
	stat.setString(5, seq);
	
	int result = stat.executeUpdate();
	
	stat.close();
	conn.close();
	
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
	<!-- template.jsp > addok.jsp. -->
	<%@ include file="inc/header.jsp" %>
	<div>
		콘텐츠
		
	<%-- 	<%if (result==1) { %>
		<div>추가했습니다.<a href="list.jsp">목록보기</a></div>
		<% } else { %>
		<div>실패했습니다.</div>
		<div><a href="add.jsp">돌아가기</a></div>
		<% }  %> 
	--%>
		
	</div>

<script>
	<%if ( result==1 ) { %>
		alert('수정했습니다.');
		location.href = 'list.jsp';
	<% } else { %>
		alert('실패했스빈다.');
		//location.href ='edit.jsp';
		history.back();
	<% }  %> 
</script>
</body>
</html>
