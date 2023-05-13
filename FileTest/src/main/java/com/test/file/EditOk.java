package com.test.file;

import java.io.File;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/editok.do")
public class EditOk extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//EditOk.java
		//1. 데이터 가져오기 
		//2. DB 작업 > DAO 위임 > update
		//3. 첨부 파일 교체
		String seq = "";
		String name = "";
		String filename = "";
		FileDAO dao = new FileDAO();
		try {
			
			MultipartRequest multi = new MultipartRequest(
					req, 
					req.getRealPath("/files"), // 아무데나 적어도 된다.
					1024 * 1024* 100,
					"UTF-8",
					new DefaultFileRenamePolicy()
			);
			
			System.out.println("attach : " + multi.getFilesystemName("attach"));
			
			seq = multi.getParameter("seq");
			name = multi.getParameter("name");
			filename = multi.getFilesystemName("attach");
			
			if(filename != "") {
				// 기존 파일 삭제 > 새 파일 교체
				File file = new File(req.getRealPath("/files")+"\\" +dao.get(seq).getFilename());
				file.delete(); 
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		System.out.println(seq+"+"+ name +""+filename);
		
		
		FileDTO dto = new FileDTO();
		
		dto.setSeq(seq);
		dto.setName(name);
		dto.setFilename(filename);
		
		int result = dao.edit(dto);
		
		req.setAttribute("result", result);
		req.setAttribute("seq", seq);
		
		// ★★★★ edit.js에서 seq가 없네?? 그러면 뷰 파일을 부른쪽으로 가라 
		// ★★★★ 반드시 그 출처는 전임자로 가야 한다.
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/editok.jsp");
		dispatcher.forward(req, resp);

	}

}