package com.test.mvc;

import java.io.IOException;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



// 이렇게 하면 web.xml에다가 등록을 안해도 된다. 
//> web.xml은 모든 주소를 한 곳에서 관리하는게 장점이다. > 근데 쓰기 불편
//@WebServlet("/address.do") 
//public class Address extends HttpServlet{
//
//	@Override
//	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		
//		RequestDispatcher dispatcher 
//		= req.getRequestDispatcher("/WEB-INF/mvc/hello.jsp");
//		
//	}
//
//}


@WebServlet("/address.do")
public class Address extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//Address.java
		
		// DB 작업 > select > 주소록 몇명?
		// DB 작업 담당자 > AddressDAO>java
		
		AddressDAO dao = new AddressDAO();
		int count = dao.getCount();
		
		int[] nums = { 10, 20, 30, 40, 50 };
		
		List<Integer> nums2 = new ArrayList<Integer>();
		nums2.add(100);
		nums2.add(200);
		nums2.add(300);
		
		
		Map<String, Integer> nums3 = new HashMap<String, Integer>();
		nums3.put("kor", 100);
		nums3.put("eng", 90);
		nums3.put("math", 80);
		
		
		AddressVO vo = new AddressVO();
		vo.setSeq("1");
		vo.setName("홍길동");
		vo.setAge("20");
		vo.setTel("010-1234-5678");
		vo.setAddress("서울시 강남구 역상동");
		
		
		String[] names = {"홍길동","아무개", "하하하", "호호호", "후후후"};
		
		Calendar birthday = Calendar.getInstance();
		birthday.set(1995, 2, 10);
		// Calendar > Date
		Date date = birthday.getTime();
		
		// ResultSet rs = dao.list(); 
		// 이렇게 리턴을 한다?
		// 디비 담당자가 아닌 다른 사람도 DB코드를 알아야함 > 이럼 안된다.
		
		ArrayList<AddressVO> list = dao.list(); // 이렇게 관계를 맺을 꺼다.
		
		req.setAttribute("count", count);
		req.setAttribute("nums", nums);
		req.setAttribute("nums2", nums2);
		req.setAttribute("nums3", nums3);
		req.setAttribute("vo", vo);
		
		req.setAttribute("a", 10);
		req.setAttribute("b", 3);
		
		req.setAttribute("names", names);
		req.setAttribute("list", list);
		
		//CSV                      > 한줄짜리 문자열 넘겨준다.
		req.setAttribute("colors", "빨강,노랑,파랑:검정,초록"); // CSV로 넘겨서 쪼갤 수 있다. 
		req.setAttribute("birthday", date);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/mvc/address.jsp");
		dispatcher.forward(req, resp);
		
	}

}

// MSA > 마이크로 서비스 아키텍쳐 
// 




