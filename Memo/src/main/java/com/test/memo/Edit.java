package com.test.memo;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/edit.do")
public class Edit extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//Edit.java
		// 1. 번호 가져오기
		// 2. DB 작업 > select
		// 3. 결과 반환 > JSP 호출하기
		
		String seq = req.getParameter("seq");
		MemoDAO dao = new MemoDAO();
		
		MemoDTO dto = dao.get(seq);
		req.setAttribute("dto", dto);
		java.util.List<CategoryDTO> clist = dao.clist(); 
		req.setAttribute("clist", clist);
		
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/edit.jsp");
		dispatcher.forward(req, resp);

	}
	
	@Override
	protected void doPost(HttpServletRequest req,
						  HttpServletResponse resp) throws ServletException, IOException {
		//EditOk.java
		// 데이터 가져오기
		// DB작업
		// 피드백 
		
		req.setCharacterEncoding("UTF-8");
		// 1. 
		String memo = req.getParameter("memo");
		String category = req.getParameter("category");
		String seq = req.getParameter("seq");
		
		// 2. 
		MemoDAO dao = new MemoDAO();
		
		MemoDTO dto = new MemoDTO();
		dto.setMemo(memo);
		dto.setCseq(category);
		dto.setSeq(seq);
		
		int result = dao.edit(dto);
		
		if(result == 1) { // 다른 jsp로 가는게 아니라 이렇게 서블릿단에서 피드백 
			resp.sendRedirect("/memo/list.do");
		} else {
			PrintWriter writer = resp.getWriter();
			writer.write("<script>alert('failed'); history.back();</script>");
			writer.close();
		}
		

	}

}


	
