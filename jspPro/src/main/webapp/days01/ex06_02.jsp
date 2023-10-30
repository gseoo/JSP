<%@page import="java.util.Iterator"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.util.ArrayList"%>
<%@page import="domain.DeptVO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	Connection conn = DBConn.getConnection();
	
	// 3. 작업자(Statement) + SELECT
	PreparedStatement pstmt = null;
	String sql = "SELECT deptno, dname, loc FROM dept";
	ResultSet rs = null;
	
	int deptno = 0;
	String dname = null;
	String loc = null;
	DeptVO vo = null;
	ArrayList<DeptVO> list = null;
	try {
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();

		if(rs.next()) {
			list = new ArrayList<>();
			do {
				deptno = rs.getInt("deptno");
				dname = rs.getString("dname");
				loc = rs.getString("loc");
				
				vo = new DeptVO(deptno, dname, loc);
				list.add(vo);
			} while(rs.next());
		}
		
	} catch (SQLException e) {
		e.printStackTrace();
	} finally {
		try {
			pstmt.close();
			rs.close();
			DBConn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	System.out.println("END");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<link rel="shortcut icon" href="http://localhost/jspPro/images/SiSt.ico">
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script> -->
<link rel="stylesheet" href="/jspPro/resources/cdn-main/example.css">
<script src="/jspPro/resources/cdn-main/example.js"></script>
 
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<style>
	span.material-symbols-outlined{
		vertical-align: text-bottom;
 	}
</style>
<script>
	$( function() {
		$( "input" ).checkboxradio();
		$( "fieldset" ).controlgroup();
	} );
</script>
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
		    
		<div class="widget">
		  <h1>Checkbox and radio button widgets</h1>
		 
		  <h2>Radio Group</h2>
		  <fieldset>
		    <legend>Select a Location: </legend>
		    <!-- 
		    <label for="radio-1">New York</label>
		    <input type="radio" name="radio-1" id="radio-1">
		    <label for="radio-2">Paris</label>
		    <input type="radio" name="radio-1" id="radio-2">
		    <label for="radio-3">London</label>
		    <input type="radio" name="radio-1" id="radio-3">
		     -->
		     
		     <%
			    Iterator<DeptVO> ir = list.iterator();
				while (ir.hasNext()) {
					vo = ir.next();
			%>
			<label for="<%=vo.getDeptno()%>"><%=vo.getDname()%></label>
		    <input type="radio" name="deptno" id="<%=vo.getDeptno()%>">
		    <%
				}
		    %>
		    
		  </fieldset>
		</div>
  		
	</div>
	
	<script>
	</script>
	
</body>
</html>