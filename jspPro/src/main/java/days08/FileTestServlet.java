package days08;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.oreilly.servlet.multipart.FileRenamePolicy;
import com.util.ConnectionProvider;
import com.util.JdbcUtil;

@WebServlet("*.ss")
public class FileTestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public FileTestServlet() {

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI(); 
		
		Connection conn = null;
		String saveDirectory = null;
		
		try {
			conn = ConnectionProvider.getConnection();
			FileTestDAO dao = FileTestDAO.getInstance();
			
			saveDirectory = request.getRealPath("/days08/upload");
  			System.out.println(saveDirectory);
			
			if ( uri.indexOf("list.ss") != -1) {   // 자료실 목록 
				ArrayList<FileTestDTO> list = dao.selectFileList(conn);
				request.setAttribute("list", list);
				
				String path = "/days08/ex11_list.jsp";
				RequestDispatcher dispatcher = request.getRequestDispatcher(path);
				dispatcher.forward(request, response);
				
			} else if ( uri.indexOf("write.ss") != -1) {  // 자료실 쓰기 + 폼
				String path = "/days08/ex11_write.jsp";
				RequestDispatcher dispatcher = request.getRequestDispatcher(path);
				dispatcher.forward(request, response);
				
			} else if ( uri.indexOf("write_ok.ss") != -1) { // 자료실 쓰기 + 저장
	  			// ㄴ : 서버에 저장될 위치경로)
	  			
	  			
	  			File f = new File(saveDirectory);
	  			if(!f.exists()) f.mkdirs();
	  			
	  			// ㄷ : 최대 파일 크기
	  			int maxPostSize = 5 * 1024 * 1024; // 5byte * 1024 * 1024 = 5MB
	  			
	  			// ㄹ : 파일의 인코딩 방식
	  			String encoding = "UTF-8";
	  			
	  			// ㅁ : 파일 중복 처리를 위한 인자(클래스 제공)
	  			FileRenamePolicy policy = new DefaultFileRenamePolicy();
	  			
	  			MultipartRequest multiRequest = new MultipartRequest(
	  					request
	  					, saveDirectory
	  					, maxPostSize
	  					, encoding
	  					, policy
	  					);
	  			// 첨부파일들은 upload 폴더에 저장 완료
	  			
	  			FileTestDTO dto = new FileTestDTO();
	  			
	  			String subject = multiRequest.getParameter("subject");
	  			dto.setSubject(subject);
	  			
	  			// 첨부파일 유무 확인
	  			File attachFile = multiRequest.getFile("attachFile");
	  			if(attachFile != null) { // 첨부된 파일이 있다
	  				String fileName = attachFile.getName();
	  				long filelength = attachFile.length();
	  				
	  				String originalFileName = multiRequest.getOriginalFileName("attachFile");
  					String filesystemName = multiRequest.getFilesystemName("attachFile");
  					
  					dto.setFilelength(filelength);
  					dto.setOriginalfilename(originalFileName);
  					dto.setFilesystemname(filesystemName);
	  			}
	  			
	  			int rowCount = dao.insert(conn, dto);
	  			
	  			response.sendRedirect("list.ss");
	  			
			} else if ( uri.indexOf("delete.ss") != -1) {  // 삭제
				int num = Integer.parseInt(request.getParameter("num"));
				String filesystemname = request.getParameter("filesystemname");
				
				// 1. DB에서 삭제하기
				int rowCount = dao.delete(conn, num);
				
				// 2. upload 폴더에서 삭제하기
				String pathname = String.format("%s\\%s", saveDirectory, filesystemname);
				File deleteFile = new File(pathname);
				
				if(deleteFile.exists()) deleteFile.delete();
				
				// 3. 삭제 후 list로 이동
				response.sendRedirect("/jspPro/days08/list.ss");
				
			} else if ( uri.indexOf("update.ss") != -1) {  // 수정 + 폼
				// ?num=2&filesystemname=파일명.확장자
				int num = Integer.parseInt(request.getParameter("num"));
				FileTestDTO dto = dao.selectOne(conn, num);
				request.setAttribute("dto", dto);
				
				String path = "/days08/ex11_update.jsp";
				RequestDispatcher dispatcher = request.getRequestDispatcher(path);
				dispatcher.forward(request, response);
				
			} else if ( uri.indexOf("update_ok.ss") != -1) { // 수정 + 저장
				
			} // if

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
