<%@page import="java.sql.SQLException"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="domain.DeptVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.getAttribute("list");
ArrayList<DeptVO> list = (ArrayList<DeptVO>)request.getAttribute("list");
%>
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
  <h1 class="main"><a href="#" style="position: absolute;top:30px;">GyeongSeo Home</a></h1>
  <ul>
    <li><a href="#">로그인</a></li>
    <li><a href="#">회원가입</a></li>
  </ul>
</header>
<h3>
  <span class="material-symbols-outlined">view_list</span> jsp days00 - ex00
</h3>
<div>

  <xmp class="code">
  
  </xmp> 
   <select name="deptno" id="deptno">
    <option>선택하세요.</option> 
    <%
    DeptVO vo = null;
	Iterator<DeptVO> ir = list.iterator();
	while (ir.hasNext()) {
		vo = ir.next();
	%><option value="<%=vo.getDeptno()%>"><%= vo.getDname() %></option><%	
	} // while
    %>
    
  </select>
</div>

<script>
	$("#deptno")
		.wrap("<form></form>")
		.change(function(event) {
			$(this)
				.parent()
					.attr({
						method:"get"
						,action:"/jspPro/scott/emp"
					})
					.submit();
		});
	// http://localhost/jspPro/scott/emp?deptno=40
		/* 서블릿 추가 days02.ScottEmp.java      days01.ex06.emp.jsp*/
		/* ex13_emp.jsp */
</script>
</body>
</html>