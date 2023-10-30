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
    	
  		</xmp>
  		
  		<xmp>
  		1. JSP/Servlet : Java의 웹기술
  			ㄱ. Servlet 
  			ㄴ. JSP 
  		
  		2. 웹 프로그래밍
  			웹서버   <-요청(request)-    클라이언트
  			      -응답(response)->
  			  	   전송 데이터를 생성해주는 프로그램
  			  	   
  		3. JSP = Java Server Page
  				자바 언어 + 서버에서 실행되는 페이지
  				
  		4. 처리과정
  			클라이언트			  웹서버        WAS(웹 어플리케이션 서버)
  			(브라우저)  - 요청 -> (아파치)  ->  [톰캣], 웹로직, 제티, JBoss 등
  										 [톰캣 (웹)컨테이너]
  			ex01.jsp				 ->  서블릿 클래스 변환
  										 서블릿 객체 생성
					<- 응답 -
		
		5. 톰캣(WAS) = 자바 코딩 컴파일, 실행 (javac.exe, java.exe - JAVA_HOME 환경설정 필수)
		
		6. WAS(톰캣 8.5)
		   JSP 2.3
		   Servlet 4.0
		   EL 3.0
		
		7. ex01.html	정적 자원
		   ex01.jsp		동적 자원
  		</xmp>
  		
  		<xmp>
  		[2주 JSP 수업 내용]
  		1. JSP 페이지의 구성요소
  		2. JSP 지시자 - page, include, taglib
  		3. JSP 스크립트 - 스크립트릿, 표현식, 선언문
  		4. JSP 처리 과정
  		5. 웹 어플리케이션 배포
  		6. 페이지 모듈화
  		7. 자바빈(java bean)과 액션태그
  		8. JSP 쿠키, 세션 - 상태 관리
  		9. EL 3.0 (표현언어)
  		   Expression Language
  		10. JSTL (표준 태그 라이브러리)
  		11. 커넥션풀(Connection Pool)
  		12. Servlet
  		13. MVC 패턴
  		14. 필터(Filter)
  		15. ServletContextListener 구현
  		16. 실습 예제 - 방명록, 게시판, 답변형 게시판, 파일 첨부 게시판(자료실), 회원가입 + 인증처리 etc
  		</xmp>
	</div>
	
	<script>
	</script>
	
</body>
</html>