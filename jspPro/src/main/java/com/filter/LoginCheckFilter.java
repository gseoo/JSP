package com.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/*@WebFilter("/LoginCheckFilter")*/
public class LoginCheckFilter implements Filter {

    public LoginCheckFilter() {
        
    }

	public void destroy() {
		
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		System.out.println("> LoginCheckFilter.doFilter() 실행");
		// 세션 auth 인증 + 권한 저장
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		
		String auth = null;
		boolean isLogon = false; // 인증 t/f
		
		HttpSession session = req.getSession(false);
		
		if(session != null && (auth = (String)session.getAttribute("auth")) != null) {
			// 인증 처리됨
			isLogon = true;
		}
		
		if(isLogon) {
			chain.doFilter(request, response);
		} else {
			String referer = req.getRequestURI();
			session.setAttribute("referer", referer);
			String location = "/jspPro/days07/member/logon.jsp";
			res.sendRedirect(location);
		}
		
		
		chain.doFilter(request, response);
	}

	public void init(FilterConfig fConfig) throws ServletException {
		
	}

}
