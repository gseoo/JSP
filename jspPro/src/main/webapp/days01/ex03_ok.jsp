<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	/*
	http://localhost/jspPro/days01/ex03_ok.jsp
	?
	title=a
	&
	author=b
	*/
	
	// jsp 내장 객체 - 11가지 request
	String title = request.getParameter("title");
	String author = request.getParameter("author");
%>

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
  		
  		책 제목 : <%= title %><br>
  		저자 : <%= author %><br>
  		
	</div>
	
	<script>
	</script>
	
</body>
</html>