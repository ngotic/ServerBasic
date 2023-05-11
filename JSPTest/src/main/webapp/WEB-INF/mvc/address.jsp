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

</style>
</head>
<body>
	<!-- address.jsp -->
	<h1>Address</h1>
	
<%-- 	<%
	
	%>
	
	<%=
	
	%> --%>
	
	<!-- 
	
		JSP 페이지에서 자바 구문을 사용하지 말자!!
		- 지저분함;;
		
		EL, Expression Language
		- 표현식 언어
		- 자바의 값을 HTML 문서에 출력하는 역할
										EL은 이 4개의 컨텍스트면 다 가능
		- 내장 객체(pageContext, request, session, application)안에 있는 데이터를 출력하는 언어
		- 일반 데이터는 출력 불가능;;
		
	 -->
	 
	 <div>
	 	<div>주소록 총 인원수 : <%= request.getAttribute("count") %></div>
	 	<div>주소록 총 인원수 > EL버전 : ${ request.getAttribute("count") } : 이건 안댐</div>
	 	<div>주소록 총 인원수 > EL버전 : ${ count } : 이건가능 key값을 찾아서 값으로 변환</div>
	 	<div>주소록 총 인원수 > EL버전 : ${ count * 2 }</div>
	 </div>
	 
	 <hr>
	 
	 <!-- 리터럴 표현 -->
	 <div>${100}</div>
	 <div>${3.14}</div>
	 <div>${"홍길동"}</div>
	 <div>${'홍길동'}</div>
	 <div>${true} : </div>
	 <div>${null} :  null은 공백</div>
	 <hr>
	 
	 <!-- 배열 -->
	 <div>${nums}</div>
	 <div>${nums[0]}</div>
	 
	 <hr>
	 
	 <!--List  -->
	 <div>${nums2}</div>
	 <div>${nums2.get(0)}</div>
	 <div>${nums2[0]}</div>
	 
	 <hr>
	 <!-- Map index 지원한다. -->
	 <div>${nums3}</div>
	 <div>${nums3.get("kor")}</div>
	 <div>${nums3["kor"]}</div>
	 <div>${nums3.kor}</div>
	 
	 <hr>
	 
	 <!-- Object -->
	 <div>${vo}</div>
	 <div>${vo.getName()}</div>
	 <div>${vo["name"]}</div>
	 <div>${vo.name}</div>
	 
	 
	 <!-- 연산자 -->
	 <div>a: ${a} </div>
	 <div>b: ${b} </div>
	 									<!-- 너무 길다 귀찮다. -->
	 <div> a + b: <%= (int)request.getAttribute("a")+(int)request.getAttribute("b") %></div>
	 
	 <div>a + b = ${a} + ${b}</div>
	 
	 <div>a + b = ${a + b}</div>
	 <div>a + b = ${a - b}</div>
	 <div>a + b = ${a * b}</div>
	 <div>a + b = ${a / b}</div>
	 <div>a + b = ${a div b}</div>
	 <div>a + b = ${a % b}</div>
	 <div>a + b = ${a mod b}</div>
	 
	 <div>${a > b}</div>
	 <div>${a gt b}</div>
	 <div>${a >= b}</div>
	 <div>${a ge b}</div>
	 <div>${a < b}</div>
	 <div>${a lt b}</div>
	 <div>${a <= b}</div>
	 <div>${a le b}</div>
	 <div>${a == b}</div>
	 <div>${a eq b}</div>
	 <div>${a != b}</div>
	 <div>${a ne b}</div>
	 
	 <hr>
	 
	 <div>${a > 10 && b <5 }</div>
	 <div>${a > 10 and b <5 }</div>
	 <div>${a > 10 || b <5 }</div>
	 <div>${a > 10 or b <5 }</div>
	 <div>${!( a > 10 ) }</div>
	 <div>${not( a > 10 ) }</div>
	 
	 <hr>
	 
	 <div>${ a > 0 ? "양수":"음수"}</div>
	 <hr>
	 
	 <%
	 // 생명주기가 작은애부터 찾는다. 그래서 
	 // pageContext > request > session > application
	 	pageContext.setAttribute("age", 21);
	 	request.setAttribute("age", 32);
	 	session.setAttribute("age", 33);
	 	application.setAttribute("age", 34);
	 %>
	 <div>나이: ${age}</div> 
	 <!-- 이건 어디서 뒤질까?  -->
<%-- 	 <div>나이: <%= pageContext.getAttribute("age") %></div>
	 <div>나이: <%= request.getAttribute("age") %></div> --%>
	 
	 <div>나이: ${age}</div>
	 
	 <div>나이: ${pageScope.age}</div>
	 <div>나이: ${requestScope.age}</div>
	 <div>나이: ${sessionScope.age}</div>
	 <div>나이: ${applicationScope.age}</div>
	 
	 
	 <hr>
	 
	 <!-- 
	 	JSTL. JSP Standard Tag Library 
	 	- 자바 서버페이지 표준 태그 라이브러리
	 	- 프로그래밍 기능이 있는 태그 모음 
	 	
	 	아래것이 찍히면 우리는 jstl이 잘 설치한것
	  -->
	 
	 <!--  값을 출력하는 명령 -->
	 <c:out value="안녕하세요"></c:out>
	 
	 <c:out value="${count}"></c:out>
	 
	 
	 <c:out value="${count2}">값이 없음</c:out>
	 
	 
	 <hr>
	 
	 <!--  
	 변수 생성 
	 default로 pageContext 내장 변수가 바로 c:set으로 생성된 변수다.
	 근데 scope를 따로줘서 이게 어디에 보관될지 결정할 수 있다.
	 대부분은 pageContext에 넣어서 쓴다. scope를 바꾸는 일은 거의 없다
	  -->
	 <c:set var="n1" value="100" scope="page"></c:set>
	 <%-- <c:set var="n1" value="100" scope="request"></c:set>
	 <c:set var="n1" value="100" scope="session"></c:set>
	 <c:set var="n1" value="100" scope="application"></c:set> --%>
	 
	 <%-- ${n1} --%>
	 <hr>
	 
	 이렇게 찍으면 어디들어 있는지 알 수 있다. 
	 <%-- <div>${pageScope.n1}</div> --%>
	 <div>${requestScope.n1}</div>
	 <div>${sessionScope.n1}</div>
	 <div>${applicationScope.n1}</div>
	 <!-- 아래 3군데에는 없다. -->
	 
	 
	 <!-- 변수 수정 -->
	 <c:set var="age" value="11"></c:set>
	 <c:set var="age" value="22"></c:set>
	 <div>${age}</div>
	 
	 <br>
	 <br>
	 <br>
	 <br>
	 <br>
	 <br>
	 
	<!-- 변수 삭제 set으로 만든 것은 remove로 처리가 가능하다. -->
	<c:remove var="age"/>
	
	<div>age : ${empty age}</div>
	
	<hr>
	<!-- 원래 끝태그 쓰는건 꼭임 html 몇개 태그만 예외다. -->
	<c:set var="num" value="10"/>
	
	<!-- 조건문(if) -->
	<c:if test="${num > 0}">
		<div>${num}은 양수입니다.</div>	
	</c:if>
	
	<c:if test="${num <= 0}">
		<div>${num}은 양수가 아닙니다.</div>	
	</c:if>
	
	<!-- 조건문(choose - when) -->
	<c:choose>
		<c:when test="${num > 0}">양수</c:when>
		<c:when test="${num < 0}">음수</c:when>
		<c:when test="${num == 0}">영</c:when>
		<c:otherwise>기본값</c:otherwise>
	</c:choose>
	
	<hr>
	
	<!-- 반복문(for문, 향상된 for문) -->
	
	<!-- for ( String name: names ) -->
	
	<c:forEach var="name" items="${names}" >
		<div>${name}</div>	
	</c:forEach>
	
	<hr>
	
	<c:forEach var="i" begin="1" end="5" step="1">
		<div>${i}</div>
	</c:forEach>
	
	<hr>
				<!-- 인덱스가 1부터 시작이다.  -->
				<!--  중간 인덱싱이 가능하다. -->
	<c:forEach items="${names}" var="name" begin="2" end="4">
		<div>${name}</div>
	</c:forEach>
	
	<c:forEach items="${names}" var="name" varStatus="status" >
		<div>${status.count}. arr[${status.index}] = ${name}, status.first = ${status.first}, status.last = ${status.last}</div>
	</c:forEach>
	
	<c:forEach items="${colors}" var="name">
		<div>${name}</div>
	</c:forEach>
	
								<!--  짜른다. , delims로  -->
	<c:forTokens items="${colors}" delims=":" var="name">
		<div>${name}</div>
	</c:forTokens>
	
	<hr>
	<!-- URL은 한글 사용 못한다. 가끔씪 있는거 보면 한글이 들어가있는데 진짜 들어간게 아니라
	base64로 내부적으로 인코딩한거다. 실제로 들어가있을 떈 인코딩한거다. 
	이게 서버로 보내지면 자동으로 디코딩해서 글자를 복구한다. -->
	<c:url var="link" value="http://localhost:8090/view.do">
		<c:param name="name" value="hong">Hello</c:param>
		<c:param name="age"  value="20">Hello</c:param>
		<c:param name="address" value="서울시강남구">Hello</c:param> 
	</c:url>
	
	<!-- 위에 쿼리스트링으로 만들어진 링크를 아래로 붙일 수 있다. -->
	
	<a href="${link}">링크</a>
	
	<hr>
	<!-- response.SendRedirect(URL)로 변환 -->
	<%-- <c:redirect url="https://naver.com"></c:redirect> --%>
	
	<div>내 생일 <fmt:formatDate value="${birthday}" pattern="yyyy-MM-dd E a HH:mm:ss"/></div>
	
	<hr>
	
	<c:set var="price" value="10000" />
	
	<div>가격: ${price}원</div>
	<div>가격: <fmt:formatNumber value="${price}" />원</div>
					<!-- fmt에 옵션이 여러가지 있다.  > 다른 옵션은 알아봐도 된다. -->
	
	
	<hr>
	
	<table>
		<tr>
			<th>번호</th>
			<th>이름</th>
			<th>나이</th>
			<th>전화</th>
			<th>주소</th>
		</tr>
		
		<c:forEach items="${list}" var="vo">
			<tr>
				<td>${vo.getSeq()}</td>
				<td>${vo["name"]}</td>
				<td>${vo.age}</td>
				<td>${vo.tel}</td>
				<td>${vo.address}</td>
			</tr>
		</c:forEach>
		
	</table>
	
	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script>

</script>
</body>
</html>

