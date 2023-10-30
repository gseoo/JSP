<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String contextPath = request.getContextPath();
%>
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
  		
  		<form action="<%=contextPath%>/days03/empsearch.htm">
  			<fieldset>
  				<legend>부서 선택</legend>
				<!--   			
				<input type="checkbox" name="deptno" value="10">ACCOUNTING
			  	<input type="checkbox" name="deptno" value="20">RESEARCH
			  	<input type="checkbox" name="deptno" value="30">SALES
			  	<input type="checkbox" name="deptno" value="40">OPERATIONS 
			  	-->
			  	<c:forEach items="${dlist}" var="vo">
			  		<input type="checkbox" name="deptno" value="${ vo.deptno }">${ vo.dname}
			  	</c:forEach>
  			</fieldset>
  			<fieldset>
  				<legend>직업(job) 선택</legend>
				<!-- 		
				<input type="checkbox" name="job" value="ANALYST">ANALYST
				<input type="checkbox" name="job" value="CLERK">CLERK
				<input type="checkbox" name="job" value="MANAGER">MANAGER
				<input type="checkbox" name="job" value="PRESIDENT">PRESIDENT
				<input type="checkbox" name="job" value="SALESMAN">SALESMAN
				-->
				<c:forEach items="${jlist}" var="job">
			  		<input type="checkbox" name="job" value="${job}">${job}
			  	</c:forEach>
  			</fieldset>
  			
  			<input type="submit" value="search">
  			<input type="button" value="emp delete">
  		</form>
  		
  		<div>
  			<h3>emp search list</h3>
			<table>
			  	<thead>
			  		<tr>
				  		<td><input type="checkbox"  id="ckbAll" name="ckbAll"></td>
				  		<td>empno</td>
				        <td>ename</td>
				        <td>job</td>
				        <td>mgr</td>
				        <td>hiredate</td>
				        <td>sal</td>
				        <td>comm</td>
				        <td>deptno</td>
			  		</tr>
			  	</thead>
			  	<tbody>
	  				<c:choose>
	  					<c:when test="${empty elist}">
	  						<tr>
					  		 	<td colspan="9">사원 존재 X</td>
					  		</tr>
	  					</c:when>
	  					<c:otherwise>
	  						<c:forEach items="${elist}" var="evo">
								<tr>
						  		<td><input type="checkbox" data-empno="${evo.empno}" value="${evo.empno}"></td>
						  		<td>${evo.empno}</td>
						        <td>${evo.ename}</td>
						        <td>${evo.job}</td>
						        <td>${evo.mgr}</td>
						        <td>${evo.hiredate}</td>
						        <td>${evo.sal}</td>
						        <td>${evo.comm}</td>
						        <td>${evo.deptno}</td>
						  		</tr>
	  						</c:forEach>
	  					</c:otherwise>
	  				</c:choose>
			  	</tbody>
			  	<tfoot>
			  		<tr>
			  			<td colspan="9">
			  				<span class="badge left red">3명.</span>
			  			    <a href="#">뒤로 가기</a>
			  			</td>
			  		</tr>
			  	</tfoot>
			  </table>
  		</div>
  		
	</div>
	
	<script>
		let url = location.href;
		//alert(url); // http://localhost/jspPro/days03/empsearch.htm
		$(":checkbox[name=deptno]").each(function(i, element) {
			if(url.indexOf(`deptno=\${element.value}`) != -1) $(element).prop("checked", true);
		});
		
		$(":checkbox[name=job]").each(function(i, element) {
			if(url.indexOf(`job=\${element.value}`) != -1) $(element).prop("checked", true);
		});
	</script>
	
</body>
</html>