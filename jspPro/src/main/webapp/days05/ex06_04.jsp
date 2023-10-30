<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String [] delCookieNames = request.getParameterValues("ckbCookie");
	for(int i=0; i<delCookieNames.length; i++) {
		// 쿠키 삭제 : 똑같은 쿠키 이름으로 만료시점을 과거로 해서 쿠키 새로 생성
		String cookieName = delCookieNames[i];
		Cookie c = new Cookie(cookieName, "");
		c.setMaxAge(0);
		response.addCookie(c);
	}
	
	//alert() 쿠키 삭제 알리고 ex06_03.jsp(쿠키 확인 페이지)로 이동
%>

<script>
	alert("쿠키 삭제 완료!!");
	location.href = "ex06_03.jsp";
</script>
