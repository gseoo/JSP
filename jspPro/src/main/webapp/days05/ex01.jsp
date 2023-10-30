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
  	1. try ~ catch ~ finally
  	
  	2. 예외 처리하는 예외 페이지를 지정
  		ㄴ /WEB-INF 폴더 안에 지정
  			ㄴ error 폴더
  				ㄴ viewErrorMessage.jsp
  	
  	3. WEB-INF 폴더 안에 설정파일 - web.xml
  	   1) 응답 상태 코드별로 예외 페이지 지정
  	      (HTTP 상태 404)
  	      ㄴ a href="ex1000.jsp"
  	      ㄴ web.xml 404 -> 404.jsp 설정 코딩 추가
  	      
  	      [응답 상태 코드]
  	      404 : 요청 url을 처리하기 위한 자원이 존재하지 않음
  	      500 : 서버 내부 에러 발생 (자바 코딩 틀림)
  	      200 : 요청을 정상적으로 처리
  	      401 : 접근을 허용하지 않음
  	      400 : 클라이언트의 요청이 잘못된 구문으로 구성
  	      403 : PUT 요청 X
  	      etc
  	   
  	   2) 예외 타입별로 예외 페이지 지정
  	      [예외 타입별]
  	      NullPointException
  	      ~Exception
  	
	4. 예외 처리의 우선순위
	1) page 지시자의 errorPage 속성으로 지정한 에러페이지 처리
	2) 예외 타입별 처리 - web.xml
	3) 예외 코듭ㄹ 처리 - web.xml
	4) 웹컨테이너가 제공하는 기본 에러 페이지
  </xmp> 
  
  <%
  	String name = null;
  	try {
  		name = request.getParameter("name");
  	  	name = name.toUpperCase();
  	} catch(NullPointerException e) {
  		name = "익명";
  	} catch(Exception e) {
  		
  	}
  	
  %>
  
  name 파라미터값 : <%=name %><br>
  
  <a href="ex1000.jsp">ex1000.jsp</a>
  
</div>

<script>
	
</script>
</body>
</html>