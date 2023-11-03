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
    	jquery ajax 함수 : json/js/xml 등
    	- get 방식 : getJson(), getScript(), get()
    	- post 방식 : post(); 
    	
    	get/post : load()  $.ajax()
  		</xmp>
  		
		<form action="" method="get">
			deptno : <input type="text" name="deptno" value="10" /><br>
			empno : <input type="text" name="empno" value="7369" />
			<input type="button" id="btnEmpnoCheck" value="empno 중복체크 - jquery ajax" />
			<p id="notice"></p>
			<br>
			ename : <input type="text" name="ename" value="" /><br>
			job : <input type="text" name="job" value="" /><br>
			<input type="submit" value="회원(emp) 가입" />
		 </form>
		 
	</div>
	
	<script>
		$(function() {
			$("#btnEmpnoCheck").on("click", function() {
				// deptno=10&empno=7369&ename=&job=
				let params = $("form").serialize();
				
				$.ajax({
					url:"ex04_idcheck.jsp"
					, dataType:"json"
					, type:"GET"
					, data:params
					, cache:false
					, success:function(data,textStatus, jqXHR) {
						if(data.count == 1) {
							$("#notice").css("color", "red").text("이미 사용 중인 ID입니다.");
						} else {
							$("#notice").css("color", "black").text("사용 가능한 ID입니다.");
						}
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