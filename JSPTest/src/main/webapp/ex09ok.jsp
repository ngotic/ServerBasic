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
	
	String borderWidth = request.getParameter("borderwidth");
	String borderColor = request.getParameter("bordercolor");
	String borderStyle = request.getParameter("borderstyle");
	String borderRadius = request.getParameter("borderradius");
	
	if (sel1.equals("f1")){
		sel1 = "none";
	} else {
		sel1 = borderWidth+"px "+borderStyle+" "+borderColor;
	}
	
	
	String icon = request.getParameter("icon");
	System.out.println(sel1+range1+range2+icon);
%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  
<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://me2.do/5BvBFJ57">

<style>
	#main .btn {
		width : <%= width %>px !important;
		height : <%= height %>px !important;
		background-color : <%= bgColor %> !important;
		color :  <%= fontColor %> !important;
		font-size : <%= fontSize %>px !important;  
		margin:  <%= range1 %>px <%= range2 %>px !important; 
		border : <%=sel1 %> !important;
		border-radius : <%= borderRadius %>px;
		text-align:center;
		
	}
	
<%-- 	#main input.btn{
		border : <%=sel1 %> !important;
		border-radius : <%= borderRadius %>px;
	} --%>
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
			<% if (icon == "") { %>	
				<span id ="text" class="btn">버튼</span>
			<% } else  { %>	
				<span id ="text" class="btn <%=icon %>"></span>		
			<% 
				} 
			} 
			%>
		</div>
	</div>
	

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script>
	//alert($("#tx").val());
	//$("#text").addClass("glyphicon glyphicon-heart");
</script>
</body>
</html>
