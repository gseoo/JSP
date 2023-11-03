package days08;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Collection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/*@WebServlet("/UploadServlet")*/
public class UploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UploadServlet() {

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		
		Collection<Part> parts = request.getParts();
		PrintWriter out = response.getWriter();
		out.print("<html>");
		out.print("<body>");
		
		String contentType = request.getContentType();
		// multipart/ 로 시작 -> 첨부파일 있음
		if(contentType != null && contentType.toLowerCase().startsWith("multipart/")) {
			printPartInfo(request, out);
		} else {
			out.print("> multipart 아님");
		}
		
		out.print("</body>");
		out.print("</html>");
	}

	private void printPartInfo(HttpServletRequest request, PrintWriter out) throws IOException, ServletException {
		Collection<Part> parts = request.getParts();
		for(Part part : parts) {
			out.print("<br>name : " + part.getName());
			String contentType = part.getContentType();
			out.print("<br>contentType : " + contentType);
			
			if(part.getHeader("Content-Disposition").contains("filename") ) {
				out.print("<br> size : " + part.getSize());
				String fileName = part.getSubmittedFileName(); // 실제 업로드된 파일 이름
				out.print("<br> fileName : " + fileName);
				
				if(part.getSize() > 0) {
					part.write("c:\\Temp\\" + fileName);
					part.delete();
				}
			} else {
				String paramValue = request.getParameter(part.getName());
				out.print("<br> paramValue : " + paramValue);
			}
			
			out.print("<hr>");
		}
		
	}

}
