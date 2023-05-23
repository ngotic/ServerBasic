package com.test.toy.board;

import java.io.IOException;
import java.util.HashMap;
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

@WebServlet("/board/board.do")
public class Board extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		test(req, resp); // 
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		test(req, resp); // 
	}

	private void test(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 관리 차원에서 개구멍 막기에는 할일이 너무 많아서 필터에서 한다. 
		
		//Board.java
		// 1. DB 작업 > select
		// 2. 겨로가 반환
		
		
		HttpSession session = req.getSession();
		
		// 읽음 제어 
		session.setAttribute("read", "n"); // 나갔다가 다시 들어오면 허용해준다. 
		

		//?page=5 > null 없으면 null
		//?page=5&column=&word= >"" 빈문자열
		
		
		
		String page = req.getParameter("page");
		
		// 256 / 10 = 25.6 > 26
		
		//페이징
		int nowPage = 0;      // 현재 페이지 번호
		int pageSize = 10;    // 한페이지에서 출력할 게시물 수 
		int totalPage = 0;    // 총 페이지 수 > DB를 가야 안다.
		int totalCount = 0;   // 총 게시물 수 
		int begin = 0;
		int end = 0;
		int loop = 0;
		int blockSize = 10;   // 한번에 보여질 페이지 개수 
		
		// request 한 값이 있을 수도 있고 없을 수도 있다. 라는 것을 항상 생각해라..... 
		// board.do == page=1
		// board.do?page=1
		// board.do?page=2
		if ( page == null || page =="") nowPage = 1;
		else nowPage = Integer.parseInt(page);
		
		// nowPage > 현재 보려는 페이지 번호
		// board.do?page=1 > where rnum between  1 and 10
		// board.do?page=2 > where rnum between 11 and 20
		// board.do?page=3 > where rnum between 21 and 30
		begin = ((nowPage - 1) * pageSize) + 1;
		end = begin + pageSize - 1;
		
		
		
		
		
		// 2가지 용도 호출
		// 1. 일반 목록보기  > board.do
		// 2. 검색 결과 보기 > board.do?column=subject&word=test
		
		// 파라미터가 있냐 없냐의 구분이다. 
		
		String column = req.getParameter("column");
		String word = req.getParameter("word");
		String search = "n"; // 검색중(O, X)
		 
		HashMap<String, String> map = new HashMap<String, String>(); //DTO까진 아니더라도 HashMap으로 쓴다.
		
		if ((column == null && word == null) || (column.endsWith("") && word.equals(""))) {
	         search = "n";
	      } else {
	         search = "y";
	      }
		
	
		map.put("column", column);
		map.put("word", word);
		map.put("search", search);
		
		map.put("begin", begin+"");
		map.put("end", end+"");
		
		
		BoardDAO dao = new BoardDAO();
		List<BoardDTO> list = dao.list(map);
		System.out.println(map+","+list);
		
		for(BoardDTO dto : list) {
			
			System.out.println(dto.getRegdate()); // 이거 하나하나를 날짜는 뽑고 시분초를 버린다.
			//dto.setRegdate( dto.getRegdate().substring(0, 10) );
			// 이 글이 현제 시간으로 부터 얼마나 오래된 시간인지가 알기 귀찮다. 그래서 그 계산은 db에서 한다. 
			// ★ 어떤 업무를 오라클에서 할지 자바에서 할지 어디에서 할지는 판단을 한다.
			// ★ 웬만하면 DB에서 하고 돌려주는 것이 수월하다. 
			
			String subject = dto.getSubject();
			
			subject = subject.replace("<", "&lt;").replace(">", "&gt;"); 
			
			// 제목에서 검색 중.. 검색어를 강조 
			if ( search.equals("y") && column.equals("subject")) {
				// 새글입니다.
				// <span>새글</span>입니다.
				subject = subject.replace(word, "<span style=\"background-color:yellow;color:red;\">"+word+"</span>");
			}
			// 글 내용은 view.java로 간다. 
			
			
			dto.setSubject(subject);	
		}
		
		
		// 총 게시물
		
		if (list.size() !=0)
			totalCount = dao.getTotalCount(map);
		totalPage = (int)Math.ceil((double)totalCount/pageSize);
		System.out.println("this is : "+totalPage);
		
	
		/*
		 * <a href="/toy/board/board.do?page=1">[이전 10페이지]</a> <a
		 * href="/toy/board/board.do?page=1"></a> <a
		 * href="/toy/board/board.do?page=2"></a> <a
		 * href="/toy/board/board.do?page=3"></a> <a
		 * href="/toy/board/board.do?page=4"></a> <a
		 * href="/toy/board/board.do?page=5"></a> <a
		 * href="/toy/board/board.do?page=6"></a> <a
		 * href="/toy/board/board.do?page=7"></a> <a
		 * href="/toy/board/board.do?page=8"></a> <a
		 * href="/toy/board/board.do?page=9"></a> <a
		 * href="/toy/board/board.do?page=10"></a> <a
		 * href="/toy/board/board.do?page=10">[다음 10페이지]</a>
		 */
		
		
		StringBuilder sb = new StringBuilder();
		
		/*
		for(int i=1; i<= totalPage; i++) {
			if( i == nowPage) {
				sb.append(String.format(" <a href=\"#!\" style='color:tomato;'>%d</a>", i));
			}
			else {
				sb.append(String.format(" <a href=\"/toy/board/board.do?page=%d\">%d</a>", i, i));
			}
			
		}*/
		
		
		// board.do?page=1
		// [] 1 2 3 4 5 6 7 8 9 10 []
		
		// board.do?page=5
		// [] 1 2 3 4 5 6 7 8 9 10 []
		
		// board.do?page=10
		// [] 1 2 3 4 5 6 7 8 9 10 []
		
		// board.do?page=11
		// [] 11 12 13 14 15 16 17 18 19 20 []
		
		loop = 1;
		int n = ( (nowPage - 1) / blockSize ) * blockSize + 1;
		
		
		if( n ==1 ) { // n이 1이면 첫블럭
			sb.append(String.format(" <a href=\"#!\">[이전 %d페이지]</a>", blockSize));
		} else {
			sb.append(String.format(" <a href=\"/toy/board/board.do?page=%d\">[이전 %d페이지]</a>", n-1, blockSize));
		}
		
		
		
		while(!(loop>blockSize || n > totalPage )) {
			if( n == nowPage) {
				sb.append(String.format(" <a href=\"#!\" style='color:tomato;'>%d</a>", n));
			} else {
				sb.append(String.format(" <a href=\"/toy/board/board.do?page=%d\">%d</a>", n, n));
			}
			
			loop++;
			n++;
		}
		
		// 다음 10페이지
		if(n > totalPage) {
			sb.append(String.format(" <a href=\"#!\">[다음%d페이지]</a>", blockSize));
		} else {
			sb.append(String.format(" <a href=\"/toy/board/board.do?page=%d\">[다음 %d페이지]</a>", n, blockSize));
		}
		System.out.println("************* : "+list);
		req.setAttribute("list", list);
		req.setAttribute("map", map); // 검색어, 컬럼이름 ,검색중?
		req.setAttribute("totalCount", totalCount);
		req.setAttribute("totalPage", totalPage);
		req.setAttribute("nowPage", nowPage);
		req.setAttribute("pagination", sb);
		
		
		// JSP가 알 수 있는 정보
		// 1. request를 해서 넘어온
		// 2. session/cookie
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/board/board.jsp");
		dispatcher.forward(req, resp);
	}
}