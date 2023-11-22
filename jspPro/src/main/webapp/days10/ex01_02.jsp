<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
  		<h1 class="main">
    		<a href="#">GyeongSeo Home</a>
  		</h1>
  		<ul>
  			<li><a href="#">로그인</a></li>
  			<li><a href="#">회원가입</a></li>
  		</ul>
	</header>
	<h3>
		<span class="material-symbols-outlined">view_list</span>
		jspclass days00
	</h3>
	<div>
  		<xmp class="code">
    	ex01 -> ex01_02.jsp
  		</xmp>
  		
		<div id="googleMap" style="width:100%;height:400px"></div>
		<script>
		   function myMap(){
			   var lat = <%= request.getParameter("lat") %>;
			   var lng = ${param.lng}; 
			   var mapCenter = new google.maps.LatLng( lat, lng ); 
			   var mapCanvas = document.getElementById("googleMap") ;
			   
			   var mapOptions = {
		                       center: mapCenter
		                       , zoom: 15
		                        }; 
		      var map = new google.maps.Map( 
		    		 						mapCanvas
		                                    , mapOptions 
		                                    );
		      
		   	  // 쌍용교육센터의 위치를 표시하는 마커
		      // 1. 마커, 폴리라인, 다각형, 원, 직사각형, 정보창
		      var marker = new google.maps.Marker({
		    	  position: mapCenter
		    	  //, animation: google.maps.Animation.BOUNCE
		    	   ,icon: "pinkball.png"
		      });
		      marker.setMap(map);
		      
		      
		     // 2. 정보창 표시
		     var message = "<a href='http://www.sist.co.kr'>쌍용교육센터</a>";
		     var message = "<a href='http://www.sist.co.kr'><img alt='lezhin.com 로고' src='//img-s-msn-com.akamaized.net/tenant/amp/entityid/BBFwET1.img'></a>";
		     var infoWindow = new google.maps.InfoWindow({
		    	 content : message 
		     });
		     infoWindow.open(map, marker);
		   }
		</script> 
		<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDBPLvuvaNXgpGrZwpj_luL18R11xAbGno&callback=myMap"></script>
  		
	</div>
	
	<script>
	</script>
	
</body>
</html>