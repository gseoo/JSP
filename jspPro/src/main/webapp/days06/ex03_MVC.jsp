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
		
		<a href="/jspPro/board/list.do">/board/list.do</a><br>
		<a href="/jspPro/board/write.do">/board/write.do</a><br>
		
		<xmp class="code">
		1. days05/ex05_02.jsp 회원가입 페이지로 사용 -> member 테이블 생성
		2. days06/ex01_default.jsp 로그인 페이지로 사용
		3. 로그인 시, header에 로그인 태그 x -> "ㅇㅇㅇ"님 환영합니다! + 로그아웃 태그
		   로그아웃 버튼 누르면 세션 종료
		4. 글쓰기 버튼은 로그인을 해야지만 사용할 수 있도록 처리
		5. 게시글 상세보기에서 수정하기, 삭제하기는 로그인한 사람이 작성자일 경우에만 사용할 수 있도록 세션 처리
		
		</xmp>
		
  		<xmp class="code">
    	[ 모델2구조의 MVC 패턴 ]
    	- 자바 개발자라면 반드시 습득해야 할 기본 기법
    	
    	[ 모델1구조와 모델2구조 이해 ]
    	- JSP 웹 애플리케이션의 구조 : 모델1구조와 모델2구조(MVC)로 나뉨
    	1) 모델1구조
    	   [ㅣlist.jsp] -> 요청 -> list.jsp
    	               <- 응답 <-
    	
    	2) 모델2구조
    	   [list.jsp] -> 요청 -> 서블릿 응답결과물 생성
    	                    -> 출력 담당 list.jsp
    	              <- 응답 <-
    	              
    	[ MVC 패턴 ]
    	모델 : 비즈니스 영역(로직 처리)
    	뷰 : 프리젠테이션 영역(화면 담당)
    	컨트롤러 : 요청->응답 컨트롤 담당
    	
    	[ MVC 패턴의 처리 과정 ]
    	A[write.htm] -> 요청									  핸들러 -> 서비스 호출 -> DAO -> DB
    														  커맨드
    	B[list.htm] -> 요청   -> [컨트롤러(C)]  ->  요청 로직 처리  -> 모델(M)
    	C[logon.htm] -> 요청      요청 분석						  
    														결과물(모델) -> 뷰
    														출력담당 파악
    				<- 응답 <-
    	
    	[실습]
    	1. 게시판 : days04.board 폴더
    		ㄴ delete.jsp
    		ㄴ edit.jsp
    		ㄴ list.jsp
    		ㄴ view.jsp
    		ㄴ write.jsp
    	
    	2. days04.board 패키지 : 서블릿
    	   days04.board.domain 패키지 : VO, DTO
    	   days04.board.persistence 패키지 : DAO
    	   
    	
    	위의 실습을 MVC 패턴으로 수정
    	1) 모든 요청은 컨트롤러(하나의 서블릿)에서 요청을 받을 것
    	
    	2) list.htm, write.htm, delete.htm 모든 요청 -> 하나의 서블릿 처리
    	   url-pattern ?		/		서블릿
    	   url-pattern ?	*.do		서블릿 *사용*
    	   list.do, write.do, edit.do, delete.do
    	   
    	3) 컨트롤러(하나의 서블릿) 이름 : DispatcherServlet.java
    		(1) 모든 요청 -> 모델(핸들러) 처리 파악(매핑)
    			파일 선언 - commandHandler.properties
    			요청 url    처리모델 매핑
    			list.do -> ListHandler
    			write.do -> WriteHandler ···
    		(2) 결과물 저장
    		(3) 리다이렉트, 포워딩 결정
    	
    	4) 모델(커맨드 핸들러)
    		인터페이스	CommandHandler
    		ListHandler im CommandHandler
    		WriteHandler im CommandHandler
    		...
    		
    	5) DAO, DTO 복사 사용
    	
    	6) service 패키지 추가
    	
    	7) JSP 페이지 복사 사용
  		</xmp>
	</div>
	
	<script>
	</script>
	
</body>
</html>