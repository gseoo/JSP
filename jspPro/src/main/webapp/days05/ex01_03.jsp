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
  <h1 class="main"><a href="#" style="position: absolute;top:30px;">GyeongSeo Home</a></h1>
  <ul>
    <li><a href="#">로그인</a></li>
    <li><a href="#">회원가입</a></li>
  </ul>
</header>
<h3>
  <span class="material-symbols-outlined">view_list</span> jsp days05 - ex01.jsp
</h3>
<div>
  <xmp class="code">
  	[ jsp 예외처리 방법 ]
  	
  	2) 예외 타입별로 예외 페이지 지정
  	      [예외 타입별]
  	      NullPointException
  	      ~Exception
  </xmp> 
  
  <%
  	String name = null;
	name = request.getParameter("name");
 	name = name.toUpperCase();
  	
  %>
  
  name 파라미터값 : <%=name %><br>
  
</div>

<script>
	
</script>
</body>
</html>