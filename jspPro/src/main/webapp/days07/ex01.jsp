<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="days05.MemberInfo"%>
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
    	[코어 라이브러리]
    	1. 제어문 - c:if, c:choose, c:forEach 제어문 + c:forTokens
    	2. URL 처리 - c:import, c:redirect, c:url
    	3. 변수 지원 - c:set, c:remove
    	4. 기타 - c:catch, c:out
    	
    	1) c:set 태그 사용해서 변수 선언/할당
	    	property="설정할 속성, setter" 
	    	scope="page 영역" 
	    	target="속성값을 설정할 대상 객체" 
	    	value="변수값" 
	    	var="EL에서 사용할 변수명"
  		</xmp>
  		
  		<%
  			String name = "홍길동";
  		%>
  		name(표현식) = <%= name %><br>
  		
  		<c:set value="홍길동" var="name1"></c:set>
  		<c:set value="<%= name %>" var="name2"></c:set>
  		<c:set value="${ name }" var="name3"></c:set>
  		<c:set value="name" var="name4"></c:set>
  		
  		<hr>
  		
  		<%
  			MemberInfo m = new MemberInfo();
  			m.setId("admin");
  			m.setName("관리자");
  		%>
  		
  		<c:set var="vo" value="<%= m %>"></c:set>
  		id : ${ vo.id }<br>
  		
  		<hr>
  		
  		<c:set target="<%= m %>" property="id" value="hong"></c:set>
  		<c:set target="${ vo }" property="name" value="홍길동"></c:set>
  		
  		id : ${ vo.id }<br>
  		name : ${ vo.name }<br>
  		
  		<hr>
  		
  		<%
  			Map<String, String> map = new HashMap<>();
  			map.put("id", "admin");
  			map.put("passwd", "1234");
  		%>
  		
  		<c:set var="x" value="<%= map %>"></c:set>
  		
  		id : ${ x.id }<br>
  		passwd : ${ x.passwd }<br>
  		
	</div>
	
	<script>
	</script>
	
</body>
</html>