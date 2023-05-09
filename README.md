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

<img src="imgs/1.png">
먼저 우리가 톰켓이라는 걸 실행시켜놓는다. 그 후에 Ex03.java 코드를 작성하고 web.xml파일 작성하고 컴파일해놓아서 메모리에 올려놓는다. 그 후 브라우저는 http//컨텍스트루트/ex03로 요청을 보내면 톰켓 서버는 web.xml을 뒤진다. 맞는 URL패턴에 클래스를 실행시켜주려고 하는 것이다. 그래서 맞는 것을 실행시켜주는 것이다. Ex03은 doGet()를 작성했다. 서블릿 컨테이너는 서블릿 인스턴스를 생성하고 doGet()을 호출시켜 doGet()에서 만드는 임시페이지를 서버 톰켓으로 전송한다. 톰켓은 HTTP response로 클라이언트쪽으로 전송하는데 이 페이지를 우리는 캐싱해놓고 캐싱해놓은 페이지를 브라우저는 우리에게 보여준다.
* 또다른 특징 : java의 스레드 사용, MVC 패턴이용 등

* 만약 다시 동일 페이지 호출시 : 재컴파일을 하지 않고 서블릿이 호출

* 소스가 바뀌면 서블릿을 재 컴파일
* 자바쪽 소스가 많다. > 이게 메인임 클라이언트쪽 소스 다루기가 빡쌔다...
