<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
    <head>
    
    <style>


.main_common{
    display: inline-block;
    float: left;
    width: 269px;
    height: 100px;
    border: 1px solid blue;
    margin: auto;
    
}
.map_main{
	float : left;
	width : 29%;
	height : 100%;
	border: 1px solid black;
	margin : auto;
}

</style>
										<!-- 정진이형 키 : 1c6bbbf0-74bd-4727-936f-0acdeb2a47cb -->
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <title>simpleMap</title>
        <script type="text/javascript" src="resources/js/jquery-3.1.1.min.js"></script>
        <script src="https://api2.sktelecom.com/tmap/js?version=1&format=javascript&appKey=9678b2f0-469e-4b2b-94bc-988d16431c07"></script>
        <script type="text/javascript">
        
        // map.clearOverlays();
        var map;
        var start;
        var end;
        var tDistance;
        var tTime;
        var taxiFare;
        var PreDistance;
        var PreTime;
        var PreMoney;
       
        function CreateRoom(){
        	start = document.getElementById("start").value;
        	end =  document.getElementById("end").value;
        	console.log(tDistance);
        	location.href="CreateRoom?rStart="+start+"&rEnd="+end+"&preDistance="+PreDistance+"&preTime="+PreTime+"&preMoney="+PreMoney;
        }
        
        function StartMap(){
        	map = new Tmap.Map({
				div:'map_div',
				width : "70%",
				height : "60%",
			});
        	
        	
        	/* '<html><body><h1>이거뜨냐?</h1></body></html>'
        	'<body><h1>이거뜨냐?</h1></body>'
        	'<form action="CreateRoom" method="post">'+
    		+'<input type="hidden" name="PreDistance" value='+tDistance+'>'+
    		console.log(start)
    		+'<input type="hidden" name="PreTime" value='+tTime+'>'+
    		+'<input type="hidden" name="PreMoney" value='+taxiFare+'>'+
    		+'<body>'+'<input type="submit" value="방 만들어보리기">'+
    		+'</body>'+'</form>'
    		console.log("안녕><") */
        }
        
    	function initTmap(){
    		
			map.setCenter(new Tmap.LonLat("126.986072", "37.570028").transform("EPSG:4326", "EPSG:3857"), 15);
			
			//여기부터 출발지
			var start = document.getElementById("start").value;
			console.log(start);/* var promise =  */
		 	$.ajax({
				method:"GET",
				url:"https://api2.sktelecom.com/tmap/geo/fullAddrGeo?version=1&format=xml&callback=result", //FullTextGeocoding api 요청 url입니다.
				async:false,
				data:{
					"coordType" : "WGS84GEO",//지구 위의 위치를 나타내는 좌표 타입입니다.
					"fullAddr" : start, //주소 정보 입니다, 도로명 주소 표준 표기 방법을 지원합니다.  
					"page" : "1",//페이지 번호 입니다.
					"count" : "20",//페이지당 출력 갯수 입니다.
					"appKey" : "9678b2f0-469e-4b2b-94bc-988d16431c07",//실행을 위한 키 입니다. 발급받으신 AppKey를 입력하세요.
				},
				//데이터 로드가 성공적으로 완료되었을 때 발생하는 함수입니다.
				success:function(response){
					prtcl = response;
					
					// 3. 마커 찍기
					var prtclString = new XMLSerializer().serializeToString(prtcl);//xml to String	
					xmlDoc = $.parseXML( prtclString ),
					$xml = $( xmlDoc ),
					$intRate = $xml.find("coordinate");

					//검색 결과 정보가 없을 때 처리
					if($intRate.length==0){
						//예외처리를 위한 파싱 데이터
						$intError = $xml.find("error");
								
						// 주소가 올바르지 않을 경우 예외처리
						if($intError.context.all[0].nodeName == "error"){
							$("#result").text("요청 데이터가 올바르지 않습니다.");
						}
					}	
						  		    
					var lon1, lat1;
					if($intRate[0].getElementsByTagName("lon").length>0){//구주소
						lon1 = $intRate[0].getElementsByTagName("lon")[0].childNodes[0].nodeValue;
					   	lat1 = $intRate[0].getElementsByTagName("lat")[0].childNodes[0].nodeValue;
					}else{//신주소
						lon1 = $intRate[0].getElementsByTagName("newLon")[0].childNodes[0].nodeValue;
						lat1 = $intRate[0].getElementsByTagName("newLat")[0].childNodes[0].nodeValue;
					}
					console.log("ajax안"+lon1);
					console.log("ajax안"+lat1);
					
					result1 = lon1;
					result2 = lat1;
					
					
				}});
		 				console.log("result1밖"+result1);
		 				console.log("result2밖"+result2);
		 			//여기까지 출발지 
			
			//여기부터 도착지
			var end = document.getElementById("end").value;
			$.ajax({
				method:"GET",
				url:"https://api2.sktelecom.com/tmap/geo/fullAddrGeo?version=1&format=xml&callback=result", //FullTextGeocoding api 요청 url입니다.
				async:false,
				data:{
					"coordType" : "WGS84GEO",//지구 위의 위치를 나타내는 좌표 타입입니다.
					"fullAddr" : end, //주소 정보 입니다, 도로명 주소 표준 표기 방법을 지원합니다.  
					"page" : "1",//페이지 번호 입니다.
					"count" : "20",//페이지당 출력 갯수 입니다.
					"appKey" : "9678b2f0-469e-4b2b-94bc-988d16431c07",//실행을 위한 키 입니다. 발급받으신 AppKey를 입력하세요.
				},
				//데이터 로드가 성공적으로 완료되었을 때 발생하는 함수입니다.
				success:function(response){
					prtcl = response;
					
					// 3. 마커 찍기
					var prtclString = new XMLSerializer().serializeToString(prtcl);//xml to String	
					xmlDoc = $.parseXML( prtclString ),
					$xml = $( xmlDoc ),
					$intRate = $xml.find("coordinate");

					//검색 결과 정보가 없을 때 처리
					if($intRate.length==0){
						//예외처리를 위한 파싱 데이터
						$intError = $xml.find("error");
								
						// 주소가 올바르지 않을 경우 예외처리
						if($intError.context.all[0].nodeName == "error"){
							$("#result").text("요청 데이터가 올바르지 않습니다.");
						}
					}	
						  		    
					var lon2, lat2;
					if($intRate[0].getElementsByTagName("lon").length>0){//구주소
						lon2 = $intRate[0].getElementsByTagName("lon")[0].childNodes[0].nodeValue;
					   	lat2 = $intRate[0].getElementsByTagName("lat")[0].childNodes[0].nodeValue;
					}else{//신주소
						lon2 = $intRate[0].getElementsByTagName("newLon")[0].childNodes[0].nodeValue;
						lat2 = $intRate[0].getElementsByTagName("newLat")[0].childNodes[0].nodeValue;
					}
					result3 = lon2;
					result4 = lat2;
					
				}});
					//여기까지 도착지
			//lat 위도
			
			var routeLayer = new Tmap.Layer.Vector("route");//벡터 레이어 생성
			var markerLayer = new Tmap.Layer.Markers("start");// 마커 레이어 생성
			map.addLayer(routeLayer);//map에 벡터 레이어 추가
			map.addLayer(markerLayer);//map에 마커 레이어 추가

			// 시작
					console.log("출발지도착지 안"+result1)
					console.log("출발지도착지 안"+result2)
			//var input1 = document.getElementById("start1").value;
			//var input2 = document.getElementById("start2").value;
			var size = new Tmap.Size(24, 38);//아이콘 크기 설정
			var offset = new Tmap.Pixel(-(size.w / 2), -size.h); //아이콘 중심점
			var icon = new Tmap.IconHtml('<img src=http://tmapapis.sktelecom.com/upload/tmap/marker/pin_r_m_s.png />', size, offset);//마커 아이콘 설정
			var marker_s = new Tmap.Marker(new Tmap.LonLat(result1, result2).transform("EPSG:4326", "EPSG:3857"), icon);//설정한 좌표를 "EPSG:3857"로 좌표변환한 좌표값으로 설정합니다.
			markerLayer.addMarker(marker_s);//마커 레이어에 마커 추가   변수 변수

			// 도착
			//var input3 = document.getElementById("end1").value;
			//var input4 = document.getElementById("end2").value;
			var icon = new Tmap.IconHtml('<img src=http://tmapapis.sktelecom.com/upload/tmap/marker/pin_r_m_e.png />', size, offset);//마커 아이콘 설정
			var marker_e = new Tmap.Marker(new Tmap.LonLat(result3, result4).transform("EPSG:4326", "EPSG:3857"), icon);//설정한 좌표를 "EPSG:3857"로 좌표변환한 좌표값으로 설정합니다.
			markerLayer.addMarker(marker_e);//마커 레이어에 마커 추가 변수

			var headers = {}; 
			headers["appkey"]="9678b2f0-469e-4b2b-94bc-988d16431c07";//실행을 위한 키 입니다. 발급받으신 AppKey를 입력하세요.
			$.ajax({
				method:"POST",
				headers : headers,
				url:"https://api2.sktelecom.com/tmap/routes?version=1&format=xml",//자동차 경로안내 api 요청 url입니다.
				async:false,
				data:{
					//출발지 위경도 좌표입니다.
					startX : result1,
					startY : result2,
					//목적지 위경도 좌표입니다.
					endX : result3,
					endY : result4,
					//출발지, 경유지, 목적지 좌표계 유형을 지정합니다.
					reqCoordType : "WGS84GEO",
					resCoordType : "EPSG3857",
					//각도입니다.
					angle : "172",
					//경로 탐색 옵션 입니다.
					searchOption : 0
				},
				//데이터 로드가 성공적으로 완료되었을 때 발생하는 함수입니다.
				success:function(response){
					prtcl = response;
					
					// 결과 출력
					var innerHtml ="";
					var prtclString = new XMLSerializer().serializeToString(prtcl);//xml to String	
				    xmlDoc = $.parseXML( prtclString ),
				    $xml = $( xmlDoc ),
			    	$intRate = $xml.find("Document");
			    	
					//var
			    	tDistance = "총 거리 : "+($intRate[0].getElementsByTagName("tmap:totalDistance")[0].childNodes[0].nodeValue/1000).toFixed(1)+"km";
			    	tTime = "총 시간 : "+($intRate[0].getElementsByTagName("tmap:totalTime")[0].childNodes[0].nodeValue/60).toFixed(0)+"분";	
			    	tFare = "총 요금 : "+$intRate[0].getElementsByTagName("tmap:totalFare")[0].childNodes[0].nodeValue+"원";	
			    	taxiFare = "예상 택시 요금 : "+$intRate[0].getElementsByTagName("tmap:taxiFare")[0].childNodes[0].nodeValue+"원";
			    	PreDistance = ($intRate[0].getElementsByTagName("tmap:totalDistance")[0].childNodes[0].nodeValue/1000).toFixed(1)+"km";
			        PreTime = ($intRate[0].getElementsByTagName("tmap:totalTime")[0].childNodes[0].nodeValue/60).toFixed(0)+"분";
			        PreMoney = $intRate[0].getElementsByTagName("tmap:taxiFare")[0].childNodes[0].nodeValue+"원";
					console.log(tDistance);
			    	$("#result").text(tDistance+tTime+tFare+taxiFare);
					$("#tDistance").text(tDistance);
					$("#tTime").text(tTime);
					$("#tFare").text(tFare);
					$("#taxiFare").text(taxiFare);
					prtcl=new Tmap.Format.KML({extractStyles:true, extractAttributes:true}).read(prtcl);//데이터(prtcl)를 읽고, 벡터 도형(feature) 목록을 리턴합니다.
					
					routeLayer.removeAllFeatures();//레이어의 모든 도형을 지웁니다.
					
					//표준 데이터 포맷인 KML을 Read/Write 하는 클래스 입니다.
					//벡터 도형(Feature)이 추가되기 직전에 이벤트가 발생합니다.
					routeLayer.events.register("beforefeatureadded", routeLayer, onBeforeFeatureAdded);
					        function onBeforeFeatureAdded(e) {
						        	var style = {};
						        	switch (e.feature.attributes.styleUrl) {
						        	case "#pointStyle":
							        	style.externalGraphic = "http://topopen.tmap.co.kr/imgs/point.png"; //렌더링 포인트에 사용될 외부 이미지 파일의 url입니다.
							        	style.graphicHeight = 16; //외부 이미지 파일의 크기 설정을 위한 픽셀 높이입니다.
							        	style.graphicOpacity = 1; //외부 이미지 파일의 투명도 (0-1)입니다.
							        	style.graphicWidth = 16; //외부 이미지 파일의 크기 설정을 위한 픽셀 폭입니다.
						        	break;
						        	default:
							        	style.strokeColor = "#ff0000";//stroke에 적용될 16진수 color
							        	style.strokeOpacity = "1";//stroke의 투명도(0~1)
							        	style.strokeWidth = "5";//stroke의 넓이(pixel 단위)
						        	};
					        	e.feature.style = style;
					        }
					
					routeLayer.addFeatures(prtcl); //레이어에 도형을 등록합니다.
					
					map.zoomToExtent(routeLayer.getDataExtent());//map의 zoom을 routeLayer의 영역에 맞게 변경합니다.	
				},
				//요청 실패시 콘솔창에서 에러 내용을 확인할 수 있습니다.
				error:function(request,status,error){
					console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			});

			/* '<form action="CreateRoom" method="post">'+
    		+'<input type="hidden" name="PreDistance" value='+tDistance+'>'+
    		+'<input type="hidden" name="PreTime" value='+tTime+'>'+
    		+'<input type="hidden" name="PreMoney" value='+taxiFare+'>'+
    		+'<body>'+'<input type="submit" value="방 만들어보리기">'+
    		+'</body>'+'</form>'
    		console.log("안녕><") */
		} 
    	

    	</script>
		
    </head >
    <body onload="StartMap()">
    <div>
      
        <!-- style="float:right;" -->
       <!-- 
       onload="initTmap()"
    <div class="main_1 main_common" id="tDistance" name="tDistance"></div>
    <div class="main_2 main_common" id="tTime" name="tTime"></div>
    <div class="main_3 main_common" id="tFare" name="tFare"></div>
	<div class="main_4 main_common" id="taxiFare" name="taxiFare"></div>									
		 -->
     	
     	
     	<div class="map_main">
	<div class="main_4 main_common">
	출발지 <input type="text" id="start" name="Start">	
	</div>
    <div class="main_5 main_common">
	도착지 <input type="text" id="end" name="end"><br>
    </div>
	<div class="main_6 main_common">
	도로명, 번지수로 검색!<br>
	<button onclick="initTmap()">경로 검색</button><br><br>
	<a href="ReStart">경로 재검색</a>
	</div>
	  <div class="main_1 main_common" id="tDistance"></div>
    <div class="main_2 main_common" id="tTime"></div>
	<div class="main_3 main_common" id="taxiFare"></div>
	
	</div>
	  <div class="main_0 main_common" id="map_div" >
        </div>
	
     	
     	

     	
     	
 		<button onclick="CreateRoom()">방 만들기</button><br><br>	
		
		<a href="RoomList">방목록</a>
		
		
		</div>
     	
     	
    </body>
</html>	
