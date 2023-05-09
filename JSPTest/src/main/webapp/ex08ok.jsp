<%@page import="org.apache.catalina.tribes.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	// 보통 여기다가 넣는다. > 가운데 넣으면 헷갈리니까 그렇다. 
	// 업무 코드
	request.setCharacterEncoding("UTF-8");
	
	// request.getParameter 행동
	// 1. 컨트롤은 존재하는데 값을 입력하지 않으면 > "" 반환
	// 2. 컨트롤이 존재하지 않으면 > null 반환
	
	// 텍스트 박스 
	String txt1 = request.getParameter("txt1");
	
	// 암호 상자
	String pw1 = request.getParameter("pw1");
	
	// 다중 라인 텍스트 박스
	String txt2 = request.getParameter("txt2");
	//txt2 = txt2.replace("\r\n", "<br>"); // 엔터를 br태그로 바꾼다. > 개행문자가 포함되서 전송해서 화면에 뿌려줄거면 br태그 처리해야한다!
	
	// System.out.println(txt1 == null);   // false // 여기다가 출력 가능하다.  >> 없는 txt2로 검색하면 null 뜬다. 
	//System.out.println(txt1.equals("")); // true
		
	
	/*
		체크박스
		1. value O
			a. 체크 O > value 전송
			b. 체크 X > null 전송
		2. value에 값을 쓰면 X
			a. 체크 O > "on" 전송
			b. 체크 X > null 전송
		
	*/
	String cb1 = request.getParameter("cb1"); //
	String cb2 = request.getParameter("cb2");
	
/* 	String cb3 = request.getParameter("cb3"); 
	String cb4 = request.getParameter("cb4"); 
	String cb5 = request.getParameter("cb5"); 

	// 체크 박스를 체크하면 input태그의 value가 날라간다.
	// 채크 박스를 체크 안하면 null이 날라간다. 
	String temp = "";
	
	temp += cb3 != null ? cb3: "";
	temp += ",";
	
	temp += cb4 != null ? cb4: "";
	temp += ",";
	
	temp += cb5 != null ? cb5: ""; */
	
	/* String temp = "";
	
	for(int i=3; i<=5; i++){
		temp += request.getParameter("cb" + i) + ",";
	}
	 */
	
	 // name이 1개일 때 사용 
	 // String cb = request.getParameter("cb"); // 이걸론 못받는다.
	 
	 // name이 동일한 컨트롤이 2개이상 전송될 때 사용
	 String[] cb = request.getParameterValues("cb");
	 
	 // 라디오 버튼 > 얘는 체크된 애만 넘어간다. 
	 // String[] rb = request.getParameterValues("rb"); // 이렇게 받으면 안된다. 
	 
	 String rb = request.getParameter("rb"); //
	 
	 
	 // 셀렉트 박스
	 String sel1 = request.getParameter("sel1"); // 
	 
	 
	 String[] sel2 = request.getParameterValues("sel2"); //
	
	 
	 String id = request.getParameter("id");
	 
	 
	 String color1 = request.getParameter("color1");
	 String date1 = request.getParameter("date1");
	 String range1 = request.getParameter("range1");
	
	 String member = request.getParameter("member");
	 
	 
%>
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
	<!-- ex08ok.jsp -->
	<h1>데이터 수신 결과</h1>
	
	<table>
		<!-- 표현식에서는 아무것도 하지말자, 전처리 후처리 이런걸 최대한 하지말자 -->
		<tr>
			<th>텍스트 박스</th>
			<td><%= txt1 %></td>
		</tr>
		<tr>
			<th>암호상자</th>
			<td><%= pw1 %></td>
		</tr>
		<tr>
			<th>다중 라인 텍스트</th>
			<td><%= txt2 %></td>
		</tr>
		
		<tr>
			<th>체크 박스</th>
			<td><%= cb1 %></td>
		</tr>
		<tr>
			<th>체크 박스</th>
			<td><%= cb2 %></td>
		</tr>
		<%-- <tr>
			<th>체크 박스들</th>
			<td><%= temp %></td>
		</tr> --%>
		<tr>
			<th>체크 박스</th>
			<td><%= cb %></td>
		</tr>
		
		<tr>
			<th>체크 박스들</th>
			<td><%= Arrays.toString(cb) %></td>
		</tr>
		
		<tr>
			<th>라디오 버튼 성별</th>
			<td><%= rb %></td>	
		</tr>
		
		<tr>
			<td>셀렉트 박스</td>
			<td><%= sel1 %></td>
		</tr>
		
		<tr>
			<td>셀렉트 박스</td>
			<td><%= Arrays.toString(sel2) %></td>
		</tr>
		<tr>
			<th>히든태그</th>
			<td><%= id %></td>
		</tr>
		
		<tr>
			<th>색상</th>
			<td style="background-color: <%= color1 %>"><%= color1 %></td>
		</tr>
		
		<tr>
			<th>날짜</th>
			<td><%= date1 %></td>
		</tr>
		
		<tr>
			<th>범위</th>
			<td><%= range1 %></td>
		</tr>
		
		<tr>
			<th>회원</th>
			<td><%= member %></td>
		</tr>
	</table>
	<div>
		<input type="submit" value="보내기">
	</div>

	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script>

</script>
</body>
</html>
