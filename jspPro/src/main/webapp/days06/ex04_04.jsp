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
    	EL 산술 연산자 사용 가능
  		</xmp>
  		
  		${ 10 + 3 }<br> <!-- 13 -->
  		${ 10 - 3 }<br> <!-- 7 -->
  		${ 10 * 3 }<br> <!-- 30 -->
  		${ 10 / 3 }<br> <!-- 3.3333333333333335 -->
  		<%-- ${ 10 div 3 }<br>  --%>
  		${ 10 % 3 }<br> <!-- 1 -->
  		<%-- ${ 10 mod 3 }<br>  --%>
  		
  		<hr>
  		 
  		${ "10" + 3 }<br> <!-- 13 -->
  		<%-- ${ "한글" + 3 }<br>  --%><!-- java.lang.NumberFormatException -->
  		${ null + 3 }<br> <!-- 3 -->
  		
	</div>
	
	<script>
	</script>
	
</body>
</html>