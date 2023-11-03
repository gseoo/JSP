<%@page import="java.util.Date"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<link rel="shortcut icon" href="http://localhost/webPro/images/SiSt.ico">
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
  <h1 class="main"><a href="#" style="position: absolute;top:30px;">shy Home</a></h1>
  <ul>
    <li><a href="#">로그인</a></li>
    <li><a href="#">회원가입</a></li>
  </ul>
</header>
<h3>
  <span class="material-symbols-outlined">view_list</span>JSP days07
</h3>
<div>
  <xmp class="code">
  [ex05.jsp]
  
  js로 ajax처리해서 ex05_ajax_info.txt 파일을 읽어옴
  </xmp>
  
  서버 요청 시간 : <%= new Date().toLocaleString() %>
  <br>
  
  <input type="button" value="js ajax" onclick="load('ex05_ajax_info.txt');">
  <br>
  
  <p id="demo"></p>
  
</div>

<script>
  let httpRequest; //XMLHttpRequest 심부름꾼 객체
  
  function getXMLHttpRequest() { //브라우저에 상관없이 비동기 객체를 얻어옴
	  if( window.ActiveXObject ){   // IE
          try{
             return new ActiveXObject("Msxml2.XMLHTTP");   // 
          }catch(e){
             try{
               return new ActiveXObject("Microsoft.XMLHTTP");
             }catch(e){
                return null;
             }
          }
    }else if( window.XMLHttpRequest ){
           return new XMLHttpRequest();
    }else{
       return null;
    }
  }
  
  
  function load(url) {
	 
	 //1. XMLHttpRequest 심부름꾼 객체 얻어오기
	   httpRequest = getXMLHttpRequest();
	 //2. 
       httpRequest.onreadystatechange = callback;
	 
	 //3. open() 요청에 필요한 모든 설정
	   httpRequest.open("GET", url, true);
	 
	 //4. send() 요청 명령어 수행
	   httpRequest.send();
  }
  
  function callback() {
	  if (httpRequest.readyState == 4) { //서버에 요청 완료
		if (httpRequest.status == 200) { //응답 성공
			var rtext = httpRequest.responseText;
		    let names = rtext.split(",");
		    for ( let name of names) {
				$("#demo")
				   .append(
						   $("<li></li>").text(name)
						   );
			}
		}
	}
	  
	}
</script>
</body>
</html>









