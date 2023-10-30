package days04.board;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.DBConn;

import days04.board.domain.BoardDTO;
import days04.board.domain.PageDTO;
import days04.board.persistence.BoardDAOImpl;

@WebServlet("/cstvsboard/list.htm")
public class List extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public List() {
        super();
    }

    // localhost/jspPro/cstvsboard/list.htm
    // ?currentpage=3
    // &searchCondition=1&searchWord=홍길동
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int currentPage = 1; 	// 현재 페이지 번호
		int numberPerPage = 10; // 한 페이지에 출력할 게시글 수
		int numberOfPageBlock = 10;
		int totalRecords = 0; // 총 레코드 수
		int totalPages = 0;   // 총 페이지 수

		// 검색 기능 구현
		int searchCondition = 1;		
		try {
			searchCondition = Integer.parseInt( request.getParameter("searchCondition") );
		} catch (Exception e) {}
		
		
		String searchWord = request.getParameter("searchWord");
		// null					""
		// list.htm 			null  <-- 이 경우 ""로 저장되도록 if 문
		// list.htm?searchWord	""
		if (searchWord == null) searchWord="";
		
				
		try {
			// 파라미터가 안넘어오면 null 값이므로 예외 발생
			//                값은 1로 유지하겠다.
			currentPage = Integer.parseInt( request.getParameter("currentpage") );
		} catch (Exception e) {}
		
		ArrayList<BoardDTO> list = null;
		
		Connection conn = DBConn.getConnection();
		BoardDAOImpl dao = new BoardDAOImpl(conn);
		PageDTO pDto = null;
		try {
			if ( searchWord.equals("") ) {
				list = dao.select(currentPage, numberPerPage);
				totalRecords = dao.getTotalRecords();
				totalPages = dao.getTotalPages(numberPerPage);				
			} else {
				list = dao.search(searchCondition, searchWord, currentPage, numberPerPage);
				totalPages = dao.getTotalPages(searchCondition, searchWord, numberPerPage);
			}
			
			pDto = new PageDTO(currentPage, numberPerPage, numberOfPageBlock, totalPages);
			 
		} catch (SQLException e) {
			System.out.println("> List.doGet()... Exception...");
			e.printStackTrace();
		}
		
		DBConn.close();
		
		// 1. 포워딩 전에 데이터 저장
		request.setAttribute("list", list);
		request.setAttribute("pDto", pDto);
		
		// 2. 포워딩.
		String path = "/days04/board/list.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
