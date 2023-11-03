<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	// days07.AuthoInfo.java
	// DB 연동 -> id/pw/authority 체크
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	
	// 로그인 누르면 무조건 인증받았다고 가정함
	// 인증 정보 저장
	session.setAttribute("auth", id);
	
	String location = "/jspPro/days07/ex03.jsp";
	
	String referer = (String)session.getAttribute("referer");
	if(referer != null) {
		location = referer;
		session.removeAttribute("referer");
	}
	response.sendRedirect(location);
%>