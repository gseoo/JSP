<%@page import="java.net.URLDecoder"%>
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
  		<form>
  		<%
  			Cookie[] cookieArr = request.getCookies();
  			for(Cookie c : cookieArr) {
  				String cname = c.getName();
  				String cvalue = URLDecoder.decode(c.getValue(), "UTF-8");
  				System.out.printf(">domain:%s, path:%s, maxAge:%d\n", 
  								c.getDomain(), c.getPath(), c.getMaxAge());
  		%>
  		<input type="checkbox" name="ckbCookie" value="<%= cname %>">
  		<%= cname %> - <%= cvalue %>
  		<br>
  		<%
  			}
  		%>
  		</form>
  		
  		<a href="ex06.jsp">쿠키 Home</a><br><br>
  		<a href="ex06_02.jsp">쿠키 생성</a><br><br>
  		수정할 쿠키를 체크한 후 쿠키 수정, 삭제<br>
  		<a href="ex06_04.jsp">쿠키 삭제</a><br>
  		<a href="ex06_05.jsp">쿠키 수정</a><br>
  		
	</div>
	
	<script>
		/* $("a").on("click", function() {
			event.preventDefault();
			
			let url = $(this).attr("href");
			$("form")
				.attr("action", url)
				.submit();
		}); */
		
		$("a").on("click", function() {
			event.preventDefault();
			
			let url = $(this).attr("href");
			
			let queryString = $("form").serialize();
			// ckbCookie=name&ckbCookie=age
			location.href = `\${url}?\${queryString}`;
		});
	</script>
	
</body>
</html>