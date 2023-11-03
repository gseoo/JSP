package days06.mvc.command;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.ConnectionProvider;

import days06.mvc.domain.BoardDTO;
import days06.mvc.domain.PageDTO;
import days06.mvc.persistence.BoardDAOImpl;

public class ListHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("> ListHandler.process 호출됨");
		
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
		
		Connection conn = ConnectionProvider.getConnection();
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
			System.out.println("> ListHandler.doGet()... Exception...");
			e.printStackTrace();
		}
		
		conn.close();
		
		// 1. 포워딩 전에 데이터 저장
		request.setAttribute("list", list);
		request.setAttribute("pDto", pDto);

		return "/days06/board/list.jsp";
	}

}
