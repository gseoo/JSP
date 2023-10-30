<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.util.ArrayList"%>
<%@page import="domain.EmpVO"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	Connection conn = null;
	
	String pDeptno = request.getParameter("deptno");
	if(pDeptno == null || pDeptno.equals("")) pDeptno = "10";
	
	int deptno = Integer.parseInt(pDeptno);
	
	String sql = "SELECT empno, ename, job, mgr, TO_CHAR(hiredate, 'YYYY-MM-DD') hiredate, sal, comm FROM emp WHERE deptno = ?";
	
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	 int empno;
	 String ename;
	 String job;
	 int mgr;
	 String hiredate; 
	 double sal;
	 double comm;
	 
	 EmpVO vo = null;
	 ArrayList<EmpVO> list = null;
	 
	conn = DBConn.getConnection();
	
	try {
	   pstmt = conn.prepareStatement(sql);
	   pstmt.setInt(1, deptno);
	   rs = pstmt.executeQuery();
	   
	   if (rs.next()) {
	      
	      list = new ArrayList<EmpVO>();
	      
	      do {
	           empno = rs.getInt("empno");
	           ename = rs.getString("ename");
	           job = rs.getString("job"); 
	           mgr = rs.getInt("mgr");
	           hiredate = rs.getString("hiredate"); 
	           sal = rs.getDouble("sal");
	           comm = rs.getDouble("comm");
	          
	           vo = new EmpVO(empno, ename, job, mgr, hiredate, sal, comm,deptno);
	           list.add(vo);
	           
	      } while (rs.next());
	      
	   }
	   
	} catch (SQLException e) {
	   e.printStackTrace();
	}finally {
	   try {
	      pstmt.close();
	      rs.close();
	      DBConn.close();
	   } catch (SQLException e) {
	      e.printStackTrace();
	   }
	}
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
  		
  		<h2>emp list</h2>
  		<table>
  			<thead>
  				<tr>
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
  				<%
  					if(list == null) {
  				%>
  				<tr>
  					<td colspan="8">사원 존재 X</td>
  				</tr>
  				<%
  					} else {
  						Iterator<EmpVO> ir = list.iterator();
  						while(ir.hasNext()) {
  							vo = ir.next();
  				%>
  				<tr>
					<td><%= vo.getEmpno() %></td>
					<td><%= vo.getEname() %></td>
					<td><%= vo.getJob() %></td>
					<td><%= vo.getMgr() %></td>
					<td><%= vo.getHiredate() %></td>
					<td><%= vo.getSal() %></td>
					<td><%= vo.getComm() %></td>
					<td><%= vo.getDeptno() %></td>
  				</tr>
  				<%
  						}
  					}
  				%>
  			</tbody>
  			<tfoot>
  				<tr>
  					<td colspan="8">
  						<%= list == null ? 0 : list.size() %> 명.
						<a href="javascript:history.back()">뒤로가기</a>	
  					</td>
  				</tr>
  			</tfoot>
  		</table>
  		
	</div>
	
	<script>
	</script>
	
</body>
</html>