package com.test.toy.board;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.toy.board.repository.BoardDAO;

@WebServlet("/board/del.do")
public class Del extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//Del.java

		// 이런식으로 일일히 막아야 한다.
		// 유저들 사이에 구분은 직접처리한다. 
		if( Auth.check(req, resp)) {  
			return ;
		} // 쫒아내야하니까 response도 받는다.
		
		String seq = req.getParameter("seq");
		req.setAttribute("seq", seq);
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/board/del.jsp");
		dispatcher.forward(req, resp);
	}
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String seq = req.getParameter("seq");
		BoardDAO dao = new BoardDAO();
		
		
		// 삭제될 글에 댓글이 달렸는지 확인 > 있으면 삭제
		int result = 0;
		result *= dao.delComment(seq); // 피드백이 조건이 늘어서 2개가 됨 곱하면 ??? 최소한 둘다 성공하면 0은 아닐듯 
		result = dao.del(seq); // 글 삭제 
		// 이런거 원래 트랜잭션 걸어야 한다. 
		
		if(result >= 1) {
			resp.sendRedirect("/toy/board/board.do");// 히스토리백하면 안된다. 반영이 안된채로 온다. 
		} else {
			PrintWriter writer = resp.getWriter();
			writer.print("<script>alert('failed');history.back();</script>");
			writer.close();
		}
		
	}

}