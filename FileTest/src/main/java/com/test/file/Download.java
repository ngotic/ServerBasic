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

@WebServlet("/download.do")
public class Download extends HttpServlet {

   @Override // 이걸 가져다가 쓰면 된다. 
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       
	   
	  // 제어 가능
	  // 1. 다운로드 횟수 저장 > update table set download = download + 1..
	  // 2. 권한 통제 > 현재 세션(사용자구분) + 다운로드 권한 체크
	  // 3. 등등..
	   
	   
      String fileName = request.getParameter("filename");
      String orgfileName = request.getParameter("orgfilename");

      String savePath = "files"; // 일단 이거 
      
      ServletContext context = getServletContext();
      String sDownloadPath = context.getRealPath(savePath);


      String sFilePath = sDownloadPath + "/" + fileName;
      byte b[] = new byte[4096];
      FileInputStream in = new FileInputStream(sFilePath);
      String sMimeType = getServletContext().getMimeType(sFilePath);
      System.out.println("sMimeType>>>" + sMimeType);
      
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
      
      
      // ★★★★ 이거 특문은 안된다. > 특문 해결하기 
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

      while ((numRead = in.read(b, 0, b.length)) != -1) {
         out2.write(b, 0, numRead);
      }
      out2.flush();
      out2.close();
      in.close();
      

   }

}





