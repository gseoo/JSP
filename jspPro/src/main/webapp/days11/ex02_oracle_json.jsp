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
    	
  		</xmp>
  		 <button id="btnDeleteMarkers">delete marker</button>
		<br>
  		<div id="googleMap" style="width: 100%; height: 500px"></div>
  		
	</div>
	
	<script>
		var lat = 37.499294;
	    var lng = 127.0331883;
	    
	    var markers = [];
	    var customLabel = {
	    		restaurant:{
	    			label: 'R'
	    		}
	    		, bar:{
	    			label: 'B'
	    		}
	    };
	    function myMap() {
			var mapCenter = new google.maps.LatLng( lat, lng ); 
			var mapCanvas = document.getElementById("googleMap") ;
			     
			var mapOptions = {
					center: mapCenter, 
					zoom: 15};
		     
		    var map = new google.maps.Map(mapCanvas, mapOptions);
		     
		    // 2. ajax 요청 -> _json_data.jsp -> 지도 위에 마커 표시
			var infoWindow = new google.maps.InfoWindow;
      
			// 3. jquery ajax method :   ajax()
			var params = null;
			$.ajax({
			   url : "ex02_oracle_json_data.jsp",
			   dataType : "json",
			   type : "get",
			   data : params,
			   cache : false,
			   success : function(data) { //  []
			   // data == [
			    //             {"id":100,"type":"restaurant","name":"admin","lng":127.03432487024399,"lat":37.49937084987687,"address":"seoul"}
			    //             ,{"id":200,"type":"bar","name":"admin","lng":127.03231042642815,"lat":37.49895800057274,"address":"seoul"}
			    //        ]
			      $(data).each(
			            function(index, e) {
			               // id, type,name, lng,lat,address
			               var id = e.id;
			               var name = e.name;
			               var address = e.address;
			               var type = e.type;
			               var point = new google.maps.LatLng(
			                     parseFloat(e.lat), parseFloat(e.lng));
			
			               var infowincontent = $("<div />");
			               var strong = $("<strong />").html(name);
			                infowincontent.append(strong).append($("<br>"));
			
			               var text = document.createElement('text');
			               text.textContent = address;
			                infowincontent.append(text);
			                
			               var icon = customLabel[type] || {};
			
			               var marker = new google.maps.Marker({
			                  map : map,
			                  position : point,
			                  label : icon.label
			               });
			               
			               marker.addListener('click', function() {
			                  infoWindow.setContent(infowincontent.html());
			                  infoWindow.open(map, marker);
			               }); 
			               
			               // 모든 마커를 저장했다.
			               markers.push(marker);
			            }); // each
			   }
			}); // ajax 
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
	    
	 	// 5. 
	    $("#btnDeleteMarkers").click(function (){
	       for (var i = 0; i < markers.length; i++) {
	          markers[i].setMap(null);  // 마커 삭제
	       }
	    });
	    
	</script>
	
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDBPLvuvaNXgpGrZwpj_luL18R11xAbGno&callback=myMap"></script>
	
	
</body>
</html>