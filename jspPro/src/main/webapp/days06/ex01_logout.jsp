<%@page import="com.util.Cookies"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/inc/session_auth.jspf" %>
<%
	// 세션 삭제(제거)
	// 1. 즉시 강제 세션 종료
	session.invalidate();
	// 2. 요청이 없을 경우 약 20분 지나면 자동으로 세션 종료
%>

<script>
	alert("<%= logonID %>님 로그아웃하셨습니다.");
	location.href = "ex07_default.jsp";
</script>