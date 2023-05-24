package com.test.toy.place;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.test.toy.place.repository.PlaceDAO;
import com.test.toy.place.repository.PlaceDTO;
import com.test.toy.user.repository.UserDAO;
import com.test.toy.user.repository.UserDTO;

@WebServlet("/place/addplace.do")
public class AddPlace extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//AddPlace.java
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/place/addplace.jsp");
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// Register OK 역할
		//1. 데이터 가져오기
		//2. DB 작업 > insert 
		//3. 결과
		PlaceDAO dao = new PlaceDAO();
		try {
			MultipartRequest multi = new MultipartRequest(
									req, 
									req.getRealPath("/asset/place"),
									1024 * 1024 * 10, 
									"UTF-8",
									new DefaultFileRenamePolicy() 
									);
			
			System.out.println(req.getRealPath("/asset/place")); // 업로드 되는 지 확인
			
			HttpSession session = req.getSession();
			
			String name = multi.getParameter("name");
			String content = multi.getParameter("content");
			String pic = multi.getFilesystemName("pic");
			
			PlaceDTO dto = new PlaceDTO();
			
			dto.setName(name);
			dto.setContent(content);
			dto.setPic(pic);
			dto.setId((String)session.getAttribute("id"));
			
			int result = dao.addPlace(dto);
			
			String pseq = dao.getPlaceSeq();
			
			String hashtag = multi.getParameter("hashtag");
			
			// [{"value":"123"},{"value":"23"},{"value":"232"},{"value":"1241"},{"value":"12321"}]
			System.out.println(hashtag);
			
			JSONParser parser = new JSONParser();
			
			JSONArray arr = (JSONArray) parser.parse(hashtag);
			
			for( Object obj : arr) {
				// System.out.println(obj);
				String tag = (String)((JSONObject)obj).get("value");
				String hseq ="";
				
				if ( dao.checkHashTag(tag) ) {
				// 해시 태그 > insert 
					dao.assHashTag(tag);      // 해시테그 한번 등록하고 
					hseq = dao.getHashTagSeq();
				} else {
					hseq = dao.getHashTagSeq2(tag); // 기존 태그 번호 가져온다. 
				}
				// 관계 테이블 추가 
				HashMap<String, String> map = new HashMap<String, String>();
				map.put("pseq", pseq);
				map.put("hseq", hseq);
				
				dao.addPlaceHashTag(map); // 참조키 받아다가 또 등록하고 
			}
			
			
			
			
			
			if(result == 1) {
				resp.sendRedirect("/toy/place/place.do");
			} else {
				PrintWriter writer = resp.getWriter();
				writer.print("<script>alert('failed');history.back();</script>");
				writer.close();
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		}
				
	}

}