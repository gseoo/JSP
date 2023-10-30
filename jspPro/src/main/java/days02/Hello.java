package days02;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*
<servlet>
	<description>첫 번째 서블릿 샘플</description>
	<description>현재 날짜/시간 정보 응답</description>
	<servlet-name>now</servlet-name>
	<servlet-class>days01.Now</servlet-class>
</servlet>

<servlet-mapping>
<!--    <url-pattern>/</url-pattern> -->
<!--    <url-pattern>*.ss</url-pattern> --> 
	<servlet-name>now</servlet-name> 
 <url-pattern>/days01/now.html</url-pattern>
 <url-pattern>/days01/now</url-pattern>
 <url-pattern>/days01/now.ss</url-pattern>
 <!-- <url-pattern>*.ss</url-pattern> -->
</servlet-mapping>
 @ 어노테이션으로 한것이랑 같은 코딩
*/

//톰캣시작시 자동적으로 올라간다\
/*
@WebServlet(
		description = "두번째 만드는 서블릿 예제 - 어노테이션 기반"
		// url패턴이 배열이기 때문에 여러개 넣을 수 있다.
		, urlPatterns = { "/Hello" , "/days02/Hello.html" }
		)
*/
public class Hello extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public Hello() {
        super();
    }

    // get, post 요청
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		out.append("hello~ ");
	}
	// get 요청
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
	// post 요청
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
