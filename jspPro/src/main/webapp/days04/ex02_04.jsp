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
  <span class="material-symbols-outlined">view_list</span> jsp days04 - ex02_04
</h3>
<div>
  <xmp class="code">
  
  포워딩
  request.setAttiribute("list", list);
  
  session scope : 한 사용자 접속해 있는 동안 저장할 값이 있다면..
  				  인증 + 권한처리, 장바구니 등등 
  				  (로그인)
  			
  application scope : 모든 사용자가 공유할 값
  </xmp> 
  
  > pageContext name : <%=pageContext.getAttribute("name") %><br>
  > request age      : <%=request.getAttribute("age") %><br>
  > session addr     : <%=session.getAttribute("addr") %><br>
  > application tel  : <%=application.getAttribute("tel") %><br>
  
  <br>
  <a href="ex02_04.jsp">ex02_04.jsp</a>
</div>

<script>
	
</script>
</body>
</html>