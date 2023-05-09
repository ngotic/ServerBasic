<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String width = request.getParameter("width");
	String height = request.getParameter("height");
	String txt = request.getParameter("txt");
	int ea = Integer.parseInt(request.getParameter("ea"));// 버튼 개수 
	// 
	String bgColor = request.getParameter("bgColor");
	String fontColor = request.getParameter("fontColor");
	String fontSize = request.getParameter("fontSize");
	
	String range1 = request.getParameter("range1");
	String range2 = request.getParameter("range2");
	
	
	String sel1 = request.getParameter("sel1");
	String[] icons = request.getParameterValues("icon");
	System.out.println(sel1+range1+range2);
	
	if (sel1 == "f1"){
		sel1 = "none";
	} else {
		sel1 = "inline";
	}
%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://me2.do/5BvBFJ57">
<style>
	#main .btn {
		width : <%= width %>px !important;
		height : <%= height %>px !important;
		background-color : <%= bgColor %> !important;
		color :  <%= fontColor %> !important;
		font-size : <%= fontSize %>px !important;  
		margin:  <%= range1 %> <%= range2 %> !important; 
		display : <%= sel1 %> !important;
		text-align:center;
		
	}
	.panel{
		text-align:center;
	}
</style>
</head>
<body id="main">
	<!--  ex09ok.jsp -->
	<h1>결과</h1>
	<div class ="panel full">
		<div>
			<h2>버튼</h2>
		</div>
		<div style="display:inline-block">
			<% for (int i=0; i<ea; i++) { %>
			<input type="button" class="btn" value="<%=txt %>" style="font-size:14px">
			<% }  %>
		</div>
	</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script>

</script>
</body>
</html>
