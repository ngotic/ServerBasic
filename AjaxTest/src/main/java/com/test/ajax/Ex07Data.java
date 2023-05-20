package com.test.ajax;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ex07data.do")
public class Ex07Data extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//Ex07Data.java
		String type= req.getParameter("type");
		
		if(type.equals("1")) {        // text로 보낼 때
			m1(req, resp);  
		} else if(type.equals("2")) { // ,로 구분하는 csv 형식으로 보내는 경우 
			m2(req, resp);
		} else if(type.equals("3")) { // 
			m3(req, resp);
		} else if(type.equals("4")) {
			m4(req, resp);
		} else if(type.equals("5")) {
			m5(req, resp);
		} else if (type.equals("6")) {
			m6(req, resp);
		}

	}
	
	private void m6(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		AjaxDAO dao = new AjaxDAO();
		List<AddressDTO> list = dao.listAddress();
		/*
		 [
		 	{
		 		"seq" : "1",
		 		"name":"이름",
		 		"age":20,
		 		"tel":"010",
		 		"address":"주소"
		 	},
		 	{
		 		"seq" : "1",
		 		"name":"이름",
		 		"age":20,
		 		"tel":"010",
		 		"address":"주소"
		 	}
		 ]
		 */
		resp.setContentType("application/json");
		resp.setCharacterEncoding("UTF-8");
		
		PrintWriter writer = resp.getWriter();
		
		
		// 문자열로 전송 문자열 포맷으로 만들어야 한다. 
		String temp="";
		temp+="[";
		
		for(AddressDTO dto : list) {
			temp += "{";
			temp +=String.format("\"seq\" : \"%s\",", dto.getSeq());
			temp +=String.format("\"name\":\"%s\",", dto.getName());
			temp +=String.format("\"age\":%s,", dto.getAge());
			temp +=String.format("\"tel\":\"%s\",", dto.getTel());
			temp +=String.format("\"address\":\"%s\"", dto.getAddress());
			temp +="}";
			temp +=",";// 환경에 따라서 에러가 나는 경우가 있고 안나는 경우가 있다. 
		}
		temp = temp.substring(0, temp.length()-1);
		temp+="]";
		
		writer.print(temp);
		writer.close();
		
	}

	private void m5(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{

			AjaxDAO dao = new AjaxDAO();
			ResearchDTO dto = dao.getResearch(1);
			
			/*
			 * 
			 * JSON
			 * - 키와 값을 쌍따옴표로 표기한다. 
			 * - 메소드는 표시 불가
				 {
				 	"키" : "값",
				 	"키" : "값"
				 }
				 [
				 	[10, 20 , 30]
				 	{
					 	"키" : "값",
					 	"키" : "값"
				 	},
				 	{
					 	"키" : "값",
					 	"키" : "값"
				 	}
				 ]
				 {
				 	"question": "질문"
				 }
 
			 * */
			
			resp.setContentType("application/json");
			resp.setCharacterEncoding("UTF-8");
			PrintWriter writer = resp.getWriter();
			writer.print("{");
			writer.printf("\"question\": \"%s\"", dto.getQuestion());
			writer.print("}");
			
	}

	private void m4(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{

		AjaxDAO dao = new AjaxDAO();
		List<AddressDTO> list = dao.listAddress();
		
		/*
		 <?xml version='1.0' encoding='UTF-8'?>
		 <list>
		 	<item>
		 		<seq>1</seq>
		 		<name>홍길동</name>
		 		<age>20</age>
		 		<tel>010</tel>
		 		<address>서울시</address>
		 	</item>
		 	<item>
		 		<seq>1</seq>
		 		<name>홍길동</name>
		 		<age>20</age>
		 		<tel>010</tel>
		 		<address>서울시</address>
		 	</item>
		 	<item>
		 		<seq>1</seq>
		 		<name>홍길동</name>
		 		<age>20</age>
		 		<tel>010</tel>
		 		<address>서울시</address>
		 	</item>
		 </list>
		 */
		
		resp.setContentType("text/xml");
		resp.setCharacterEncoding("UTF-8");
		
		PrintWriter writer = resp.getWriter();
		
		writer.print("<?xml version='1.0' encoding='UTF-8' ?>");
		
		writer.print("<list>");
		for(AddressDTO dto : list) {
			writer.print("<item>");
				writer.printf("<seq>%s</seq>",dto.getSeq());
				writer.printf("<name>%s</name>",dto.getName());
				writer.printf("<age>%s</age>",dto.getAge());
				writer.printf("<tel>%s</tel>",dto.getTel());
				writer.printf("<address>%s</address>",dto.getAddress());
			writer.print("</item>");
		}
		writer.print("</list>");
		
		writer.close();
	}

	private void m1(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		AjaxDAO dao = new AjaxDAO();
		int count = dao.count();
		// 서버가 브라우저에게 건내는 데이터 이런 형식이다 ~ 알려준다,
		resp.setContentType("text/plain"); // 텍스트 형식
		resp.setCharacterEncoding("UTF-8");
		PrintWriter writer = resp.getWriter();
		writer.print(count+"");
		writer.close();
		
	}
	

	private void m2(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		AjaxDAO dao = new AjaxDAO();
		
		List<AddressDTO> list = dao.listAddress();  
		
		// CSV
		String temp = "";
		
		for (AddressDTO dto : list) {
			temp += String.format("%s,%s,%s,%s,%s\r\n",
					dto.getSeq(),
					dto.getName(),
					dto.getAge(),
					dto.getTel(),
					dto.getAddress());
		}
		
		resp.setContentType("text/plain");
		resp.setCharacterEncoding("UTF-8");
		
		PrintWriter writer = resp.getWriter();
		
		writer.print(temp);
		
		writer.close();
	}

	private void m3(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		
		AjaxDAO dao = new AjaxDAO();
		ResearchDTO dto = dao.getResearch(1);
		
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("text/xml"); // 요게 브라우저에게 영향을 준다. 
		
		PrintWriter writer = resp.getWriter();
		
		writer.print("<?xml version='1.0' encoding='UTF-8' ?>");
		writer.printf("<question id='q1'>%s</question>", dto.getQuestion());
		writer.close();
	}

	

}