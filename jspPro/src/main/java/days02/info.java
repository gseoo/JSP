package days02;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*
@WebServlet({ "/info", "/days02/info.htm" })
*/
public class info extends HttpServlet {
   private static final long serialVersionUID = 1L;
     

    public info() {
        super();
    }
    // get 요청
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      
      //response.getWriter().append("Served at: ").append(request.getContextPath());
	   response.setContentType(" text/html; charset=UTF-8");
      String name = request.getParameter("name");
      int age = Integer.parseInt(request.getParameter(name));
      
      PrintWriter out = response.getWriter();
      out
         .append("GET 방식 요청<br>")
         .append("> 이름 : "+ name+"<br>")
         .append("> 나이 : "+ age +"<br>");
      
   }
   // post 요청
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	   // doGet(request. response);
	   
	   //			  서블릿 
	   // 브라우저 -> 	post/get 요청
	   // 홍길동
	   // 20		UTF-8 인코딩
	   // 		->	ISO-8859-1 인코딩사용. UTF-8 인코딩.
	   //			
	   //
	  request.setCharacterEncoding("UTF-8");
	  response.setContentType(" text/html; charset=UTF-8");
      String name = request.getParameter("name");
      int age = Integer.parseInt(request.getParameter(name));
      
      PrintWriter out = response.getWriter();
      out
         .append("POST 방식 요청<br>")
         .append("> 이름 : "+ name+"<br>")
         .append("> 나이 : "+ age +"<br>");
      
   }

}