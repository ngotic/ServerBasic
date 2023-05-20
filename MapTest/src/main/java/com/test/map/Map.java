package com.test.map;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/map.do")
public class Map extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//Map.java
		MapDAO dao = new MapDAO();
		List<CategoryDTO> clist = dao.clist();
		List<PlaceDTO> mlist = dao.mlist();
		
		setIcons(mlist);
		req.setAttribute("mlist", mlist);
		req.setAttribute("clist", clist);
		
		
		
		System.out.println(mlist);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/map.jsp");
		dispatcher.forward(req, resp);

	}
	
	@Override
	protected void doPost(HttpServletRequest req,
			HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		String name = req.getParameter("name");
		String category = req.getParameter("category");
		String lat = req.getParameter("lat");
		String lng = req.getParameter("lng");
		
		// System.out.println(name + category + lat+ lng);
		
		PlaceDTO dto = new PlaceDTO();
		
		dto.setName(name);
		dto.setCseq(category);
		dto.setLat(lat);
		dto.setLng(lng);
		
		MapDAO dao = new MapDAO();
		
	
		int result = dao.add(dto);
		
	
		
		if (result == 1) {
			resp.sendRedirect("/map/map.do");
		} else {
			PrintWriter writer = resp.getWriter();
			writer.print("<script>alert('failed'); history.back();</script>"); 
			writer.close();
		}
	}
	
	private void setIcons(List<PlaceDTO> mlist) {
		for (PlaceDTO dto : mlist) {
			System.out.println(dto.getCseq());
			if(dto.getCseq().equals("1")) {
				dto.setCicon("restaurant_menu");
			} else if(dto.getCseq().equals("2")) {
				dto.setCicon("local_cafe");
			} else if(dto.getCseq().equals("3")) {
				dto.setCicon("fitness_center");
			} else if(dto.getCseq().equals("4")) {
				dto.setCicon("breakfast_dining");
			} else if(dto.getCseq().equals("5")) {
				dto.setCicon("sports_bar");
			}
			
		}
		
	}
	
}