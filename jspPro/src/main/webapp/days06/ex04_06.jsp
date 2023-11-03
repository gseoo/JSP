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
  			String title = "JSP-EL 수업 중~";
  			request.setAttribute("title", title);
  		%>
  		제목 : <%= title %><br>
  		<%= "제목 : " + title %><br>
  		${ requestScope.title }<br>
		제목 : ${ title }<br>
		
		<!-- EL안에서 += 연산자는 문자열 연결 연산자이다. -->
		${ "제목 : " += title }<br>
		${ 1+1; 10+10 }<br> <!-- 20 -->
		${ n = 0 }<br> <!-- 0 -->
  		
	</div>
	
	<script>
	</script>
	
</body>
</html>