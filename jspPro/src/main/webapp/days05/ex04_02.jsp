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
    	pageContext 저장 객체 == page Scope(영역)
  		</xmp>
  		
  		<%
  			//pageContext.getAttribute(name);
  			//pageContext.getAttribute(name, value);
  			
  			// [pageContext로 기본 내장 객체를 얻어올 수 있음]
  			// pageContext.getRequest() == request
  			// pageContext.getResponse() == response
  			// pageContext.getOut() == out
  			// pageContext.getServletConfig() == config
  			// pageContext.getServletContext() == application
  		%>
	</div>
	
	<script>
	</script>
	
</body>
</html>