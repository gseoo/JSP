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
    	
  		</xmp>
  		
  		<button onclick="getPersonJson()">로컬 저장소의 personjson 사용</button>
  		<p id="demo"></p>
  		
	</div>
	
	<script>
		//  1. js Object 만들기
		var person = {
				name:"john"
				, age:20
				, city:"seoul"
		};
		
		// 2. person js Object -> json 변환
		let personJson = JSON.stringify(person);
		//console.log("personJson", personJson);
		
		// 3. 로컬 저장소 personJson 저장
		localStorage.setItem("personJson", personJson);
	</script>
	
	<script>
		function getPersonJson() {
			let personJson = localStorage.getItem("personJson");
			// json -> js Object로 변환 : JSON.parse()
			let person = JSON.parse(personJson);
			
			$("#demo").html(person.name + " / " + person.age);
			
			//localStorage.removeItem("personJson");
			//localStorage.clear();
		}
	</script>
	
</body>
</html>