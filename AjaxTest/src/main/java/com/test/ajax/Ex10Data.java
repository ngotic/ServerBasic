package com.test.ajax;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.io.Reader;
import java.io.StringReader;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

@WebServlet("/ex10data.do")
public class Ex10Data extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//Ex10Data.java
		//m1(req, resp);
		//m2(req, resp);
		//m4(req, resp);
		// m5(req, resp);
	}
	

	private void m5(HttpServletRequest req, HttpServletResponse resp)   throws ServletException, IOException {
		// 
		AjaxDAO dao = new AjaxDAO();
		
		List<AddressDTO> list = dao.listAddress();
		
		JSONArray arr = new JSONArray();
		
		for(AddressDTO dto : list) {
			JSONObject obj = new JSONObject();
			obj.put("name", dto.getName());
			obj.put("age", dto.getAge());
			obj.put("address", dto.getAddress());
			arr.add(obj);
		}
		
		System.out.println(arr.toString());
		
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json");
		
		PrintWriter writer;
		// toString 그럼 toString을 json으로 정의하면 되는거 아님?
		writer = resp.getWriter();
		writer.print(arr);
		writer.close();
		
	}
	
	private void m4(HttpServletRequest req, HttpServletResponse resp)   throws ServletException, IOException {
		// DTO List<DTO>
		AjaxDAO dao = new AjaxDAO();
		ResearchDTO dto = dao.getResearch(1);
		JSONObject obj= new JSONObject();
		/*
		 obj.put("name", "홍길동");
		 obj.put("age", "20");
		 */
		obj.put("question", dto.getQuestion());
		obj.put("seq", dto.getSeq());
		
		//System.out.println(obj.toString());
		
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json");
		
		PrintWriter writer;
		System.out.println(obj); // toString 그럼 toString을 json으로 정의하면 되는거 아님?
		writer = resp.getWriter();
		writer.print(obj);
		writer.close();
		
	}
	

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		m3(req, resp);
	}

	private void m3(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("m3 호출");
		req.setCharacterEncoding("UTF-8");
		// req.getParameter("txt1"); ★ json 문자열은 이렇게는 못받아온다.
		// System.out.println(req.getParameter("txt1"));
		BufferedReader reader = new BufferedReader(new InputStreamReader(req.getInputStream()));
		String line = null;
		String temp ;
		while((temp = reader.readLine()) != null) { // 이거 while 떄문에 line이 null
			System.out.println(temp); 
			line = temp;
		}
		reader.close(); 		// 문자열 형태로 받는다.
		// {"txt1":"강아지", "txt2":"고양이", "txt3":"토끼", "txt4":"사자", "txt5":"호랑이"}
		// 그래서 이걸 자바로 파싱해주는 걸 받아보자.
		// org.json.simple.parser
		// JSON 포맷의 문자열 > 자바 오브젝트로 변환
		JSONParser parser = new JSONParser();
		try {
			
			// JSONObject > 자바 오브젝트로 바꿈 
			// String test ="{\"txt1\":\"강아지\",\"txt2\":\"고양이\",\"txt3\":\"토끼\",\"txt4\":\"사자\",\"txt5\":\"호랑이\"}";
			// System.out.println("before is line :"+line+"]");
			JSONObject obj = (JSONObject)parser.parse(line); // object로 받아서 다운캐스팅
			// open api 때 이렇게 쓴다.
			System.out.println(obj.get("txt1"));  
			System.out.println(obj.get("txt2"));
			System.out.println(obj.get("txt3"));
			System.out.println(obj.get("txt4"));
			System.out.println(obj.get("txt5"));
			
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
	}

	private void m2(HttpServletRequest req, HttpServletResponse resp) {
		// String list = req.getParameter("list"); // 이렇게 받으면 안된다. // 배열로 받았으니까 배열로 ~ 
		
		String[] list = req.getParameterValues("list");
		
		for(String item : list) {
			System.out.println(item);
		}
	}

	private void m1(HttpServletRequest req, HttpServletResponse resp) {
		/*
		 * String data = req.getParameter("data"); System.out.println(data);
		 */
		String txt1 = req.getParameter("txt1");
		String txt2 = req.getParameter("txt2");
		String txt3 = req.getParameter("txt3");
		String txt4 = req.getParameter("txt4");
		String txt5 = req.getParameter("txt5");
		
		System.out.println(txt1);
		System.out.println(txt2);
		System.out.println(txt3);
		System.out.println(txt4);
		System.out.println(txt5);
		
		
	}

}