package com.test.toy.board;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.test.toy.board.repository.BoardDAO;
import com.test.toy.board.repository.BoardDTO;
import com.test.toy.board.repository.CommentDTO;

@WebServlet("/board/view.do")
public class View extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//View.java
		//1. 데이터 가져오기(seq)
		//2. DB 작업 > select
		//3. 결과 > JSP 호출하기
		
		HttpSession session = req.getSession();
		
		// 요청 헤더 > referer
		String referer = req.getHeader("referer");
		System.out.println(referer); 
		// 구글에서 온사람들, 네이버에서 온사람들의 정보를 알 수 있다. 사이트 유입경로는 이것으로 알 수 있다. 
		// ★ url이 찍히는데 이것은 현재 페이지를 보기전에 어디서 왔는지 알아내는 헤더정보다.
		
	
		
		String seq = req.getParameter("seq");
		
		String search = req.getParameter("search");
		String word = req.getParameter("word");
		String column = req.getParameter("column");
		
		System.out.println(">>>"+search);
		
		BoardDAO dao = new BoardDAO();
		
		// 세션은 toString으로 꺼낸다.
		if(session.getAttribute("read") != null && session.getAttribute("read").toString().equals("n")) {
			dao.updateReadcount(seq); // 리턴값 없이  
			session.setAttribute("read", "y");
		}
		// 읽음 조회수 증가
		
		
		// 조회수 ( 업무에 따라.. )
		// 1. 읽기만 하면 증가 > 무분별한 증가 > 우리는 이것만 막자 
		// 2. 하루에 1증가만 허용(계정 구분)
		// 3. 평생 1증가만 허용(계정 구분)
		// 기간별, 행동별 > 조회수 구분 허용, 읽었는지 여부를 알아야함
		
		// 1. 무분별 새로고침> 조회수 증가 X
		// 2. 다른 경로를 통해서 유입
		// - list.do > view.do > 조회수 증가 O
		// - view.do 즐겨찾기 > 조회수 증가 O
		// - 링크 > 조회수 증가O
		
		// 쿠키나 세션을 쓴다.  > 표시를 하나 만들어놓아야 한다. 개인이 관리 할 수 있는 값 
		// read라는 변수에 n이라는 값을 넣을 것이다. 
		
		BoardDTO dto = dao.get(seq);
		

		String content = dto.getContent();
		// 문제는 내용만 처리하면 안된다. 사용자가 기입할 수 있는 모든 곳에 다 막아야 한다. 
		content = content.replace("<", "&lt;").replace(">", "&gt;"); // 이걸로 스크립트 못넣게 해야함
		content = content.replace("\r\n", "<br>");
		
		
		
		//toy/board/view.do?seq=5&column=content&word=식당&search=y
		// 내용으로 검색중.. 검색어 강조!! > 전임자, 후임자 데이터 확인, 그리고 검색중인 상황을 넘겨야 한다. 
		
		if(search.equals("y") && column.equals("content")) {
			content = content.replace(word, "<span style=\"background-color:yellow;color:red;\">"+word+"</span>");
			// ★ 뒤로 가기를 하면 문제다. 상태유지가 안되는게 문제가..... 
		}
		// 브라우저가 읽는 것은 html로다. 그래서 뭔가 html 처리가 필요 
		
		
		dto.setContent(content);
		
		// 태그 이스케이프
		
		String subject = dto.getSubject(); 
		subject = subject.replace("<", "&lt;").replace(">", "&gt;").replace("\r\n", "<br>");
		dto.setSubject(subject);
		 
		List<CommentDTO> clist = dao.clist(seq);
		
		req.setAttribute("clist", clist);
		req.setAttribute("dto", dto);
		req.setAttribute("column", column);
		req.setAttribute("word", word);
		req.setAttribute("search", search);
				
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/board/view.jsp");
		dispatcher.forward(req, resp);

	}

}