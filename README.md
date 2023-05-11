# ServerBasic
## 복습용 README.md
> 리드미 한 페이지로 수업내용요약 및 복습, 정리 + 개인적인 공부로 추가적인 내용도 붙을 수 있음

## 1. 서블렛(Servlet)
- 웹서버측에서 자바를 사용한 프로그램을 동작시키는 기술(환경)이다. 
- 목적) 클라이언트의 요청에 따른 동적 웹페이지 생성을 위함
- HTML, CSS, JavaScript로 만든 정적페이지와는 다르게 동적 페이지는 요청이 들어올 때마다 적합한 페이지를 그 즉시 만들어 준다. 

> 정적 페이지는 공산품 캔커피, 동적 페이지는 알바생이 만들어주는 것


## 2. Servlet Class(서블릿 클래스)
- 자바클래스다.
- 서블릿이 알바생이다. 
- 정의된 틀이 있고 이것대로 우리가 구현하면 된다. 
1. 서블릿 클래스 선언 
   * javax.servlet.Servlet 인터페이스를 구현(복잡)
   * javax.servlet.http.HttpServlet 클래스를 상속(이 방법이 무난하다.)
   * > HttpServlet가 Servlet인터페이스로 구현

   * 작성법 > 기본적으로 service코드를 작성해야 한다. doGet, doPost
   * 매개변수 2개 
     * 1. java.servlet.http.HttpServletRequest
     * 2. java.servlet.http.HttpServletResponse
   * 예외미루기
     * 1. java.io.IOException    // 페이지를 동적으로 생성 > 외부 입출력 
     * 2. javax.servlet.ServletException; // 서블릿 작업 때문에
  
## 3. 서블릿작성 
``` java
public class Ex02 extends HttpServlet {
    public void doGet(HttpServletRequest request,
                HttpServletResponse response) throws IOException, ServletException{
                    
                    response.setCharacterEncoding("UTF-8"); // 브라우저에 보이는 인코딩 설정
			        PrintWriter writer = response.getWriter();

                    writer.println("<html>");
                    ...
                    writer.println("</html>");

                    writer.close();
                }
}

```

## 4. 서블릿 작성 예시 + 추가
- 서블릿은 아래의 메서드를 오버라이드하여 작성할 수 있다.
- doGet은 Get요청만, doPost는 Post요청만 가능하다.
- init은 서블릿이 처음 요청될 때 초기화를 하는 메서드
- service는 서블릿 컨테이너가 요청을 받고 응답을 내려줄 때 필요한 서블릿의 service메서드 > doGet, doPost이런거다.
- destory는 더 이상 사용되지 않는 서블릿 클래스는 주기적으로 서블릿 컨테이너가 destory 메서드를 호출해서 제거 
```java
public class myServlet extends HttpServlet {

    @Override
    public void init(ServletConfig config) throws ServletException {
        System.out.println("init method 호출!");
    }
    
    @Override
    public void destroy() {
        System.out.println("destroy method 호출!");
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException
    {
        System.out.println("doGet service method 호출!");		
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException
    {
        System.out.println("doPost service method 호출!");		
    }
	
}
```

## 5. web.xml
```xml
다음과 같이 web.xml 파일에 > 자바 파일(서블릿, 알바생)을 호출할 수 있는 가상주소를 맵핑한다.
    <servlet> //서블릿 클래스를 서블릿으로 등록
           <servlet-name>ex03</servlet-name> //해당 서블릿을 참조할 때 사용할 이름
           <servlet-class>com.test.servlet.Ex03</servlet-class> //서블릿으로 사용할 서블릿 클래스의 FullName
     </servlet>
     <!--
         위 서블릿을 등록, url 패턴을 지정해준다.
         동작되는 url은 contextRoot 밑으로 동작된다. 
      -->
     <servlet-mapping>
           <servlet-name>ex03</servlet-name> //매핑할 서블릿의 이름
           <url-pattern>/ex03</url-pattern> //매핑할 URL 패턴
     </servlet-mapping>
```

## 6. 서블릿 동작흐름 

<img src="https://github.com/ngotic/ServerBasic/blob/main/imgs/1.PNG?raw=true">

먼저 우리가 톰켓이라는 걸 실행시켜놓는다. 그 후에 Ex03.java 코드를 작성하고 web.xml파일 작성하고 컴파일해놓아서 메모리에 올려놓는다. 그 후 브라우저는 http//컨텍스트루트/ex03로 요청을 보내면 톰켓 서버는 web.xml을 뒤진다. 맞는 URL패턴에 클래스를 실행시켜주려고 하는 것이다. 그래서 맞는 것을 실행시켜주는 것이다. Ex03은 doGet()를 작성했다. 서블릿 컨테이너는 서블릿 인스턴스를 생성하고 doGet()을 호출시켜 doGet()에서 만드는 임시페이지를 서버 톰켓으로 전송한다. 톰켓은 HTTP response로 클라이언트쪽으로 전송하는데 이 페이지를 우리는 캐싱해놓고 캐싱해놓은 페이지를 브라우저는 우리에게 보여준다.
* 또다른 특징 : java의 스레드 사용, MVC 패턴이용 등

* 만약 다시 동일 페이지 호출시 : 재컴파일을 하지 않고 서블릿이 호출

* 소스가 바뀌면 서블릿을 재 컴파일
* 자바쪽 소스가 많다. > 이게 메인임 클라이언트쪽 소스 다루기가 빡쌔다...

## 7 . JSP. Java Server Page
- 자바를 사용해서 서버측에서 페이지를 만드는 기술, Servlet의 다음 버전
- Servlet vs JSP
  - Servlet은 자바코드에서 시작, 자바 베이스 코드 작성 관리가 용이한데 Html 코드를 문자열 취급해서 넣어줘서 클라이언트 코드쪽 작성이 불편하다. 그리고 web.xml에 가상주소 매핑이 필요하다. 
  - JSP는 HTML 코드쪽에서 시작한다. 클라이언트 코드 작성이 쉽다. web.xml 가상주소 매핑이 필요없다. webapp에 .jsp파일을 작성하고 URL을 그쪽으로 쏴주면 된다. 
  - 코드 작성 영역상의 차이가 조금 있고 기술적인 개념은 비슷한점이 많다. 
- JSP + Servlet을 섞어서 쓸 수 있다.
  - 서블릿 : 자바 코드 담당
  - JSP : 클라이언트 코드 담당
  - 너무 한쪽만 쓰면 코드관리도 어렵고 유지 보수가 어려우니 둘이 떼어놔서 각각 좀더 편한쪽에서 쓰는 것이라 생각함

## 8. JSP 구성요소 
- JSP 지시자, JSP Directive
  - page 지시자, include 지시자, taglib 지시자
- 스크립트 요소, Scripting Elements
  - 스크립틀릿 <%     %>  Scriptlet > : 맨위쪽에 쓰는 경우는 자바프로세싱 관련 코드를 구현할 때고 태그 사이에 중간 중간 for문을 돌리기 위해 넣기도 한다. 
  - 익스프래션 <%= 값 %>  Expression 해당 위치에서 값을 출력하는 용도이다. 
- 선언부 : 스크립틀릿이나 익스프래션은 잘쓰는데 이건 잘 안쓴다. 
  - <%! %> :꺽쇠느낌표이다. 스크립틀릿 안에서는 메서드가 안만들어진다. 그리고 스크립틀릿 안에선 지역변수가 만들어짐, 변수 셋팅은 가능한데...
  - 근데 선언부 쪽은 메서드가 만들어진다. 근데 이게 현재 페이지에서만 유효함 
  - 선언부는 전역변수 선언이나, 메서드 정의 목적으로 사용하나 어차피 메서드는 라이브러리 가져다 쓰니까 import 쓸거고 해서 크게 필요성이 떨어진다.
  - 스크립틀릿에서 만들어진 변수는 지역변수인데 이것은 요청에 따른 _jspService()와 생명주기를 같이하고 선언부의 전역변수는 객체 생성, 소멸과 생명주기를 같이한다. ex) 두 변수를 증감연산으로 새로고침했을 때 전역변수는 계속 증가될거고 지역변수는 요청단위라 그대로다.

## 9. JSP 내장 객체 > JSP Implicit Object
- 개발자가 직접 생성하는 객체가 아니라, JSP(톰켓)이 미리 만들어서 제공하는 객체이다.
- JSP>변환>java파일>컴파일>class파일>서블릿객체가 페이지생성>톰켓이 받아서 브라우저쪽으로 전달
- Run on server하는 순간 jsp가 변환된 java파일은 class파일과 함께 .metadata>plugins>org.ecplise.wst.server.core>tmp0>work>Catalina>localhost>jsp>org>apache>jsp 이쪽에 들어온다. > 이쪽 java파일에서 정의된 것이 기본객체다.!


- 기본 객체 종류 request, response, session, pageContext,out, application, config, page, exception 등.. 
  
- pageContect, request, session, application 
  - 데이터 저장하는 목적으로 사용한다. map같은 느낌으로 쓴다. 
  - 내장객체.setAttribute(key, value);
  - 내장객체.setAttribute(key);
  
1. request > 클라이언트쪽에서 url로 뭔가 보냄
   * 전송된 데이터를 가져올 때 사용, ( get이나 post로 전송되는 데이터 꺼낼 때 )
   * A페이지에서 B페이지로 데이터가 옴 그러면 해당 B페이지에 request 객체에서는 getParameter로 데이터를 꺼내볼 수 있다.
   * 근데 이게 데이터 인코딩을 셋팅을 안하면 데이터가 깨져나올 수 있으니 받는 페이지에서 getParameter 하기전에 인코딩을 잘 설정하자.
   * 전송된 데이터 인코딩 request.setCharacterEncoding("UTF-8");
   * 요청 관련 정보도 얻어올 수 있다. 요청한 사람의 ip나 method나, 프로토콜이나 기타 등등 요청헤더정보 꺼내보는 메서드가 있음
   * request.getContextPath() 등~ 
  ``` java
  	<% Enumeration<String> e= request.getHeaderNames();
			while(e.hasMoreElements()){
				String name = e.nextElement(); //nextElement()로 다음거 꺼낸다.
		%>
		<tr>
			<td><%= name %></td>
			<td><%= request.getHeader(name)%></td>
		</tr>
		<%
			}
		%>
  ```
2. response > 서버>(행동)>클라이언트
   * response는 서블릿에서 브라우저로 보여줄 페이지를 만드는과정에서 getWriter()호출하고 호출하는 페이지의 인코딩 셋팅을 했었다. 
   * jsp단에서는 response.sendRedirect("ex11_response_two.jsp"); 이렇게 자바코드에서 리다이렉트 코드를 작성할 수 있다. 
   * 그리고 돌려줄 내용의 MIME을 지정한다. 이건 파일 업로드 과정에서 다룬다.
3. pageContext
   * 페이지 실행(요청~응답) 중에 관련된 데이터를 저장하는 객체인데
   * 페이지내에서만 유요한 객체임 그래서 pageContext
   * pageContext.forward()라는 메서드를 forward하기 위해 쓴다. 

4. out
   * out이라는 객체는 출력용도이다. 서블릿에서 response의 PrintWriter와 비슷한 역할이다. jspWriter로 만든 것임. 스크립틀릿 중간중간에 넣어쓸래? 아니면 한방에 쓸래?의 차이이다. 딱히 필요성은 못느끼겠음 아직까진??

``` java
    <h1>구구단</h1>
	<%
		int dan = 5;
	%>
	
	<h2>out 사용 안함 </h2>
	<% for ( int i=1 ; i<=9 ; i++) { %>
	
	<div><%= dan %>  x <%= i %> = <%= dan * i %></div>
	
	<% } %>
	
	<h2>out 사용함 > 우리에게 선택권을 주는 것이다. </h2>
	<% for ( int i=1; i <=9 ; i++ ) { 
		out.println(String.format("<div> %d x %d = %d </div>",
				dan,
				i,
				dan*i)); 
                // 서블릿이 하던 방식이다. 출력용도인데 기본객체니까 import 필요 없네 
	}
	%>
```
5. session(개별)
   * 전역변수 > 접속 종료전까지 계속 유지, 한번 만들어놓으면 사이트 전체에서 이용가능
   * session.getId() : 세션 식별자
   * session.isNew() : 세션이 방금 만들어졌나?
   * long tick = session.getCreationTime(); : 세션 생성시간 tick값이라 Date 객체로 시간 따로 처리해야함
   * session.setAttribute("d", 40);      : session에 "d"라는 key로 40저장
   * session.getAttribute("d")           : "d"라는 key로 값 꺼냄
   * session.setMaxInactiveInterval(30); : 만료시간 셋팅 > 사이트에 따라 만료시간 설정은 다를 수 있다. 
   * session.invalidate();               : 세션을 초기화. 로그아웃할 때 쓴다고 함, 그럼 removeAttribute는?
   * session.removeAttribute("data");    : 해당 키의 어떤 세션값을 지운다.
   * > 서버에서 만들어진다.  이거 인증이런데에다가 유저 id 넣고 하는데 쓰긴한다. 근데 유저가 한 두명이 아니다. 유저 10000명 세션 자체도 한정된 공간이고 메모리? 꽉차면 서버 다운될 수 도 있음 > 조심해서 써야함 > 서버가 클라이언트마다 개별적으로 부여
6. application(공용) > 얘도 데이터를 저장하진 않음 설정파일, 기타 db설정등 저장하는 용도로 쓴다. 
   * 세션과 성질은 비슷한데 큰 차이가 있음 여기는 공용 공간임 A유저, B유저가 같은 application에 저장된 데이터를 볼 수 있다.
   * 얘도 만료기간이 있다. 서버에 사용자가 들어올 때마다 만료기간 초기화 가능한데 가끔 사람이 몇시간 동안 안오면 이값이 사라지는 것.


> 쿠키는 Java Servlet단에서든, Javascript단에서든 조작이 가능함
7. Cookie(쿠키)
   * 개인 정보를 저장하는 저장소
   * 브라우저가 관리하는 저장소이다.
   * 서버 부담이 없다. 
   * 서블릿, 자바 단에서든, javascript 클라이언트 단에서든 쿠키를 조작할 수 있다.
   * 1. 쿠키 종류 
     * 메모리쿠키(session cookie)
       * 메모리에 저장되고, 디스크엔 저장이 안됨
       * 브라우저가 실행중에만 저장
       * 브라우저가 종료되면 쿠키도 삭제
       * 은행 사이트 같은 경우엔 아이디를 기억하면 안됨 
       * Expires/ Max-Age부분이 Session이면 Session쿠키
     * 하드쿠키(persistent cookie)
       * 브라우저가 종료되도 유지
       * 하드디스크에 저장
       * Expires/ Max-Age부분이 특정한 기간이 기록
       * w3school cookie 예제 > javascript로 쿠키 저장
```js 
function setCookie(cname, cvalue, exdays) {
  const d = new Date();
  d.setTime(d.getTime() + (exdays * 24 * 60 * 60 * 1000));
  let expires = "expires="+d.toUTCString();
  document.cookie = cname + "=" + cvalue + ";" + expires + ";path=/";
} // cookie는 key value로 내용을 저장하는 것 

function getCookie(cname) {
  let name = cname + "=";
  let ca = document.cookie.split(';');
  for(let i = 0; i < ca.length; i++) { 
    let c = ca[i];
    while (c.charAt(0) == ' ') { // trim 하고 value 리턴
      c = c.substring(1);
    }
    if (c.indexOf(name) == 0) {
      return c.substring(name.length, c.length);
    }
  }
  return "";
}
```
   * 2. 쿠키의 삭제 (위의 javascript 코드 기준)
 ``` js
 // 이 방식으로 쿠키를 삭제하는 법은 따로 없다.
setCookie('id', null, -1); 로 value를 null 넣고 시간 -1로 셋팅해야 한다.
 ```
   * 3. 자바코드에서 쿠키를 생성하기 
``` java
// 자바 코드에선 
Cookie cookie = new Cookie("color", "blue");
response.addCookie(cookie);            // 이렇게 쿠키를 저장한다. > response에서 저장

Cookie[] list = request.getCookies();  // 쿠키를 확인하려면 > request 객체에서 확인

for(Cookie c : list){ // 객체를 기반으로 한 쿠키도 역시 key, value였다.
		System.out.println(c.getName() +","+ c.getValue());
}
```
https://m.blog.naver.com/pjok1122/221726178384 : 여기 사이트 좋은 정보 많음

> DB 작업 시
> * 1번 방식
>   * PreparedStatement stat = null;
>   * ? 넣어서 sql 작성 , conn.prepareStatement(sql);
>   * stat.executeUpdate();
>   * int result = stat.executeUpdate();
> * 2번 방식
>   * Statement stat = null;
>   * ?없는 Sql작성 사이사이 str 넣음;
>   * stat = conn.createStatement()
>   * rs = stat.executeQuery(sql);

## 주소록 CRUD
1. 업무 > 생략 
2. DB작업 > ERD(X) > 테이블 생성
3. 클라이언트 작업 > 레이아웃 + 페이지 구현 > HTML, CSS, Javascript 
	* webapp > "address" 폴더 생성
  	* > "list.jsp"    목록보기 
    	* DB에서 정보를 가져와서 목록 보여준다. Connection, Statement(), ResultSet, select seq 기준 내림차순 쿼리
    	* while(rs.next()) 반복문, rs.getString("key") 해서 중간에 html 태그 안에 넣는다.
    	* 수정, 삭제에 대한 처리를 위해서 수정, 삭제 링크 url에 쿼리스트링으로 seq를 붙여논다. 
  	* > "add.jsp"     추가하기(폼)
    	* 더미값으로 추가할 정보 input에 채움 (function() {})(); 이건 즉시호출
    	* form, input태그, addok.jsp쪽으로 action, body에 내용 채워져서 addok.jsp로 내용물 간다.
  	* > "addok.jsp"   추가하기(처리) 
    	* request.getParameter()하기 전에는 request.setCharacterEncoding("UTF-8"); 설정
    	* request.getParameter()로 꺼낸 정보를 insert sql, executeUpdate
  	* > "edit.jsp"    수정하기(폼)
    	* 이전 페이지에서 쿼리스트링으로 받은 seq를 가지고 DB에서 정보 조회
    	* 입력 폼 내용을 채워서 editok.jsp로 POST로 전송
  	* > "editok.jsp"  수정하기(처리)
    	* update 쿼리, setString은 내가 정의해주는 데이터의 타입이지 DB에서 정의한 타입은 아니다.
    	* 쿼리 result에 따라서 alert 띄우고 location.href로 redirect 
  	* > "del.jsp"     삭제하기(폼)
    	* edit과 비슷 
  	* > "delok.jsp"   삭제하기(처리)
    	* edit과 비슷
  	* > "template.jsp" 임시페이지
					
	* webapp  > address > "inc" 폴더 생성
		* > "header.jsp"
		* > "asset.jsp"
					
 	* webapp > address > "asset" 폴더 생성
 		* > "main.css"


## 웹 보안 > 로그인, 로그아웃
* 인증, Authentication
  * 현재 접속자가 해당 사이트의 구성원인지 확인
  * 회원?이면 로그인해라

* 허가, Authorization
  * 권한을 가지고 있는지 확인한다. 
