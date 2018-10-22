<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<title>With</title>
    <head>
    
    <style>
.main{
     background-color: yellow;
     border: 1px solid red;
}
 
.main_common{
    display: inline-block;
    float: left;
    width: 100px;
    height: 100px;
    border: 1px solid blue;
}
</style>
										<!-- 정진이형 키 : 1c6bbbf0-74bd-4727-936f-0acdeb2a47cb -->
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <title>simpleMap</title>
        <script type="text/javascript" src="resources/js/jquery-3.1.1.min.js"></script>
        <script src="https://api2.sktelecom.com/tmap/js?version=1&format=javascript&appKey=9678b2f0-469e-4b2b-94bc-988d16431c07"></script>
        <script type="text/javascript">
    	function initTmap2(){
			
			// 1. 지도 띄우기
			// map 생성
			// Tmap.map을 이용하여, 지도가 들어갈 div, 넓이, 높이를 설정합니다.
			map = new Tmap.Map({
				div : 'map_div',// map을 표시해줄 div
				width : "100%",// map의 width 설정
				height : "400px",// map의 height 설정
			});
		map.setCenter(new Tmap.LonLat("126.986072", "37.570028").transform("EPSG:4326", "EPSG:3857"), 15);//설정한 좌표를 "EPSG:3857"로 좌표변환한 좌표값으로 즁심점을 설정합니다.	

		// 2. API 사용요청	
			var input = document.getElementById("address").value;
			console.log(input);
		$.ajax({
			method:"GET",
			url:"https://api2.sktelecom.com/tmap/geo/fullAddrGeo?version=1&format=xml&callback=result", //FullTextGeocoding api 요청 url입니다.
			async:false,
			data:{
				"coordType" : "WGS84GEO",//지구 위의 위치를 나타내는 좌표 타입입니다.
				"fullAddr" : input, //주소 정보 입니다, 도로명 주소 표준 표기 방법을 지원합니다.  
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
					  		    
				var lon, lat;
				if($intRate[0].getElementsByTagName("lon").length>0){//구주소
					lon = $intRate[0].getElementsByTagName("lon")[0].childNodes[0].nodeValue;
				   	lat = $intRate[0].getElementsByTagName("lat")[0].childNodes[0].nodeValue;
				}else{//신주소
					lon = $intRate[0].getElementsByTagName("newLon")[0].childNodes[0].nodeValue;
					lat = $intRate[0].getElementsByTagName("newLat")[0].childNodes[0].nodeValue;
				}
				console.log(lon);
				console.log(lat);
				var markerStartLayer = new Tmap.Layer.Markers("marker");//마커 레이어 생성
				map.addLayer(markerStartLayer);//map에 마커 레이어 추가
				  	
			  	var size = new Tmap.Size(24, 38);//아이콘 크기 설정
				var offset = new Tmap.Pixel(-(size.w / 2), -size.h);//아이콘 중심점 설정
				var icon = new Tmap.IconHtml("<img src='http://tmapapis.sktelecom.com/upload/tmap/marker/pin_b_m_a.png' />", size, offset);//마커 아이콘 설정
				var marker_s = new Tmap.Marker(new Tmap.LonLat(lon, lat).transform("EPSG:4326", "EPSG:3857"), icon);//설정한 좌표를 "EPSG:3857"로 좌표변환한 좌표값으로 설정합니다.
				markerStartLayer.addMarker(marker_s);//마커 레이어에 마커 추가
				
				map.setCenter(new Tmap.LonLat(lon, lat).transform("EPSG:4326", "EPSG:3857"), 15);//설정한 좌표를 "EPSG:3857"로 좌표변환한 좌표값으로 즁심점을 설정합니다.
				
				//검색 결과 표출
				var matchFlag, newMatchFlag;
			  	//검색 결과 주소를 담을 변수
			  	var address = '', newAddress = '';
			  	var city, gu_gun, eup_myun, legalDong, adminDong, ri, bunji;
			  	var buildingName, buildingDong, newRoadName, newBuildingIndex, newBuildingName, newBuildingDong;
				//새주소일 때 검색 결과 표출
				//새주소인 경우 newMatchFlag가 응닶값으로 온다
				if($intRate[0].getElementsByTagName("newMatchFlag").length>0){
					// 새(도로명) 주소 좌표 매칭 구분 코드
					newMatchFlag = $intRate[0].getElementsByTagName("newMatchFlag")[0].childNodes[0].nodeValue;
					
					// 시/도 명칭
					if($intRate[0].getElementsByTagName("city_do").length>0){
						city = $intRate[0].getElementsByTagName("city_do")[0].childNodes[0].nodeValue;
						newAddress += city+"\n";
					}
					// 군/구 명칭
					if($intRate[0].getElementsByTagName("gu_gun").length>0){
						gu_gun = $intRate[0].getElementsByTagName("gu_gun")[0].childNodes[0].nodeValue;
						newAddress += gu_gun+"\n";
					}
					// 읍면동 명칭
					if($intRate[0].getElementsByTagName("eup_myun").length>0){
						eup_myun = $intRate[0].getElementsByTagName("eup_myun")[0].childNodes[0].nodeValue;
						newAddress += eup_myun+"\n";
					}
					// 출력 좌표에 해당하는 법정동 명칭
					if($intRate[0].getElementsByTagName("legalDong").length>0){
						legalDong = $intRate[0].getElementsByTagName("legalDong")[0].childNodes[0].nodeValue;
						newAddress += legalDong+"\n";
					}
					// 출력 좌표에 해당하는 법정동 명칭
					if($intRate[0].getElementsByTagName("adminDong").length>0){
						adminDong = $intRate[0].getElementsByTagName("adminDong")[0].childNodes[0].nodeValue;
						newAddress += adminDong+"\n";
					}
					// 출력 좌표에 해당하는 리 명칭
					if($intRate[0].getElementsByTagName("ri").length>0){
						ri = $intRate[0].getElementsByTagName("ri")[0].childNodes[0].nodeValue;
						newAddress += ri+"\n";
					}
					// 출력 좌표에 해당하는 지번 명칭
					if($intRate[0].getElementsByTagName("bunji").length>0){
						bunji = $intRate[0].getElementsByTagName("bunji")[0].childNodes[0].nodeValue;
						newAddress += bunji+"\n";
					}
					// 새(도로명) 주소 매칭을 한 경우, 길 이름을 반환
					if($intRate[0].getElementsByTagName("newRoadName").length>0){
						newRoadName = $intRate[0].getElementsByTagName("newRoadName")[0].childNodes[0].nodeValue;
						newAddress += newRoadName+"\n";
					}
					// 새(도로명) 주소 매칭을 한 경우, 건물 번호를 반환
					if($intRate[0].getElementsByTagName("newBuildingIndex").length>0){
						newBuildingIndex = $intRate[0].getElementsByTagName("newBuildingIndex")[0].childNodes[0].nodeValue;
						newAddress += newBuildingIndex+"\n";
					}
					// 새(도로명) 주소 건물명 매칭을 한 경우, 건물 이름을 반환
					if($intRate[0].getElementsByTagName("newBuildingName").length>0){
						newBuildingName = $intRate[0].getElementsByTagName("newBuildingName")[0].childNodes[0].nodeValue;
						newAddress += newBuildingName+"\n";
					}
					// 새주소 건물을 매칭한 경우 새주소 건물 동을 반환
					if($intRate[0].getElementsByTagName("newBuildingDong").length>0){
						newBuildingDong = $intRate[0].getElementsByTagName("newBuildingDong")[0].childNodes[0].nodeValue;
						newAddress += newBuildingDong+"\n";
					}
					
					// 검색 결과 표출
					var docs = "< a style='color:orange' href='#webservice/docs/fullTextGeocoding' >Docs< /a >"
					$("#result").html("검색결과(새주소) : "+newAddress+","+"\n"+"응답코드:"+newMatchFlag+"(상세 코드 내역은 "+docs+"에서 확인)");
				}
				
				//구주소일 때 검색 결과 표출
				//구주소인 경우 MatchFlag가 응닶값으로 온다
				if($intRate[0].getElementsByTagName("matchFlag").length>0){
					// 매칭 구분 코드
					matchFlag = $intRate[0].getElementsByTagName("matchFlag")[0].childNodes[0].nodeValue;
					
					// 시/도 명칭
					if($intRate[0].getElementsByTagName("city_do").length>0){
						city = $intRate[0].getElementsByTagName("city_do")[0].childNodes[0].nodeValue;
						address += city+"\n";
					}
					// 군/구 명칭
					if($intRate[0].getElementsByTagName("gu_gun").length>0){
						gu_gun = $intRate[0].getElementsByTagName("gu_gun")[0].childNodes[0].nodeValue;
						address += gu_gun+"\n";
					}
					// 읍면동 명칭
					if($intRate[0].getElementsByTagName("eup_myun").length>0){
						eup_myun = $intRate[0].getElementsByTagName("eup_myun")[0].childNodes[0].nodeValue;
						address += eup_myun+"\n";
					}
					// 출력 좌표에 해당하는 법정동 명칭
					if($intRate[0].getElementsByTagName("legalDong").length>0){
						legalDong = $intRate[0].getElementsByTagName("legalDong")[0].childNodes[0].nodeValue;
						address += legalDong+"\n";
					}
					// 출력 좌표에 해당하는 법정동 명칭
					if($intRate[0].getElementsByTagName("adminDong").length>0){
						adminDong = $intRate[0].getElementsByTagName("adminDong")[0].childNodes[0].nodeValue;
						address += adminDong+"\n";
					}
					// 출력 좌표에 해당하는 리 명칭
					if($intRate[0].getElementsByTagName("ri").length>0){
						ri = $intRate[0].getElementsByTagName("ri")[0].childNodes[0].nodeValue;
						address += ri+"\n";
					}
					// 출력 좌표에 해당하는 지번 명칭
					if($intRate[0].getElementsByTagName("bunji").length>0){
						bunji = $intRate[0].getElementsByTagName("bunji")[0].childNodes[0].nodeValue;
						address += bunji+"\n";
					}
					// 출력 좌표에 해당하는 지번 명칭
					if($intRate[0].getElementsByTagName("buildingName").length>0){
						buildingName = $intRate[0].getElementsByTagName("buildingName")[0].childNodes[0].nodeValue;
						address += buildingName+"\n";
					}
					// 출력 좌표에 해당하는 지번 명칭
					if($intRate[0].getElementsByTagName("buildingDong").length>0){
						buildingDong = $intRate[0].getElementsByTagName("buildingDong")[0].childNodes[0].nodeValue;
						address += buildingDong+"\n";
					}
					
					// 검색 결과 표출
					var docs = "< a style='color:orange' href='#webservice/docs/fullTextGeocoding' >Docs< /a >"
					$("#result").html("검색결과(지번주소) : "+address+","+"\n"+"응답코드:"+matchFlag+"(상세 코드 내역은 "+docs+"에서 확인)");
					
					//출력
					
				}
			},
			//요청 실패시 콘솔창에서 에러 내용을 확인할 수 있습니다.
			error:function(request,status,error){
				console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		});
		
		}
        
			function initTmap(){
				var map = new Tmap.Map({
					div:'map_div',
					width : "934px",
					height : "452px",
				});
				map.setCenter(new Tmap.LonLat("126.986072", "37.570028").transform("EPSG:4326", "EPSG:3857"), 15);
				var routeLayer = new Tmap.Layer.Vector("route");//벡터 레이어 생성
				var markerLayer = new Tmap.Layer.Markers("start");// 마커 레이어 생성
				map.addLayer(routeLayer);//map에 벡터 레이어 추가
				map.addLayer(markerLayer);//map에 마커 레이어 추가

				// 시작
				var size = new Tmap.Size(24, 38);//아이콘 크기 설정
				var offset = new Tmap.Pixel(-(size.w / 2), -size.h);//아이콘 중심점
				var icon = new Tmap.IconHtml('<img src=http://tmapapis.sktelecom.com/upload/tmap/marker/pin_r_m_s.png />', size, offset);//마커 아이콘 설정
				var marker_s = new Tmap.Marker(new Tmap.LonLat("126.9850380932383", "37.566567545861645").transform("EPSG:4326", "EPSG:3857"), icon);//설정한 좌표를 "EPSG:3857"로 좌표변환한 좌표값으로 설정합니다.
				markerLayer.addMarker(marker_s);//마커 레이어에 마커 추가   변수 변수

				// 도착
				var icon = new Tmap.IconHtml('<img src=http://tmapapis.sktelecom.com/upload/tmap/marker/pin_r_m_e.png />', size, offset);//마커 아이콘 설정
				var marker_e = new Tmap.Marker(new Tmap.LonLat("127.10331814639885", "37.403049076341794").transform("EPSG:4326", "EPSG:3857"), icon);//설정한 좌표를 "EPSG:3857"로 좌표변환한 좌표값으로 설정합니다.
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
						startX : "126.7850380932383",
						startY : "37.466567545861645",
						//목적지 위경도 좌표입니다.
						endX : "127.10331814639885",
						endY : "37.403049076341794",
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
				    	
				    	var tDistance = "총 거리 : "+($intRate[0].getElementsByTagName("tmap:totalDistance")[0].childNodes[0].nodeValue/1000).toFixed(1)+"km,";
				    	var tTime = " 총 시간 : "+($intRate[0].getElementsByTagName("tmap:totalTime")[0].childNodes[0].nodeValue/60).toFixed(0)+"분,";	
				    	var tFare = " 총 요금 : "+$intRate[0].getElementsByTagName("tmap:totalFare")[0].childNodes[0].nodeValue+"원,";	
				    	var taxiFare = " 예상 택시 요금 : "+$intRate[0].getElementsByTagName("tmap:taxiFare")[0].childNodes[0].nodeValue+"원";	
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


			} 
		</script>
		
    </head>
    <body onload="initTmap()">
        <div style="float:left;" id="map_div" >
        </div>
       
    <div class="main_1 main_common" id="tDistance" name="tDistance"></div>
    <div class="main_2 main_common" id="tTime" name="tTime"></div>
    <div class="main_3 main_common" id="tFare" name="tFare"></div>
	<div class="main_4 main_common" id="taxiFare" name="taxiFare"></div>									
					
      <input type="text" id="address">
<button onclick="initTmap2()" value="테스트"></button>
     
    </body>
</html>	
