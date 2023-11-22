<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<link rel="shortcut icon" href="http://localhost/jspPro/images/SiSt.ico">
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script> -->
<link rel="stylesheet" href="/jspPro/resources/cdn-main/example.css">
<script src="/jspPro/resources/cdn-main/example.js"></script>
<link rel="stylesheet"    href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script   src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script   src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
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
    	
  		</xmp>
  		
  		<div id="googleMap" style="width: 100%; height: 400px"></div>
  		
  		
	</div>
	
	<script>
		var lat = 37.499294;
	    var lng = 127.0331883;
	    
	    function myMap() {
			var mapCenter = new google.maps.LatLng( lat, lng ); 
			var mapCanvas = document.getElementById("googleMap") ;
			     
			var mapOptions = {
					center: mapCenter, 
					zoom: 15};
		     
		     var map = new google.maps.Map(mapCanvas, mapOptions);
		     
		     google.maps.event.addListener(map, 'click', function(event) {
			    	placeMaker(map, event.latLng);
			    	$('#h_lng').val(event.latLng.lng()); // 위도
			    	$('#h_lat').val(event.latLng.lat()); // 경도
			    	
			    	$("#myModal").modal("show");
			 });
	    }
	    

	    function placeMaker(map, markerCenter) {
	    	 var marker = new google.maps.Marker({
	             position: markerCenter
	         });
			 marker.setMap(map);
	      
	        var message = `위도 :\${markerCenter.lat()}<br>경도 :\${markerCenter.lng()}`;
	        var infoWindow = new google.maps.InfoWindow(
	            {
	               content: message
	            }     
	        );
	        infoWindow.open( map, marker );  
	     }
	    
	</script>
	
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDBPLvuvaNXgpGrZwpj_luL18R11xAbGno&callback=myMap"></script>
	
	
	<!-- Modal -->
	   <div class="modal fade" id="myModal" role="dialog">
	      <div class="modal-dialog" style="width: 350px">
	
	         <!-- Modal content-->
	         <div class="modal-content">
	            <div class="modal-header">
	               <h4 class="modal-title">위치 정보 입력</h4>
	            </div>
	            <div class="modal-body"> 
	               <div style="text-align: center">
	                  <form id="form1" action="ex02_oracle_input_ok.jsp" method="post">
	                     <table style="width:300px;text-align: center" border="1">
	                     
	                        <tr><td>ID</td></tr>
	                        <tr><td><input type="text" name="id" value="100"></td></tr>
	                        <tr><td>TYPE</td></tr>
	                        <tr><td><input type="text" name="type" value="restaurant or bar"></td></tr>
	                        <tr><td>NAME</td></tr>
	                        <tr><td><input type="text" name="name" value="admin"></td></tr>
	                        <tr><td>ADDRESS</td></tr>
	                        <tr><td><input type="text" name="address" value="seoul"></td></tr>
	                        <tr>
	                           <td><input type="button" id="btnSave" value="저장"></td>
	                        </tr>
	                     </table>
	   <input type="hidden" id="h_lat" name="lat" value="" />
	   <input type="hidden" id="h_lng" name="lng" value="" />
	                  </form>
	               </div>
	
	            </div>
	            <div class="modal-footer">
	               <button type="button" onclick="modal_close();" class="btn btn-default" data-dismiss="modal">Close</button>
	            </div>
	         </div>
	
	      </div>
	   </div>
	
	<script>
		$("#btnSave").click(function() {
			if(confirm("정말 저장합니까?")) $("#form1").submit();
		});
		
		function modal_close() {
			if(typeof marker != 'undefined') marker.setMap(null);
		}
	</script>
</body>
</html>