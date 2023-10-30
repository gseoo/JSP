package days02;

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

/**
 * Servlet implementation class ScottDept
 */
@WebServlet("/scott/dept")
public class ScottDept extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    public ScottDept() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	//	response.getWriter().append("Served at: ").append(request.getContextPath());

		Connection conn = DBConn.getConnection();

		// 3. 작업자(Statement)
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT deptno,dname,loc FROM dept";

		int deptno = 0;
		String dname = null; 
		String loc = null;
		DeptVO vo = null;
		ArrayList<DeptVO> list = null;

		try {
		   pstmt = conn.prepareStatement(sql);
		   rs = pstmt.executeQuery();

		   if ( rs.next() ) {
		      list = new ArrayList<DeptVO>();
		      do {
		         deptno = rs.getInt("deptno"); //== rs.getInt(1);
		         dname = rs.getString("dname");//== rs.getString(2);
		         loc = rs.getString(3); //== rs.getString("loc");

		         vo = new DeptVO(deptno, dname, loc);
		         list.add(vo);
		      } while (rs.next());
		   }
		} catch (SQLException e) {
		   e.printStackTrace();
		} finally {
		   try {
		// 4 close
		      rs.close();
		      pstmt.close();
		      DBConn.close();
		      System.out.println("end");
		   } catch (SQLException e) {
		      e.printStackTrace();
		   }
		}
		System.out.println(" end ");
		
		// 저장하는 코딩
		request.setAttribute("list", list);
		
		// 포워딩
		// http://localhost/jspPro/scott/dept
		// http://localhost/jspPro/scott/ex13_dept.jsp    404 오류
		//String path = "ex13_dept.jsp"; 
		// String path = "/days02/ex13_dept.jsp"; 
		String path = "/days02/ex13_dept_jstl.jsp"; 
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
