package com.test.toy.board;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.toy.board.repository.BoardDAO;
import com.test.toy.board.repository.BoardDTO;

@WebServlet("/board/board.do")
public class Board extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//Board.java
		// 1. DB 작업 > select
		// 2. 겨로가 반환
		
		BoardDAO dao = new BoardDAO();
		List<BoardDTO> list = dao.list();
		
		for(BoardDTO dto : list) {
			
			System.out.println(dto.getRegdate()); // 이거 하나하나를 날짜는 뽑고 시분초를 버린다.
			dto.setRegdate( dto.getRegdate().substring(0, 10) );
			// 이 글이 현제 시간으로 부터 얼마나 오래된 시간인지가 알기 귀찮다. 그래서 그 계산은 db에서 한다. 
			// ★ 어떤 업무를 오라클에서 할지 자바에서 할지 어디에서 할지는 판단을 한다.
			// ★ 웬만하면 DB에서 하고 돌려주는 것이 수월하다. 
			
		}
		
		req.setAttribute("list", list);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/board/board.jsp");
		dispatcher.forward(req, resp);
	}
}