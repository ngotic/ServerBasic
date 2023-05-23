package com.test.toy.board;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.test.toy.board.repository.BoardDAO;
import com.test.toy.board.repository.CommentDTO;

@WebServlet("/board/comment.do")
public class Comment extends HttpServlet {

	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//Comment.java
		HttpSession session = req.getSession();
		
		String comment = req.getParameter("comment");
		String bseq = req.getParameter("bseq");
		
		
		String column = req.getParameter("column");
		String word = req.getParameter("word");
		String search = req.getParameter("search");
		
		System.out.println(comment+ bseq+(String)session.getAttribute("id"));
		
		BoardDAO dao = new BoardDAO();
		CommentDTO cdto = new CommentDTO();
		
		cdto.setContent(comment);
		cdto.setBseq(bseq);
		cdto.setId((String)session.getAttribute("id"));
		
		int result = dao.addComment(cdto);
		
		if(result == 1) { // 피드백을 주는데 시퀀스를 붙여야 한다. 
			resp.sendRedirect("/toy/board/view.do?seq="+bseq+"&word="+URLEncoder.encode(word, "UTF-8")+"&column="+column+"&search="+search);// 히스토리백하면 안된다. 반영이 안된채로 온다. 
		} else {
			PrintWriter writer = resp.getWriter();
			writer.print("<script>alert('failed');history.back();</script>");
			writer.close();
		}
	}

}