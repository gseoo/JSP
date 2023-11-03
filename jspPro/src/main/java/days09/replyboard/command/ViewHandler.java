package days09.replyboard.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import days09.replyboard.domain.ReplyBoardDTO;
import days09.replyboard.service.ViewService;

public class ViewHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// view.do?num=2&cp/sc/sw
		int num = Integer.parseInt( request.getParameter("num") );

		ViewService contentService = ViewService.getInstance();
		ReplyBoardDTO dto = contentService.selectOne(num);

		request.setAttribute("dto", dto);

		return "/days09/replyboard/view.jsp";

	} // process
}
