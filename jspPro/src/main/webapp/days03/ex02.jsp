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
    	ex02.jsp
  		</xmp>
  		
  		<form action="ex02_ok.jsp">
  			<fieldset>
  				<legend>부서 선택</legend>
		  		<input type="checkbox" name="deptno" value="10">ACCOUNTING
		  		<input type="checkbox" name="deptno" value="20">RESEARCH
		  		<input type="checkbox" name="deptno" value="30">SALES
		  		<input type="checkbox" name="deptno" value="40">OPERATIONS	  	
  			</fieldset>
  			<br>
  			<fieldset>
  				<legend>직업(job) 선택</legend>
		  		<input type="checkbox" name="job" value="ANALYST">ANALYST
		  		<input type="checkbox" name="job" value="CLERK">CLERK
		  		<input type="checkbox" name="job" value="MANAGER">MANAGER
		  		<input type="checkbox" name="job" value="PRESIDENT">PRESIDENT
		  		<input type="checkbox" name="job" value="SALESMAN">SALESMAN  	
  			</fieldset>
  			
  			<input type="submit" value="search">
  			<input type="button" value="emp delete">
  		</form>
  		
	</div>
	
	<script>
	</script>
	
</body>
</html>