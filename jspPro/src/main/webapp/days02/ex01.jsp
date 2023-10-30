<%@page import="java.sql.SQLException"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="domain.DeptVO"%>
<%@page import="domain.EmpVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% 
Connection conn = DBConn.getConnection();

PreparedStatement pstmt = null;
ResultSet rs = null;
String sql = "SELECT deptno,dname,loc FROM dept";

int deptno = 0;
String dname = null; 
String loc = null;

DeptVO dvo = null;
ArrayList<DeptVO> dlist = null;

try {
   pstmt = conn.prepareStatement(sql);
   rs = pstmt.executeQuery();

   if ( rs.next() ) {
      dlist = new ArrayList<DeptVO>();
      do {
         deptno = rs.getInt("deptno"); //== rs.getInt(1);
         dname = rs.getString("dname");//== rs.getString(2);
         loc = rs.getString(3); //== rs.getString("loc");

         dvo = new DeptVO(deptno, dname, loc);
         dlist.add(dvo);
      } while (rs.next());
   }
} catch (SQLException e) {
   e.printStackTrace();
} finally {
   try {
// 4 close
      rs.close();
      pstmt.close();
   } catch (SQLException e) {
      e.printStackTrace();
   }
}
%>
<%

String pDeptno = request.getParameter("deptno");

if ( pDeptno == null || pDeptno.equals("" )) pDeptno = "10";

deptno = Integer.parseInt(pDeptno);

sql = String.format("SELECT empno, ename, job, mgr, TO_CHAR(hiredate, 'yyyy-MM-dd') hiredate, sal, comm, deptno "
							+ "FROM emp "
							+ "WHERE deptno =? ");

 int empno;
 String ename;
 String job;
 int mgr;
 String hiredate; 
 double sal;
 double comm;
 EmpVO evo = null;
 ArrayList<EmpVO> elist = null;

try {
   pstmt = conn.prepareStatement(sql);
   pstmt.setInt(1, deptno);
   rs = pstmt.executeQuery();
   
   if (rs.next()) {
      
      elist = new ArrayList<EmpVO>();
      
      do {
           empno = rs.getInt("empno");
           ename = rs.getString("ename");
           job = rs.getString("job"); 
           mgr = rs.getInt("mgr");
           hiredate = rs.getString("hiredate"); 
           sal = rs.getDouble("sal");
           comm = rs.getDouble("comm");
          
           evo = new EmpVO(empno, ename, job, mgr, hiredate, sal, comm,deptno);
           
           elist.add(evo);
           
      } while (rs.next() );
      
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
  <span class="material-symbols-outlined">view_list</span> ex01 test
</h3>
<div>
  <xmp class="code">
  
  </xmp> 
   <select name="deptno" id="deptno">
    <%
	Iterator<DeptVO> ir = dlist.iterator();
	while (ir.hasNext()) {
		dvo = ir.next();
	%>
	<option value="<%=dvo.getDeptno()%>"data-loc="<%=dvo.getLoc()%>"><%= dvo.getDname() %></option><%	
	} // while
    %>
    
  </select>
  <br>
  <br>
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
  	 <%
  	   if(elist == null){
  		 %>
  		 <tr>
  		 	<td colspan="9">사원 존재 X</td>
  		 </tr>
  		 <%
  	   }else{
  		 Iterator<EmpVO> eir = elist.iterator();
  		 while( ir.hasNext() ){
  			 evo = eir.next();
  		%>
  		<tr>
  		<td><<input type="checkbox" data-empno="<%= evo.getEmpno() %>" value="<%= evo.getEmpno() %>"></td>
  		<td><%= evo.getEmpno() %></td>
        <td><%= evo.getEname() %></td>
        <td><%= evo.getJob() %></td>
        <td><%= evo.getMgr() %></td>
        <%-- <td><%= evo.getHiredate() %></td> --%>
        <td><%= evo.getHiredate().replace("00:00:00", "") %></td>
        <td><%= evo.getSal() %></td>
        <td><%= evo.getComm() %></td>
        <td><%= evo.getDeptno() %></td>
  		</tr>
  		<%
  		 }// while
  	   } //if
  	 %>
  	</tbody>
  	<tfoot>
  		<tr>
  			<td colspan="9">
  				<span class="badge left red"><%= elist==null? 0 : elist.size() %> 명.</span>
  			    <a href="javascript:history.back()">뒤로가기</a>
  			    <button>선택한 empno 확인</button>
  			</td>
  		</tr>
  	</tfoot>
  </table>
</div>

<script>
// 부서 검색할때마다 부서에 정보 출력
   $(function (){
	   $("#deptno").change(function(event) {
		 let deptno = $(this).val();
		 let url =  `http://localhost/jspPro/days02/ex01.jsp?deptno=\${deptno}`;
		 location.href = url;
	   });
	   
	   //
	   
	   <%-- 방법
	   let deptno = '${param.deptno}';
	   if (!deptno)deptno = '10';
	   $("#demo").val(<%= pDeptno %>); 
	  --%>
	   
	   //방법
	   /* $("#deptno").val('${ param.deptno }'); */
	   $("#deptno").val(<%= pDeptno %>);
   });
</script>
<script>
$("#ckbAll").on("click", function (event){  
    $("table tbody tr")
              .find("td:first-child :checkbox")
              .prop("checked", $(this).prop("checked"));
 });

// 각 사원 체크박스를 체크할 때 모두 선택 체크 처리

/*
$(":checkbox.all").click(function(event) {
         $(":checkbox:not(.all)").prop("checked", $(this).prop("checked"));

      })
      $(":checkbox:not(.all)").click(function(event) {
         let count = $(":checkbox:not(.all)").length;
         let checkedCount = $(":checkbox:not(.all):checked").length;
         $(":checkbox.all").prop("checked", count == checkedCount );
      });
*/

$("table tbody tr")
	.find("td.first-child:checkbox").on("click", function () {
		let ckb = $("tbody :checkbox").length == $("tbody :checkbox:checked").length;
			$("#ckbAll").prop("checked",ck);
	});	


/* 
 // 풀이 1
$("tfoot button").on("click", function (event) {
		
   let empnos = [];
   // 체크된 체크박스
   $("body :checkbox:checked").each(function (i, element) {
	   
	   // 돔 탐색
	   // empno = element.parentElement.nextElementSibling.innerText;
	   
	// data-emono="7569"   
	let empno = $(element).data("empno");
	empnos.push(empno);
	});
   
   location.href = "ex01_ok.jsp?empnos=" + empnos.join("/");
});
*/


// 풀이 2
$("tfoot button").on("click", function (event) {
	
		// ex01.ok.jsp?empno=1111&empno=2222&empno=3333
	
	   let empnos = [];
	   $("body :checkbox:checked").each(function (i, element) { 
		   
		let empno = $(element).data("empno");
		empnos.push(empno);
		});
	   
	   location.href = "ex01_ok_02.jsp?empno=" + empnos.join("&empno="); 
	});
</script>
</body>
</html>


