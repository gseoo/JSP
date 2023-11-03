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
		
		<a href="/jspPro/days09/replyboard/list.do">목록보기</a>
		
  		<xmp class="code">
    	[ 답변형 게시판 ]
    	로직 이해하기~
    	
    	[DB]
    	글번호		제목				작성자	 ···
    	1		첫번째게시글			홍길동	(새글)
    	2		두번째게시글			서영학(새글)
    	3		세번째게시글			정창기(새글)
    	4		2-1 답글			정창기(답글)
    	5		2-1-1 답글		홍길동(답글)
    	6		네번째게시글			정창기(새글)
    	7		6-1 답글			홍길동(답글)
    	8		2-2 답글			정창기(답글)
    	
    	
    	[화면 출력]
    	ORDER BY 글번호 DESC
    	
    	글번호		제목				작성자	 ···
    	6		네번째게시글			정창기(새글)
    	7		 ㄴ 6-1 답글		홍길동(답글)
    	3		세번째게시글			정창기(새글)
    	2		두번째게시글			서영학(새글)
    	8		 ㄴ 2-2 답글		정창기(답글)
    	4		 ㄴ 2-1 답글		정창기(답글)
    	5		  ㄴ 2-1-1 답글	홍길동(답글)
    	1		첫번째게시글			홍길동(새글)	
    	
    	
    	[해결방안] 컬럼 추가 (3개, 2개)
    	깊이(depth) : 새글, 답글, 답답글, ···
    	 			 0   1     2
    	글 그룹(group==ref) : 
    	그룹 안 순번(step) : 
    	
    	
    	----------------------------------------------------------------------
    	
    	
    	★ 3개 칼럼 추가 ★
    	
    	[DB]
    	----------------------------------------------------------------------
    	글번호		제목				작성자	 ···	그룹(REF)		순서(STEP)	깊이(DEPTH)
    	----------------------------------------------------------------------
    	1		첫번째게시글			홍길동	(새글)	1			1			0
    	2		두번째게시글			서영학(새글)	2			1			0
    	3		세번째게시글			정창기(새글)	3			1			0
    	4		2-1 답글			정창기(답글)	2			4			1
    	5		2-2 답글			홍길동(답글)	2			3			1
    	6		2-3 답글			홍길동(답글)	2			2			1
    	
    	
    	[화면 출력]
    	ORDER BY 그룹 DESC, 순서 ASC
    	----------------------------------------------------------------------
    	글번호		제목				작성자	 ···	그룹(REF)		순서(STEP)	깊이(DEPTH)
    	----------------------------------------------------------------------
    	3		세번째게시글			정창기(새글)	3			1			0
    	2		두번째게시글			서영학(새글)	2			1			0
    	6		 ㄴ 2-3 답글		홍길동(답글)	2			2			1
    	5		 ㄴ 2-2 답글		홍길동(답글)	2			3			1
    	4		 ㄴ 2-1 답글		정창기(답글)	2			4			1
    	1		첫번째게시글			홍길동	(새글)	1			1			0
    	
    	[설명]
    	1. 새글이 작성될 때 : 글번호(PK) -> 글그룹(REF)	순서(1) 		깊이(0)
    	2. 답글이 작성될 때 : 글번호(PK) -> 글그룹(부모REF)	순서(부모+1) 	깊이(부모+1)
    					 **같은 글 그룹 내에서 부모의 순서보다 큰 게시글의 순서 += 1 UPDATE**
    	3. 구현
    	[1] 시퀀스 및 테이블 생성
    	 -  ref, step, depth 컬럼 추가.
 CREATE SEQUENCE SEQ_REPLYBOARD;
 
 CREATE TABLE "SCOTT"."REPLYBOARD" 
   (   
    "NUM" NUMBER NOT NULL ENABLE,     -- 글번호
   "WRITER" VARCHAR2(12 BYTE) NOT NULL ENABLE,  --작성자 
   "EMAIL" VARCHAR2(30 BYTE) NOT NULL ENABLE,   --이메일
   "SUBJECT" VARCHAR2(50 BYTE) NOT NULL ENABLE,  --제목
   "PASS" VARCHAR2(10 BYTE) NOT NULL ENABLE,  --비밀번호
   "READCOUNT" NUMBER(5,0) DEFAULT 0 NOT NULL ENABLE,  --조회수 
   "REGDATE" DATE DEFAULT sysdate NOT NULL ENABLE,   --작성일
   "CONTENT" CLOB NOT NULL ENABLE,  --글내용
   "IP" VARCHAR2(20 BYTE) NOT NULL ENABLE, --IP주소 
   
   "REF" NUMBER(5,0) DEFAULT 0 NOT NULL ENABLE,  --그룹 
   "STEP" NUMBER(3,0) DEFAULT 1 NOT NULL ENABLE,  --순번
   "DEPTH" NUMBER(3,0) DEFAULT 0 NOT NULL ENABLE,  --깊이
   
  PRIMARY KEY ("NUM")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" 
 LOB ("CONTENT") STORE AS BASICFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  NOCACHE LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  ) ;
    	
    	 [2]  패키지 추가
          days09.replyboard.command		- 핸들러
          days09.replyboard.controller 	- 컨트롤러
          days09.replyboard.domain 		- DTO
          days09.replyboard.persistence	- DAO  
          days09.replyboard.service		- 서비스  
          
		[3] MVC 패턴 - 컨트롤러 추가
		 1) days09/replyboard 폴더 안에 commandHandler.properties 복붙
		 2) DispatcherServlet.java
		 3) web.xml
		 
		[4] ReplyBoardDTO
		    IReplyBoard
		    ReplyBoardDAO
		      ㄴ selectList() 구현
		      
		[5] CommandHandler 
		    ListHandler.java
		 
		 
		 
  		</xmp>
	</div>
	
	<script>
	</script>
	
</body>
</html>