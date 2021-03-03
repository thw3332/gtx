<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
#dongdaegu_station_wrap { margin: 0 auto; width: 1280px; }
#dongdaegu_station_wrap h1 { text-align:center; margin-bottom: 50px; }
#dongdaegu_station_wrap #infomenu_div { margin: 0 auto; text-align:right;  border-bottom: 2px solid gray; width: 900px; height: 30px; }
#dongdaegu_station_wrap #infomenu_div a{ text-decoration: none; color: black; }
#dongdaegu_station_wrap #infomenu_div a:nth-last-of-type(1){font-weight: bold;}

#dongdaegu_station_wrap #container { width:900px;	height:550px; margin:0 auto; border:1px solid gray; border-radius: 5px; margin-top:10px; box-shadow:  0px 0px 5px gray;}
#dongdaegu_station_wrap #container #mapWrapper { margin:0 auto; width:900px; height:550px; position:relative; z-index: 1; }
#dongdaegu_station_wrap #container #btnRoadview { display: none; }
#dongdaegu_station_wrap #container #mapWrapper #map{ width:100%; height:100%; }

#dongdaegu_station_wrap #dongdaegu_station_info{ width:900px; height:90px; margin: 10px auto; border:1px solid lightgray; display:flex; flex-direction: column; text-align: left; padding:10px; box-sizing: border-box; }
#dongdaegu_station_wrap #dongdaegu_station_info span{ padding-left:70px; color : #727070; font-size: 14px; margin-bottom: 5px; }
#dongdaegu_station_wrap #public_transportation { width:900px;  margin: 0 auto; }
#dongdaegu_station_wrap #public_transportation #subway { width:900px; height:50px;  margin: 10px 0; justify-content: center;  margin-top:10px; border:1px solid lightgray; line-height: 50px; padding-left:75px; box-sizing: border-box;  }
#dongdaegu_station_wrap #public_transportation #right_subway{ width:900px;  margin: 0 auto; text-align: center;  border:1px solid lightgray; line-height:120px;  }
#dongdaegu_station_wrap #public_transportation span{ color : #c64208; font-size: 14px; }
#dongdaegu_station_wrap #public_transportation #bus { border:1px solid lightgray; text-align: left; padding : 10px; box-sizing: border-box; }
#dongdaegu_station_wrap #public_transportation p{ box-sizing:border-box; font-size: 14px; display: inline-block;  height:80px; width:500px; vertical-align: middle; display:inline-block;border-bottom: 1px solid lightgray;  }
#dongdaegu_station_wrap #public_transportation .left_p{ color : #727070; font-weight: bold; display:inline-block; width:250px; line-height: 40px; text-align: left; border-right:1px solid lightgray; margin-left:60px; }
#dongdaegu_station_wrap #public_transportation .right_p{ width:520px; padding-left : 50px; box-sizing: border-box; }
#dongdaegu_station_wrap #public_transportation p #green_span{ color:green; } 
#dongdaegu_station_wrap #public_transportation p #red_span{ color:red; } 

</style>
</head>
<body>
<!-- 정차역 상세안내 페이지 -->
<div id="dongdaegu_station_wrap">
<h1>동대구역</h1>
	<div id="infomenu_div">
		<a href="#">홈&nbsp;》&nbsp;</a>
		<a href="#">이용안내&nbsp;》&nbsp;</a>
		<a href="#">정차역이용안내&nbsp;》&nbsp;</a>
		<a href="#">동대구역</a>
	</div>
	<div id="container" class="view_map">
	    <div id="mapWrapper" >
	        <div id="map" ></div> <!-- 지도를 표시할 div 입니다 --> 
	    </div>
     </div>
    <div id="dongdaegu_station_info">
	    <span>§ 주소 : 대구 동구 동대구로 550 (우)41229</span>
	    <span>§ 문의 : 1544-7788</span>
	    <span>§ 팔공산 정기와 낙동강이 감도는 곳에 자리잡은 역, 고속터미널, 시외버스 정류장이 인접해 있기 때문에 시내ㆍ외 교통망 편리</span>
    </div>
    <div id="public_transportation">
    	<div id="subway">
    		<span>- 동대구역 1호선 3번출구 도보 4분  |  동구청역 2번출구 도보 11분 -</span>
    	</div>
    	<div id="bus">
			<p class="left_p">＊동대구역(2523)</p><p class="right_p"><span id="green_span">[간선]</span> 156, 413, 524, 708<br><span id="red_span">[지선]</span>북구3, 수성4<br></p>
			<p class="left_p">＊동대구역복합환승센터</p><p class="right_p"><span id="green_span">[농어촌]</span>0(대구)(풍각-대구), 0(대구)(풍각-무열대건너-대구)<br><span id="red_span">[급행]</span> 1000, 1000(심야), 1004, 1004(심야)</p><br>
			<p class="left_p">＊동대구역지하도1(09198)</p><p class="right_p"><span id="green_span">[간선]</span>101<br><span id="red_span">[급행]</span>급행1</p><br>
			<p class="left_p">＊동대구역건너(2004)</p><p class="right_p"><span id="green_span">[간선]</span>156,413,524,708<br><span id="red_span">[자선]</span> 북구3, 수성4</p><br>
		</div>
    </div>
</div>

</body>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a5fac192cc4bee20c2660a9fa322fa96"></script>
<script>
	var container = document.getElementById('container'), // 지도와 로드뷰를 감싸고 있는 div
    mapWrapper = document.getElementById('mapWrapper'), // 지도를 감싸고 있는 div
    mapContainer = document.getElementById('map'); // 지도를 표시할 div 

	var placePosition = new kakao.maps.LatLng(35.879619, 128.628365);// 지도와 로드뷰 위에 마커로 표시할 특정 장소의 좌표
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