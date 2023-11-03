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
    	[ex04_02.jsp]
  		</xmp>
  		
  		요청 URI : <%= request.getRequestURI() %><br>
  		요청 URI(EL) : ${pageContext.request.requestURI}<br>
  		<!--
  		(실행 결과)
  		요청 URI : /jspPro/days06/ex04_02.jsp
		요청 URI(EL) : /jspPro/days06/ex04_02.jsp
		-->
		
		<hr>
		
		<%
			// JSP request Scope에 저장
			request.setAttribute("name", "홍길동");
		%>
		
		name : <%= request.getAttribute("name") %><br>
		name(EL1) : ${requestScope.name}<br>
		name(EL2) : ${name}<br>
		<!-- pageScope, requestScope, sessionScope, applicationScope 를 다 검색함 -->
		<!-- 
		(실행 결과)
		name : 홍길동
		name(EL1) : 홍길동
		name(EL2) : 홍길동
		 -->
		 
		 <hr>
		 
		 age : <%= request.getParameter("age") %><br>
		 age(EL) : ${param.age}<br>
  		
	</div>
	
	<script>
	</script>
	
</body>
</html>