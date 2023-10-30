<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    	1. Servlet - 자바 웹 기술
    	
    	2. 서블릿 구현 방법(과정)
    		(1) 서블릿 규약을 따르는 자바 클래스 선언
    			ㄱ. 접근지정자 public
    			ㄴ. javax.servlet.http.HttpServlet 클래스 상속
    			ㄷ. service(), get(), post() 메소드 오버라이딩
    		(2) 컴파일 -> ???.class(클래스 파일)
    		(3) /WEB-INF/classes 폴더 안에 반드시 클래스 파일을 넣어준다.
    		(4) 요청 URL을 정하고 URL 매핑
    			ㄱ. web.xml 파일에 서블릿 등록/ url 매핑
    			ㄴ. 서블릿 3.0 ~ @webServlet 어노테이션으로 처리
    		(5) 브라우저 -> 요청 URL -> 서블릿 -> 응답
    		
    	3. 실습 예제
    		1) 서블릿 클래스 선언 - days01.Now.java
    		2) url 패턴 설정 방법
    		<url-pattern>/jspPro/days01/now.html</url-pattern>
    		   ㄱ. /   MVC 패턴으로 처리할 때
    		   ㄴ. *.확장자
    		   ㄷ. /경로명/경로명/.../*
    		   ㄹ. 정확한 url 패턴 경로 지정
    		
  		</xmp>
  		
  		<a href="/jspPro/days01/now.html">Now.java 서블릿 요청</a>
  		<br>
  		<a href="/jspPro/days01/now">Now 서블릿 요청</a>
  		<br>
  		<a href="/jspPro/days01/now.ss">Now.ss 서블릿 요청</a>
  		
	</div>
	
	<script>
	</script>
	
</body>
</html>