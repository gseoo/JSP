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
		jsp 스크립트 요소 : [스크립트릿], 표현식, 선언문
		
		1+2+3+4+5+6+7+8+9+10=55
		스크립트릿 : 자바코딩(for)
		표현식	   : 출력
		
		JSP 내장 객체(11가지) : out (출력 담당)
  		</xmp>
  		
  		<p id="demo">
  			<%-- [풀이 1]
  			<%
  				int sum = 0;
  				for(int i=1; i<=10; i++) {
  					//System.out.printf("%d+", i);
  					out.print(i + "+");
  					sum += i;
  				}
  				//System.out.printf("=%d", sum);
  				out.println("=" + sum);
  			%>
  			 --%>
  		</p>
	</div>
	
	<script>
	</script>
	
</body>
</html>