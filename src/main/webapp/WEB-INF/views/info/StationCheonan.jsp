<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
#cheonan_station_wrap { margin: 0 auto; width: 1280px; }
#cheonan_station_wrap h1 { text-align:center; margin-bottom: 50px; }
#cheonan_station_wrap #infomenu_div { margin: 0 auto; text-align:right;  border-bottom: 2px solid gray; width: 900px; height: 30px; }
#cheonan_station_wrap #infomenu_div a{ text-decoration: none; color: black; }
#cheonan_station_wrap #infomenu_div a:nth-last-of-type(1){font-weight: bold;}

#cheonan_station_wrap #container { width:900px;	height:550px; margin:0 auto; border:1px solid gray; border-radius: 5px; margin-top:10px; box-shadow:  0px 0px 5px gray;}
#cheonan_station_wrap #container #mapWrapper { margin:0 auto; width:900px; height:550px; position:relative; z-index: 1; }
#cheonan_station_wrap #container #btnRoadview { display: none; } 
#cheonan_station_wrap #container #mapWrapper #map{ width:100%; height:100%; }

#cheonan_station_wrap #cheonan_station_info{ width:900px; height:65px; margin: 10px auto; border:1px solid lightgray; display:flex; flex-direction: column; text-align: left; padding:10px; box-sizing: border-box; }
#cheonan_station_wrap #cheonan_station_info span{ padding-left:70px; color : #727070; font-size: 14px; margin-bottom: 5px; }
#cheonan_station_wrap #public_transportation { width:900px;  margin: 0 auto; }
#cheonan_station_wrap #public_transportation #subway { width:900px; height:50px;  margin: 10px 0; justify-content: center;  margin-top:10px; border:1px solid lightgray; line-height: 50px; padding-left:75px; box-sizing: border-box;  }
#cheonan_station_wrap #public_transportation span{ color : #c64208; font-size: 14px; }
#cheonan_station_wrap #public_transportation #bus { border:1px solid lightgray; text-align: left; padding : 10px; box-sizing: border-box; }
#cheonan_station_wrap #public_transportation p{border-bottom: 1px solid lightgray;  box-sizing:border-box; font-size: 14px; display: inline-block;  height:120px; width:500px; vertical-align: middle; display:inline-block; }
#cheonan_station_wrap #public_transportation .left_p{ color : #727070; font-weight: bold; display:inline-block; width:250px; line-height: 90px; text-align: left; border-right:1px solid lightgray; margin-left:60px;  }
#cheonan_station_wrap #public_transportation .right_p{ width:520px; padding-left : 50px; box-sizing: border-box; } 
#cheonan_station_wrap #public_transportation p #green_span{ color:green; }
#cheonan_station_wrap #public_transportation p #red_span{ color:red; }
#cheonan_station_wrap #public_transportation p #purple_span{ color:violet; }
#cheonan_station_wrap #public_transportation p #blue_span{ color:blue; }
</style>
</head>
<body>
<!-- 정차역 상세안내 페이지 -->
<div id="cheonan_station_wrap">
<h1>천안아산역</h1>
	<div id="infomenu_div">
		<a href="#">홈&nbsp;》&nbsp;</a>
		<a href="#">이용안내&nbsp;》&nbsp;</a>
		<a href="#">정차역이용안내&nbsp;》&nbsp;</a>
		<a href="#">천안아산역</a>
	</div>
	<div id="container" class="view_map">
	    <div id="mapWrapper" >
	        <div id="map" ></div> <!-- 지도를 표시할 div 입니다 --> 
	    </div>
     </div>
    <div id="cheonan_station_info">
	    <span>§ 주소 : 충남 아산시 배방읍 희망로 100 (우)31470</span>
	    <span>§ 문의 : 1544-7788</span>
    </div>
    <div id="public_transportation">
    	<div id="subway">
    		<span>- 아산역 1번 출구 도보 5분 -</span>
    	</div>
    	<div id="bus">
			<p class="left_p">＊천안아산역(2022)	</p><p class="right_p"><span id="blue_span">[간선]</span> 990(고속터미널-롯데캐슬1단지), 990(롯데캐슬1단지-종합터미널), 991(롯데캐슬1단지-천안아산역), 991(천안아산역-롯데캐슬1단지)<br><span id="green_span">[일반]</span>13(천안아산역-단대병원), 19(천안아산역-직산대림아파트), 20(천안아산역-단대병원), 90(천안아산역-종합터미널)</p><br>
			<p class="left_p">＊천안아산역(71625)</p><p class="right_p"><span id="green_span">[일반]</span> 13(단대병원-천안아산역), 19(직산대림아파트-천안아산역), 20(단대병원-천안아산역), 21(백석농공단지-청당벽산아파트), 21(청당벽산아파트-백석농공단지), 90(고속터미널-천안아산역) <br><span id="purple_span">[지선]</span> 80(배방환승정류장-세교1리)<br><span id="red_span">[일반]</span> 21(백석농공단지-청당벽산아파트)</p><br>
			<p class="left_p">＊패션2광장(2217)</p><p class="right_p"><span id="blue_span">[간선]</span> 777(동암1교차로-배방환승정류장), 990(롯데캐슬1단지-종합터미널), 991(롯데캐슬1단지-천안아산역) <br><span id="red_span">[급행]</span> 1000, 1000(심야), 1001</p><br>
			<p class="left_p">＊아산패션1광장(2049)</p><p class="right_p"><span id="blue_span">[간선]</span> 990(롯데캐슬1단지-종합터미널) <br><span id="green_span">[일반]</span> 1(백석농공단지-천안시청) </p><br>
			<p class="left_p">＊패션2광장(2220)</p><p class="right_p"><span id="blue_span">[간선]</span> 777(배방환승정류장-동암1교차로), 990(고속터미널-롯데캐슬1단지), 991(천안아산역-롯데캐슬1단지)<br><span id="purple_span">[지선]</span> 80(세교1리-배방환승정류장), 81(한성아파트정문-배방환승정류장)<br><span id="red_span">[일반]</span> 21(청당벽산아파트-백석농공단지) </p><br>
			<p class="left_p">＊패션1광장(2050)</p><p class="right_p"><span id="green_span">[일반]</span> 1(천안시청-백석농공단지) </p><br>
    	</div>
    </div>
</div>

</body>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a5fac192cc4bee20c2660a9fa322fa96"></script>
<script>
	var container = document.getElementById('container'), // 지도와 로드뷰를 감싸고 있는 div
    mapWrapper = document.getElementById('mapWrapper'), // 지도를 감싸고 있는 div
    mapContainer = document.getElementById('map'); // 지도를 표시할 div 

	var placePosition = new kakao.maps.LatLng(36.794442, 127.104560);// 지도와 로드뷰 위에 마커로 표시할 특정 장소의 좌표
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