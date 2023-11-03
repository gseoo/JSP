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
  			국어 : <input type="text" name="kor">
  		</form>
  		
  		kor = ${ param.kor }<br>
  		empty = ${ empty param.kor }<br>
  		
  		<hr>
  		
  		<c:if test="${ not empty param.kor }">
  			<c:set var="score" value="${ Math.floor(param.kor / 10) }"/>
  			<c:choose>
  				<c:when test="${ score eq 10 or score eq 9 }">수</c:when>
  				<c:when test="${ score eq 8 }">우</c:when>
  				<c:when test="${ score eq 7 }">우</c:when>
  				<c:when test="${ score eq 6 }">우</c:when>
  				<c:otherwise>가</c:otherwise>
  			</c:choose>
  			<%-- 
			<c:set var="score" value="${ param.kor }"/>
			<c:choose>
				<c:when test="${score >= 90 && score <= 100}">수</c:when>
				<c:when test="${score >= 80 && score  < 90}">우</c:when>
				<c:when test="${score >= 70 && score  < 80}">미</c:when>
				<c:when test="${score >= 60 && score< 70}">양</c:when>
				<c:otherwise>가</c:otherwise>
			</c:choose>
 			--%>
  		</c:if>
  		
  		
  		
	</div>
	
	<script>
	</script>
	
</body>
</html>