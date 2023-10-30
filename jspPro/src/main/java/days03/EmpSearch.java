package days03;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.DBConn;

import domain.DeptVO;
import domain.EmpVO;

/**
 * Servlet implementation class EmpSearch
 */
@WebServlet("/days03/empsearch.htm")
public class EmpSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public EmpSearch() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn = DBConn.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT deptno,dname,loc FROM dept";

		int deptno = 0;
		String dname = null; 
		String loc = null;
		DeptVO vo = null;
		ArrayList<DeptVO> dlist = null;

		try {
		   pstmt = conn.prepareStatement(sql);
		   rs = pstmt.executeQuery();

		   if ( rs.next() ) {
			   dlist = new ArrayList<DeptVO>();
		      do {
		         deptno = rs.getInt("deptno"); 
		         dname = rs.getString("dname");
		         loc = rs.getString(3);

		         vo = new DeptVO(deptno, dname, loc);
		         dlist.add(vo);
		      } while (rs.next());
		   }
		} catch (SQLException e) {
		   e.printStackTrace();
		} finally {
		   try {
		      rs.close();
		      pstmt.close();
		      //DBConn.close();
		      System.out.println("end");
		   } catch (SQLException e) {
		      e.printStackTrace();
		   }
		}
		
		// 2. job 
		sql = "SELECT Distinct job FROM emp ORDER BY job";

		ArrayList<String> jlist = null;

		try {
		   pstmt = conn.prepareStatement(sql);
		   rs = pstmt.executeQuery();

		   String job;
		   if ( rs.next() ) {
			   jlist = new ArrayList<>();
		      do {
		         job = rs.getString("job");
		         jlist.add(job);
		      } while (rs.next());
		   }
		} catch (SQLException e) {
		   e.printStackTrace();
		} finally {
		   try {
		      rs.close();
		      pstmt.close();
		      //DBConn.close();
		      System.out.println("end");
		   } catch (SQLException e) {
		      e.printStackTrace();
		   }
		}
		
		// 3. 사원 정보 조회
		//http://localhost/jspPro/days03/empsearch.htm
		//?
		//deptno=10&deptno=30
		//&
		//job=CLERK&job=MANAGER
		
		String pdeptno = null;
		String pjob = null;
		
		try {
			String pdeptnos[] = request.getParameterValues("deptno");
			if(pdeptnos != null) pdeptno = String.join(", ", pdeptnos);
			
			String pjobs[] = request.getParameterValues("job");
			if(pjobs != null) pjob = String.format("'%s'", String.join("', '", pjobs));
		} catch (Exception e) {
			System.out.println("> EmpSearch.java doGet() 3. 사원 정보 조회");
			e.printStackTrace();
		}
			
		sql = "SELECT empno, ename, job, mgr, TO_CHAR(hiredate, 'yyyy-MM-dd') hiredate, sal, comm, deptno "
				+ "FROM emp ";
		// WHERE 조건절 추가
		if(pdeptno != null) sql += String.format(" WHERE deptno IN (%s) ", pdeptno);
		if(pjob != null) {
			sql += pdeptno != null ? " AND " : " WHERE ";
			sql += String.format(" job IN (%s) ", pjob);
		}
		sql += " ORDER BY deptno";
		
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
		   rs = pstmt.executeQuery();
		   
		   if ( rs.next() ) {
			   elist = new ArrayList<>();
		      do {
		    	empno = rs.getInt("empno");
				ename = rs.getString("ename");
				job = rs.getString("job"); 
				mgr = rs.getInt("mgr");
				hiredate = rs.getString("hiredate"); 
				sal = rs.getDouble("sal");
				comm = rs.getDouble("comm");
				deptno = rs.getInt("deptno");
				
				evo = new EmpVO(empno, ename, job, mgr, hiredate, sal, comm,deptno);
				elist.add(evo);
		      } while (rs.next());
		   }
		} catch (SQLException e) {
		   e.printStackTrace();
		} finally {
		   try {
		      rs.close();
		      pstmt.close();
		      DBConn.close();
		      System.out.println("end");
		   } catch (SQLException e) {
		      e.printStackTrace();
		   }
		}
		request.setAttribute("dlist", dlist);
		request.setAttribute("jlist", jlist);
		request.setAttribute("elist", elist);
		
		// 포워딩
		String path = "/days03/ex01_empsearch_jstl.jsp"; 
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
