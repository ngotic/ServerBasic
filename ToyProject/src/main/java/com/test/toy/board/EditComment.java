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
import com.test.toy.board.repository.CommentDTO;

@WebServlet("/board/editcomment.do")
public class EditComment extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// 권한체크 !!! 
		//EditComment.java
		String bseq = req.getParameter("bseq"); // 상태유지 때문에 다른 페이지갔다고 와도 들고 있는다. 그렇다고 세션에 넣지 않는다. 
		String cseq = req.getParameter("cseq");
		String content = req.getParameter("content");
		
		BoardDAO dao = new BoardDAO();
		CommentDTO cdto = new CommentDTO();
		cdto.setSeq(cseq);
		// cdto.setBseq(bseq);
		cdto.setContent(content);
		int result = dao.editComment(cdto);
		
		if(result == 1) {
			resp.sendRedirect("/toy/board/view.do?seq="+bseq);// 히스토리백하면 안된다. 반영이 안된채로 온다. 
		} else {
			PrintWriter writer = resp.getWriter();
			writer.print("<script>alert('failed');history.back();</script>");
			writer.close();
		}

	}

}
// 이름이 계속 헷갈리는데 작업들어가기전에 명세를 미리 만들어야 한다. 
