package days06.mvc.controller;


import java.io.FileReader;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Properties;
import java.util.Set;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import days06.mvc.command.CommandHandler;

public class DispatcherServlet extends HttpServlet {

	private static final long serialVersionUID = 2651573099997609735L;
	
	private Map<String, CommandHandler> commandHandlerMap = new HashMap<>();
	
	@Override
	public void init() throws ServletException {
		//System.out.println("> DispatcherServlet.init() 함수 호출됨");
		String path = this.getInitParameter("path");
		//System.out.println(path); // /WEB-INF/commandHandler.properties
		String realPath = this.getServletContext().getRealPath(path);
		//System.out.println(realPath);
		// E:\Class\Workspace\JSPClass\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\jspPro\WEB-INF\commandHandler.properties
		
		Properties prop = new Properties();
		
		try (FileReader reader = new FileReader(realPath);){
			prop.load(reader);
		} catch (Exception e) {
			throw new ServletException();
		}
		
		// prop(String, String) -> commandHandlerMap<String, 실제객체> 담는 작업
		Set<Entry<Object, Object>> set = prop.entrySet();
		Iterator<Entry<Object, Object>> ir = set.iterator();
		while (ir.hasNext()) {
			Entry<Object, Object> entry = ir.next();
			String url = (String) entry.getKey();
			String className = (String) entry.getValue();
			
			Class<?> commandhandlerClass;
			try {
				commandhandlerClass = Class.forName(className);
				CommandHandler commandHandler = (CommandHandler) commandhandlerClass.newInstance();
				this.commandHandlerMap.put(url, commandHandler);
			} catch (ClassNotFoundException | InstantiationException | IllegalAccessException e) {
				e.printStackTrace();
			}
			
			
		}
		
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//System.out.println(request.getRequestURL()); // http://localhost/jspPro/days06/list.do
		//System.out.println(request.getRequestURI()); // /jspPro/days06/list.do
		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		requestURI = requestURI.replace(contextPath, "");
		
		CommandHandler handler = this.commandHandlerMap.get(requestURI);
		
		String viewPage = null;
		try {
			viewPage = handler.process(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		// [포워딩], 리다이렉트
		if(viewPage != null) {
			RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
			dispatcher.forward(request, response);
		}
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

	@Override
	public void destroy() {
		System.out.println("> DispatcherServlet.destroy() 함수 호출됨");
	}

	
	
}
