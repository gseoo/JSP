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
    	[ JS 쿠키 ] - document.cookie 속성
    	[ JSP 쿠키]
    	
    	- 쿠키 : 클라이언트(브라우저)에 텍스트 형식으로 저장된 파일
    	- 클라이언트 -> 요청 -> 서버 (쿠키와 함께 서버에 전송)
    	- 상태 관리
    	
    	- [ JSP 쿠키 생성 + 처리 과정 이해]
    	   1) 클라이언트 -> 요청(쿠키) -> 서버
    	                           쿠키 생성
    	             <- 응답
    	      [클]
    	      X 쿠키 저장
    	      [클] -> 요청(X 쿠키) -> [서] X 쿠키
    	      					  X 쿠키 삭제
    	      	  <- 응답
    	      [클]
    	      X 쿠키 삭제, 수정
    	  
    	- JSP 쿠키
    	  1) Cookie 클래스 -> 쿠키 생성
    	  2) 응답 (클)
    	     reponse.addCookie(생성된 쿠키)
    	
    	- 쿠키 구성
    	  1) "쿠키이름=쿠키값; 만료시점=X; 도메인=localhost; 경로=/; 보안"
    	     만료시점= -1 	브라우저 닫을 때 자동으로 쿠키 제거
    	            0	쿠키 제거
    	            별도의 만료시점을 설정하지 않으면 브라우저가 종료될 때 쿠키 제거
  		</xmp>
  		
  		<a href="ex06_02.jsp">ex06_02.jsp 쿠키 생성</a><br>
  		<a href="ex06_03.jsp">ex06_03.jsp 쿠키 확인</a>
  		
	</div>
	
	<script>
	</script>
	
</body>
</html>