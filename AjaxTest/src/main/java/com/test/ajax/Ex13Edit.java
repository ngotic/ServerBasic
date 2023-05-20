package com.test.ajax;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

@WebServlet("/ex13edit.do")
public class Ex13Edit extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//Ex13Edit.java
		
		req.setCharacterEncoding("UTF-8");
		String seq = req.getParameter("seq");
		String name = req.getParameter("name");
		String price = req.getParameter("price");
		String color = req.getParameter("color");
		System.out.println(">"+seq+", "+name+","+price+", "+color);
	
		Ex13DTO dto = new Ex13DTO();
		dto.setName(name);
		dto.setPrice(price);
		dto.setColor(color);
		dto.setSeq(seq);
	
		AjaxDAO dao = new AjaxDAO();
		System.out.println("ss>> "+seq);
		int result = dao.editProduct(dto);
		
		JSONObject obj = new JSONObject();
		obj.put("result", result);
		resp.setContentType("application/json");
		
		PrintWriter writer = resp.getWriter();
		writer.print(obj);
		writer.close();
		
		
	}

}