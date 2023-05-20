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

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/ex13add.do")
public class Ex13Add extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req,
			HttpServletResponse resp) throws ServletException, IOException {
		//Ex13Add.java
		
		
		System.out.println(req.getRealPath("/pic"));
		
		try {
			
			// req.getSession().getServletContext().getRealPath("/pic"); 원래 이걸 써야 한다. 
			// req.getRealPath("/pic") 은 이거랑 같다. 
			
			MultipartRequest multi = new MultipartRequest(
					req,
					req.getRealPath("/pic"),
					1024*1024*100,
					"UTF-8",
					new DefaultFileRenamePolicy()
					);
			// multi.getParameter(getServletInfo());
			String name = multi.getParameter("name");
			String price = multi.getParameter("price");
			String color = multi.getParameter("color");
			String pic = multi.getFilesystemName("pic"); // getParameter아니다.
			
			
			System.out.println("****"+name +"/"+ price+"/" +color+"/" + pic );
			Ex13DTO dto = new Ex13DTO();
			dto.setName(name);
			dto.setPrice(price);
			dto.setColor(color);
			dto.setPic(pic);
			
			System.out.println(">>" + color);
			AjaxDAO dao = new AjaxDAO();
			
			int result = dao.addProduct(dto);
			
			Ex13DTO newProduct = dao.getProduct();// 방금 등록한 상품 가져오기
			
			resp.setCharacterEncoding("UTF-8");
			resp.setContentType("application/json");
			
			PrintWriter writer = resp.getWriter();
			JSONObject obj = new JSONObject();
			obj.put("result", result);
			obj.put("pic", newProduct.getPic());
			obj.put("seq", newProduct.getSeq());
			writer.print(obj);
			
			writer.close();
			
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		
	}

}