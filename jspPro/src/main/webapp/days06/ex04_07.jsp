<%@page import="java.text.DecimalFormat"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    	[EL에서 객체의 메소드 호출]
    	[EL에서 객체의 정적메소드 호출]
    	days06.FormatUtil 클래스 추가
  		</xmp>
  		
  		<%
			long price = 22345;
		%>
		price(표현식) = <%= price %><br> <!-- price(표현식) = 22345 -->
		price(표현식) = <%= String.format("%,d", price) %><br> <!-- price(표현식) = 22,345 -->
		
		<%
			String pattern = "##,###";
			DecimalFormat df = new DecimalFormat(pattern);
		%>
		price(표현식) = <%= df.format(price) %><br> <!-- price(표현식) = 22,345 -->
		
		<hr>
		
		<%
			request.setAttribute("price", price);
		%>
		price(EL) = ${ price }<br> <!-- 22345 -->
		price(EL) = ${ requestScope.price }<br> <!-- 22345 -->
		price(EL) = <fmt:formatNumber pattern="#,###" value="${ price }"></fmt:formatNumber><br> <!-- 22,345 -->
	</div>
	
	<script>
	</script>
	
</body>
</html>