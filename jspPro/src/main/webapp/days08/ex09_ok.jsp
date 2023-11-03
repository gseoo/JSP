<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.multipart.FileRenamePolicy"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<link rel="shortcut icon" href="http://localhost/jspPro/images/SiSt.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link rel="stylesheet" href="/jspPro/resources/cdn-main/example.css">
<script src="/jspPro/resources/cdn-main/example.js"></script>
<style>
	span.material-symbols-outlined{
		vertical-align: text-bottom;
 	}
</style>
</head>
<body>
	<header>
  		<h1 class="main">
    		<a href="#">GyeongSeo Home</a>
  		</h1>
  		<ul>
  			<li><a href="#">로그인</a></li>
  			<li><a href="#">회원가입</a></li>
  		</ul>
	</header>
	<h3>
		<span class="material-symbols-outlined">view_list</span>
		jspclass days00
	</h3>
	<div>
  		<xmp class="code">
    	
  		</xmp>
  		
  		<%
  			// ㄴ : 서버에 저장될 위치경로)
  			String saveDirectory = pageContext.getServletContext().getRealPath("/days08/upload/");
  			System.out.println(saveDirectory);
  			
  			File f = new File(saveDirectory);
  			if(!f.exists()) f.mkdirs();
  			
  			// ㄷ : 최대 파일 크기
  			int maxPostSize = 5 * 1024 * 1024; // 5byte * 1024 * 1024 = 5MB
  			
  			// ㄹ : 파일의 인코딩 방식
  			String encoding = "UTF-8";
  			
  			// ㅁ : 파일 중복 처리를 위한 인자(클래스 제공)
  			FileRenamePolicy policy = new DefaultFileRenamePolicy();
  			
  			MultipartRequest multiRequest = new MultipartRequest(
  					request
  					, saveDirectory
  					, maxPostSize
  					, encoding
  					, policy
  					);
  			// 첨부파일들은 upload 폴더에 저장 완료
  		%>
  		
  		> 전송된 메시지 : <%= multiRequest.getParameter("msg") %>
  		
  		<br>
  		
  		<%
  			Enumeration en = multiRequest.getFileNames();
  			while(en.hasMoreElements()) {
  				String inputNameAttr = (String)en.nextElement();
  				File attachFile = multiRequest.getFile(inputNameAttr);
  				if(attachFile != null) {
  					String fileName = attachFile.getName();
  					String originalFileName = multiRequest.getOriginalFileName(inputNameAttr);
  					String filesystemName = multiRequest.getFilesystemName(inputNameAttr);
  		%>
  		<hr>
  		> 첨부된 파일명 : <%= fileName %><br>
  		> 첨부된 파일 크기 : <%= attachFile.length() %><br>
  		> 첨부된 원래 파일명 : <%= originalFileName %><br>
  		> 실제 저장된 파일명 : <%= filesystemName %><br>
  		<%
  				}
  			}
  		%>
	</div>
	
	<script>
	</script>
	
</body>
</html>