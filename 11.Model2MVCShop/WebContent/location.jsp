<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html lang="ko">
<head>
	<title>찾아오시는 길</title>
	<meta charset="EUC-KR">
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>

	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3ca145dc902b3f6aebed2c1751c34068&libraries=services"></script>
	
	<style>
		body {
            padding-top : 50px;
        }
        
        #map{
        	height:400px;
        }
        
        table{
       		margin-top : 30px;
        	padding-bottom : 30px;
        }
    </style>
</head>
<body>
	<jsp:include page="/layout/toolbar.jsp" />
	
	<div class="container">
	
		<div class="page-header text-center">
	       <h3 class="text-info">찾아오시는 길</h3>
	    </div>
	    <div class="row">
	    	<div class="col-md-3"></div>
	    	<div id="map" class="col-md-6"></div>
	    </div>
	    <div class="row">
	    	<div class="col-md-2"></div>
	    	<div class="col-md-8">	    		
	    		<table class="table table-bordered">
	    			<thead>
	    				<tr>
	    					<th scope="col" colspan="2" class="info">비트교육센터(본관)</th>
	    				</tr>
	    			</thead>
    				<tbody>
						<tr>
							<td scope="row">주 소</td>
							<td>서울특별시 서초구 서초대로74길33 비트빌 3층</td>
						</tr>
						<tr>
							<td scope="row">전 화</td>
							<td>02-3486-3456</td>
						</tr>
						<tr>
							<td scope="row">팩 스</td>
							<td>02-3486-7890</td>
						</tr>
					</tbody>
	    		</table>
	    		<table class="table table-bordered">
	    			<thead>
						<tr>
							<th scope="col" colspan="2" class="info">교통편안내</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td scope="col">전철</td>
							<td>지하철 2호선/신분당선 강남역 5번 출구 도보 3분</td>
						</tr>
						<tr>
							<td scope="col">버스</td>
							<td>
								<ul>
									<li>지선 - 3420, 4424, 5412</li>
									<li>간선 - 140, 144, 145, 340, 363, 402, 420, 470, 471</li>
									<li>광역 - 1550, 9100, 9200, 9300, 9400, 9404, 9408, 9409, 9410, 9411, 9412, 9503, 9700</li>
								</ul>
							</td>
						</tr>
					</tbody>
	    		</table>
	    	</div>
	    </div>
	    
	</div>
	
	<script>
		var container = document.getElementById('map');
		var options = {
			center: new daum.maps.LatLng(37.49461881031099, 127.0280102889623),
			level: 2
		};

		var map = new daum.maps.Map(container, options);
		
		var ps = new daum.maps.services.Places(); 
		ps.keywordSearch('서초 비트교육센터 별관', placesSearchCB); 

		function placesSearchCB (data, status, pagination) {
		    if (status === daum.maps.services.Status.OK) {
		        var bounds = new daum.maps.LatLngBounds();

		        for (var i=0; i<data.length; i++) {
		            displayMarker(data[i]);    
		            bounds.extend(new daum.maps.LatLng(data[i].y, data[i].x));
		        }       

		        map.setBounds(bounds);
		    } 
		}

		function displayMarker(place) {
		    var marker = new daum.maps.Marker({
		        map: map,
		        position: new daum.maps.LatLng(place.y, place.x) 
		    });
		}
	</script>
</body>
</html>