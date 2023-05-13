package com.test.file;

import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/file/download.do")
public class Download extends HttpServlet {
	
	/*
   @Override // 이걸 가져다가 쓰면 된다. 
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       
	   
	  // 제어 가능
	  // 1. 다운로드 횟수 저장 > update table set download = download + 1..
	  // 2. 권한 통제 > 현재 세션(사용자구분) + 다운로드 권한 체크
	  // 3. 등등..
	   
	   
      String fileName = request.getParameter("filename"); // 우리는 서버에 파일을 관리하기 위해 중복 안되도록 가짜이름을 붙여서 저장한다.
      String orgfileName = request.getParameter("orgfilename");
      
      String savePath = "uploads";
      ServletContext context = getServletContext(); // 톰켓 context를 가지고와서 
      String sDownloadPath = context.getRealPath(savePath); //진짜로 서버의 getRealPath인데
      String sFilePath = sDownloadPath + "/" + fileName; // 진짜로 파일이 저장된 path
      
      
      byte b[] = new byte[4096];
      FileInputStream in = new FileInputStream(sFilePath); // 파일을 여는 스트림 지정 
      String sMimeType = getServletContext().getMimeType(sFilePath);
      System.out.println("sMimeType>>>" + sMimeType); // 원래는 이미지라고 image/png 라고 적혀있다. 
      // 아 이거보고 브라우저가 그러면 열수 있겠네 하고 이미지를 원래는 열어준다. 그런데 마임타입을 바꿔버리면
      // 브라우저는 다운로드하는 방법을 선택한다.
      
      // 브라우저가 바로 열수없는 포맷 > 브라우저는 이걸 보고 아 내가 해석할 수 없는거구나~ 라고 해석
      // 사실 미리 알려주는 헤더정보로 데이터를 인식한다. 이래서 텍스트파일이여도 다운로드 처리함
      if (sMimeType == null)
         sMimeType = "application/octet-stream"; 
         //text/html
         //image/gif
         //application/zip

      response.setContentType(sMimeType);
      String agent = request.getHeader("User-Agent");
      boolean ieBrowser = (agent.indexOf("MSIE") > -1) || (agent.indexOf("Trident") > -1);

      if (ieBrowser) {
         fileName = URLEncoder.encode(fileName, "UTF-8").replaceAll("/+", "%20");
      } else {
         fileName = new String(fileName.getBytes("UTF-8"), "iso-8859-1"); // 사이사이 인코딩이 들어간다. 
      }

      orgfileName = new String(orgfileName.getBytes("UTF-8"), "ISO-8859-1");// 사이사이 인코딩이 들어간다.
      
      response.setHeader("Content-Disposition", "attachment; filename= " + orgfileName); 
      // 사용자가 원래 올린 파일 이름으로 다운로드 

      ServletOutputStream out2 = response.getOutputStream();
      int numRead;

      while ((numRead = in.read(b, 0, b.length)) != -1) { // 파일을 이만큼 읽어서 쓴다. 
         out2.write(b, 0, numRead);                       // OutputStream에 write 해준다. 
      }
      out2.flush(); // 버퍼에 남은 내용이 있으면 모두 파일에 출력 
      out2.close();
      in.close();
   }
   */
	
	   @Override // 이걸 가져다가 쓰면 된다. 
	   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	       
		   
		  // 제어 가능
		  // 1. 다운로드 횟수 저장 > update table set download = download + 1..
		  // 2. 권한 통제 > 현재 세션(사용자구분) + 다운로드 권한 체크
		  // 3. 등등..
		  		   
	      String fileName = request.getParameter("filename"); // 우리는 서버에 파일을 관리하기 위해 중복 안되도록 가짜이름을 붙여서 저장한다.
	      String orgfileName = request.getParameter("orgfilename");
	      
	      String savePath = "uploads";
	      ServletContext context = getServletContext(); // 톰켓 context를 가지고와서 
	      String sDownloadPath = context.getRealPath(savePath); //진짜로 서버의 getRealPath인데
	      String sFilePath = sDownloadPath + "/" + fileName; // 진짜로 파일이 저장된 path
	      

	      
	      String sMimeType = getServletContext().getMimeType(sFilePath);
	      System.out.println("sMimeType>>>" + sMimeType); // 원래는 이미지라고 image/png 라고 적혀있다. 
	      if (sMimeType == null)
	         sMimeType = "application/octet-stream"; 
	         //text/html
	         //image/gif
	         //application/zip

	      response.setContentType(sMimeType);
	      String agent = request.getHeader("User-Agent");
	      boolean ieBrowser = (agent.indexOf("MSIE") > -1) || (agent.indexOf("Trident") > -1);
	      
	      System.out.println("체크해보자  >> "+fileName);
	      if (ieBrowser) {
	         fileName = URLEncoder.encode(fileName, "UTF-8").replaceAll("/+", "%20");
	      } else {
	         fileName = new String(fileName.getBytes("UTF-8"), "iso-8859-1"); // 사이사이 인코딩이 들어간다. 
	      }
	      orgfileName = new String(orgfileName.getBytes("UTF-8"), "ISO-8859-1");// 사이사이 인코딩이 들어간다.
	      
	      
	      response.setHeader("Content-Disposition", "attachment; filename= " + orgfileName); 
	      // 사용자가 원래 올린 파일 이름으로 다운로드 
	      
	      FileInputStream in = new FileInputStream(sFilePath); // 파일을 여는 스트림 지정
	      ServletOutputStream out2 = response.getOutputStream();
	      int numRead;
	      byte b[] = new byte[4096];
	      
	      while ((numRead = in.read(b, 0, b.length)) != -1) { // 파일을 이만큼 읽어서 쓴다. 
	         out2.write(b, 0, numRead);                       // OutputStream에 write 해준다. 
	      }
	      out2.flush(); // 버퍼에 남은 내용이 있으면 모두 파일에 출력 
	      out2.close();
	      in.close();
	      
	  }
}





