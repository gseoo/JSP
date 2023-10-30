<%@page import="com.util.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
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
    	[ 커넥션 풀(Connection Pool) ]
    	1. DBCP를 이용해서 커넥션풀 사용하기
    	1) tomcat-dbcp.jar 추가
    	2) 커넥션풀 설정
    		META-INF 폴더에 context.xml 추가
  		</xmp>
  		
  		<%
  		/*
	  		Context initContext = new InitialContext();
	  		Context envContext  = (Context)initContext.lookup("java:/comp/env");
	  		DataSource ds = (DataSource)envContext.lookup("jdbc/myoracle");
	  		Connection conn = ds.getConnection();
	  		//etc.
	  		*/
	  		
	  		Connection conn = ConnectionProvider.getConnection();
  		%>
  		
  		conn = <%= conn %><br>
  		conn.state = <%= conn.isClosed() %><br>
  		
  		<%
  			conn.close(); // 커넥션 풀 반환
  		%>
	</div>
	
	<script>
	</script>
	
</body>
</html>