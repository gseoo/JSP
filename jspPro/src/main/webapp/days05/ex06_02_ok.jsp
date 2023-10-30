<%@page import="java.net.URLEncoder"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	// 1. form 안의 입력값으로 쿠키 생성
	String cookieName = request.getParameter("cookieName");
	String cookieValue = request.getParameter("cookieValue");
	
	// 쿠키 생성 시 쿠키의 값은 한글인 경우 반드시 인코딩 필요
	Cookie c =  new Cookie(cookieName, URLEncoder.encode(cookieValue, "UTF-8"));
	c.setMaxAge(-1); // 브라우저 닫으면 자동으로 쿠키 제거
	//c.setDomain(domain); // localhost
	//c.setPath(uri); // /jspPro/days05
	response.addCookie(c);
	
	// 2. 서버 리다이렉트(서버 쿠키 확인)
	String location = "ex06.jsp";
	response.sendRedirect(location);
%>