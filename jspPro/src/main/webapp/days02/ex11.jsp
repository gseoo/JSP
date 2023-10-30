<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
   String ok = request.getParameter("ok");         // "" - 인증 성공
   String name = request.getParameter("name");      // "관리자"
   String error = request.getParameter("error");   // ""
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<link rel="shortcut icon" href="http://localhost/jspPro/images/SiSt.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link rel="stylesheet" href="/jspPro/resources/cdn-main/example.css">
<script src="/jspPro/resources/cdn-main/example.js"></script>
<style>
 span.material-symbols-outlined{
    vertical-align: text-bottom;
 }
</style>
</head>
<body>
<header>
  <h1 class="main"><a href="#" style="position: absolute;top:30px;">GyeongSeo Home</a></h1>
  <ul>
    <li><a href="#">로그인</a></li>
    <li><a href="#">회원가입</a></li>
  </ul>
</header>
<h3>
  <span class="material-symbols-outlined">view_list</span> jsp days02 - ex11
</h3>
<div>
  <xmp class="code">
     ex11.jsp    id/paswd  -> 로그인
     ex11_ok.jsp         리다이렉트
        로그인 성공   ex11.jsp?ok&name=로그인이름
        로그인 실패   ex11.jsp?error
  </xmp> 
  
  <div id="logon">
     <form action="ex11_ok.jsp">
        아이디 : <input type="text" name="id" value="admin"><br>
        비밀번호 : <input type="password" name="passwd" value="1234"><br>
        <input type="submit" value="logon">
     </form>
  </div>
  <div id="logout">
     [<%=name %>]님 로그인하셨습니다.<br>
     <button>로그아웃</button>
  </div>
  
  <a href="#">설문조사</a>
  
  <%
     if(ok != null) {
  %>   
  <!-- 반드시 로그인해야만 사용할 수 있는 메뉴 -->
  <a href="#">일정관리</a>
  <a href="#">게시판</a>
  
  <script>
     $(function () {
      alert("로그인 성공");
      $("#logon").hide();
      $("#logout").show();
   })
  </script>
  
  <%
   }
  %>
  
  <%
   // ex09.jsp?error
   if( error != null && error.equals("")) {
  %>      
  <script>
     $(function () {
        alert("로그인 실패");      
   })
  </script>
  <%
     }
  %>
</div>

<script>
   $("#logout").hide();
   
    $("button").click(function() {
         alert("로그아웃합니다.");
         location.href = "ex11.jsp";
      })

</script>
</body>
</html>