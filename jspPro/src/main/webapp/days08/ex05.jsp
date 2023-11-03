<%@page import="java.util.Date"%>
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
  		
  		<h3><%= new Date().toLocaleString() %></h3>
  		<input type="button" id="btn1" value="jquery + json"/>
  		<br>
  		<p id="demo"></p>
	</div>
	
	<script>
		$(function() {
			$("#btn1").on("click", function() {
				// deptno=10&empno=7369&ename=&job=
				let params = $("form").serialize();
				
				$.ajax({
					/* url:"ex05_empjson.jsp" */
					url:"ex05_empjson_lib.jsp"
					, dataType:"json"
					, type:"GET"
					, cache:false
					, success:function(data,textStatus, jqXHR) {
						$(data.emp).each(function(i, element) {
						  	$("#demo").append(`<li>${ element.empno} : ${ element.ename}</li>`);
						});
					}
					, error:function() {
						alert("에러");
					}
				});
			});
		});
	</script>
	
</body>
</html>