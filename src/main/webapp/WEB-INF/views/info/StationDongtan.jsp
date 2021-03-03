<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
#dongtan_station_wrap { margin: 0 auto; width: 1280px; }
#dongtan_station_wrap h1 { text-align:center; margin-bottom: 50px; }
#dongtan_station_wrap #infomenu_div { margin: 0 auto; text-align:right;  border-bottom: 2px solid gray; width: 900px; height: 30px; }
#dongtan_station_wrap #infomenu_div a{ text-decoration: none; color: black; }
#dongtan_station_wrap #infomenu_div a:nth-last-of-type(1){font-weight: bold;}

#dongtan_station_wrap #container { width:900px;	height:550px; margin:0 auto; border:1px solid gray; border-radius: 5px; margin-top:10px; box-shadow:  0px 0px 5px gray;}
#dongtan_station_wrap #container #mapWrapper { margin:0 auto; width:900px; height:550px; position:relative; z-index: 1; }
#dongtan_station_wrap #container #btnRoadview { display: none; }
#dongtan_station_wrap #container #mapWrapper #map{ width:100%; height:100%; }

#dongtan_station_wrap #dongtan_station_info{ width:900px; height:70px; margin: 10px auto; border:1px solid lightgray; display:flex; flex-direction: column; text-align: left; padding:10px; box-sizing: border-box; }
#dongtan_station_wrap #dongtan_station_info span{ padding-left:70px; color : #727070; font-size: 14px; margin-bottom: 5px; }
#dongtan_station_wrap #public_transportation { width:900px;  margin: 0 auto; }
#dongtan_station_wrap #public_transportation #subway { width:900px; height:50px;  margin: 10px 0; justify-content: center;  margin-top:10px; border:1px solid lightgray; line-height: 50px; padding-left:75px; box-sizing: border-box;  }
#dongtan_station_wrap #public_transportation #right_subway{ width:900px;  margin: 0 auto; text-align: center;  border:1px solid lightgray; line-height:120px;  }
#dongtan_station_wrap #public_transportation span{ color : #c64208; font-size: 14px; }
#dongtan_station_wrap #public_transportation #bus { border:1px solid lightgray; text-align: left; padding : 30px; box-sizing: border-box; }
#dongtan_station_wrap #public_transportation p{ box-sizing:border-box; font-size: 14px; display: inline-block;  height:100px; width:500px; vertical-align: middle; display:inline-block; border-bottom: 1px solid lightgray; }
#dongtan_station_wrap #public_transportation .left_p{ color : #727070; font-weight: bold; display:inline-block; width:250px; line-height: 40px; text-align: left; border-right:1px solid lightgray; margin-left:60px; }
#dongtan_station_wrap #public_transportation .right_p{ width:520px; padding-left : 50px; box-sizing: border-box; }
#dongtan_station_wrap #public_transportation p #green_span{ color:green; }
#dongtan_station_wrap #public_transportation p #red_span{ color:red; } 
#dongtan_station_wrap #public_transportation p #gang_span{ color:red; }
#dongtan_station_wrap #public_transportation p #braun_span{ color:brown; }
#dongtan_station_wrap #public_transportation p #sky_span{ color:skyblue; }

gang_span
</style>
</head>
<body>
<!-- 정차역 상세안내 페이지 -->
<div id="dongtan_station_wrap">
<h1>동탄역</h1>
	<div id="infomenu_div">
		<a href="#">홈&nbsp;》&nbsp;</a>
		<a href="#">이용안내&nbsp;》&nbsp;</a>
		<a href="#">정차역이용안내&nbsp;》&nbsp;</a>
		<a href="#">동탄역</a>
	</div>
<div id="container" class="view_map">
	    <div id="mapWrapper" >
	        <div id="map" ></div> <!-- 지도를 표시할 div 입니다 --> 
	    </div>
     </div>
    <div id="dongtan_station_info">
	    <span>§ 주소 : 경기 화성시 동탄역로 지하 151 (우)18478</span>
	    <span>§ 문의 : 1800 - 1472</span>
    </div>
    <div id="public_transportation">
    	<!-- <div id="subway">
    		<span>- 부산지하철 1호선 부산역 하차후 도보 3분  |  초량역 2번출구 도보 9분 -</span>
    	</div> -->
    	<div id="bus">
			<p class="left_p">＊동탄역 (서측)(55398)</p>
                <p class="right_p">
                     <span id="braun_span">[공항]</span>8837<br>
                    <span id="green_span">[일반]</span> 1001, 12, 150, 200, 203, 205, 45, 51, 701, 760<br>
                    <span id="sky_span">[마을]</span> 19-3, 39(동찬물류단지북측-동탄역(서측)), 760<br>
                    <span id="red_span">[급행]</span> 1001, 1003, 1003(심야)</p><br><br><br><br>
            
			<p class="left_p">＊동탄역 (동측)(55399)</p>
                <p class="right_p">
                    <span id="braun_span">[공항]</span>8837<br>
                    <span id="green_span">[일반]</span>1000, 1001, 12, 150, 200, 203, 205, 51, 701, 9<br>
                    <span id="sky_span">[마을]</span>17, 19-3,709, 81, 90(평일), H1, H17, H18, H2<br>
                    <span id="red_span">[급행]</span>G6010</p><br><br><br><br>
            
			<p class="left_p">＊업무복합부지(55494)</p>
                <p class="right_p">
                    <span id="green_span">[일반]</span>71<br>
                    <span id="sky_span">[마을]</span>17,709, H17<br>
                    <span id="red_span">[급행]</span>6004</p><br><br><br><br>
            
			<p class="left_p">＊롯데캐슬,포스코더샵(36436)</p>
                <p class="right_p">
                    <span id="gang_span">[광역]</span>M4130, M4434<br>
                    <span id="green_span">[일반]</span>1000, 1001, 5-3, 701, 9, 94, 99, H67<br>
                    <span id="sky_span">[마을]</span>17,19-1, 19-3, 709, 81, H2, H4(심야)<br>
                    <span id="red_span">[급행]</span>6001, 6003, 6008, 7200</p><br><br><br><br>
            
			<p class="left_p">＊업무복합부지(55495)</p>
                <p class="right_p">
                    <span id="green_span">[일반]</span>71<br>
                    <span id="sky_span">[마을]</span>17, 709, H17<br>
                     <span id="red_span">[급행]</span>6004<br><br><br>
                </p>
            
			<!--<p class="left_p">＊부산역(03064)</p>
                <p class="right_p"><span id="green_span">[일반]</span> 101, 190, 508, 66, 82, 85, 88, 88-1</p><br>
            
			<p class="left_p">＊부산역후문(03062)</p>
                <p class="right_p"><span id="green_span">[일반]</span> 5-1</p><br>
            
			<p class="left_p">＊초량시장입구(03074)</p>
                <p class="right_p"><span id="green_span">[일반]</span> 190, 508</p><br>
            
			<p class="left_p">＊국민은행(03065)</p><p class="right_p"><span id="green_span">[일반]</span> 103, 22</p><br>-->
    	</div>
    </div>
</div>

</body>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a5fac192cc4bee20c2660a9fa322fa96"></script>
<script>
	var container = document.getElementById('container'), // 지도와 로드뷰를 감싸고 있는 div
    mapWrapper = document.getElementById('mapWrapper'), // 지도를 감싸고 있는 div
    mapContainer = document.getElementById('map'); // 지도를 표시할 div 

	var placePosition = new kakao.maps.LatLng(37.199754, 127.096288);// 지도와 로드뷰 위에 마커로 표시할 특정 장소의 좌표
	var mapOption = { // 지도 옵션입니다 
	    center: placePosition, // 지도의 중심좌표 
	    level: 3 }; // 지도의 확대 레벨
	var map = new kakao.maps.Map(mapContainer, mapOption);// 지도를 표시할 div와 지도 옵션으로 지도를 생성
	
	// 지도 중심을 표시할 마커를 생성하고 특정 장소 위에 표시합니다 
	var mapMarker = new kakao.maps.Marker({
	    position: placePosition,
	    map: map
	});
	

</script>