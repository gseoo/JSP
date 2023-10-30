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
    	[상태관리]
    	ex03.jsp	ex03_02.jsp		ex03_03.jsp
    	이름			주소				이름, 나이, 주소, 연락처
    	나이			연락처				[확인]
    	[다음]		[다음]
    	
    	
    	1) 쿠키에 값 저장
    	2) 세션
    	3) 파라미터 - input type='hidden'
    	4) DBMS
  		</xmp>
  		
  		<form action="ex03_02.jsp" method="get">
  			name : <input type="text" name="name" value="홍길동"><br>
  			age : <input type="text" name="age" value="20"><br>
  			<input type="submit" value="Next">
  		</form>
  		
	</div>
	
	<script>
	</script>
	
</body>
</html>