package com.test.file;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import oracle.jdbc.rowset.OracleRowSetListenerAdapter;


@WebServlet("/multifileok.do")
public class MultiFileOk extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//MultiFileOk.java
		
		req.setCharacterEncoding("UTF-8");
		
		List<String> olist = new ArrayList<String>();
		List<String> flist = new ArrayList<String>();
		
		try {
			
			System.out.println("org path : "+ req.getRealPath("/files"));
			
			MultipartRequest multi = new MultipartRequest(
							req, 
							req.getRealPath("/files"), // 아무데나 적어도 된다.
							1024 * 1024* 100,
							"UTF-8",
							new DefaultFileRenamePolicy()
					);
			// 하나를 올리던 여러개를 올리던 파일이 무조건 올라간다.
			
			/*
			 * String orgfilename = multi.getOriginalFileName("attach"); String filename =
			 * multi.getFilesystemName("attach");
			 * System.out.println(orgfilename+filename);
			 * 여러개 들어가면 이방법은 아니다. 
			 */
			Enumeration e = multi.getFileNames(); //
			
			while(e.hasMoreElements()){
				//System.out.println("*"+e.nextElement());
				//File file = multi.getFile(e.nextElement().toString());
				String file = e.nextElement().toString();
				
				String orgfilename = multi.getOriginalFileName(file);
				String filename = multi.getFilesystemName(file);
				
				System.out.println(">"+orgfilename);
				System.out.println(">"+filename);
				olist.add(orgfilename);
				flist.add(filename);
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		req.setAttribute("olist", olist);
		req.setAttribute("flist", flist);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/multifileok.jsp");
		dispatcher.forward(req, resp);

	}

}