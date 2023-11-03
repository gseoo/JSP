<%@page import="com.util.Cookies"%>
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
    	[EL 쿠키를 사용하는 방법]
  		</xmp>
  		
  		<%
  			// 1. user
  			Cookie c = Cookies.createCookie("user", "admin");
  			response.addCookie(c);
  			
  			// 2. id
  			c = Cookies.createCookie("id", "hong");
  			response.addCookie(c);
  			
  			// 3. age
  			c = Cookies.createCookie("age", "20");
  			response.addCookie(c);
  		%>
  		
  		
  		<a href="ex04_03_ok.jsp">ex04_03_ok.jsp</a>
  		
	</div>
	
	<script>
	</script>
	
</body>
</html>