package com.test.toy.board;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.test.toy.board.repository.BoardDAO;
import com.test.toy.board.repository.BoardDTO;

public class Auth {

	public static boolean check(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException  {
		
		String seq = req.getParameter("seq");
		HttpSession session = req.getSession();
		BoardDAO dao = new BoardDAO();
		BoardDTO dto = dao.get(seq);
		// 수정하기 삭제하기는 안보여도 수정하기 루트를 안다면? 
		if(!session.getAttribute("id").equals(dto.getId()) && !session.getAttribute("lv").toString().equals("3")) {
			PrintWriter writer = resp.getWriter();
			writer.write("<script>alert('failed'); location.href='/toy/index.do'; </script>");
			writer.close();
			return true;
		}
		
		return false;
		// 응답이 이미 커밋되면 forward할 수 없다.
		// writer.close(); 이후에 forward호출시 이메시지 뜬다.
		// 페이지를 만드는 업무가 중복된다. 
		//RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/board/del.jsp"); dispatcher.forward(req, resp);
		// 이거 쓰면 중복되서 에러가 남!!!!
		
	}

}
