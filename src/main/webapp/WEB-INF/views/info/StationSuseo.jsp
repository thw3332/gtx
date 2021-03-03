<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
#suseo_station_wrap { margin: 0 auto; width: 1280px; }
#suseo_station_wrap h1 { text-align:center; margin-bottom: 50px; }
#suseo_station_wrap #infomenu_div { margin: 0 auto; text-align:right;  border-bottom: 2px solid gray; width: 900px; height: 30px; }
#suseo_station_wrap #infomenu_div a{ text-decoration: none; color: black; }
#suseo_station_wrap #infomenu_div a:nth-last-of-type(1){font-weight: bold;}

#suseo_station_wrap #container { width:900px;	height:550px; margin:0 auto; border:1px solid gray; border-radius: 5px; margin-top:10px; box-shadow:  0px 0px 5px gray;}
#suseo_station_wrap #container #mapWrapper { margin:0 auto; width:900px; height:550px; position:relative; z-index: 1; }
#suseo_station_wrap #container #btnRoadview { display: none; }
#suseo_station_wrap #container #mapWrapper #map{ width:100%; height:100%; }

#suseo_station_wrap #suseo_station_info { width:900px; height:70px; margin: 10px auto; border:1px solid lightgray; display:flex; flex-direction: column; text-align: left; padding:10px; box-sizing: border-box; }
#suseo_station_wrap #suseo_station_info span{ padding-left:70px; color : #727070; font-size: 14px; margin-bottom: 5px; }
#suseo_station_wrap #public_transportation { width:900px;  margin: 0 auto; }
#suseo_station_wrap #public_transportation #subway { width:900px; height:50px;  margin: 10px 0; justify-content: center;  margin-top:10px; border:1px solid lightgray; line-height: 50px; padding-left:75px; box-sizing: border-box;  }
#suseo_station_wrap #public_transportation #right_subway{ width:900px;  margin: 0 auto; text-align: center;  border:1px solid lightgray; line-height:120px;  }
#suseo_station_wrap #public_transportation span{ color : #c64208; font-size: 14px; }
#suseo_station_wrap #public_transportation #bus { border:1px solid lightgray; text-align: left; padding : 10px; box-sizing: border-box; }
#suseo_station_wrap #public_transportation p{ box-sizing:border-box; font-size: 14px; display: inline-block;  height:120px; width:500px; vertical-align: middle; display:inline-block; border-bottom: 1px solid lightgray; }
#suseo_station_wrap #public_transportation .left_p{ color : #727070; font-weight: bold; display:inline-block; width:250px; line-height: 40px; text-align: left; border-right:1px solid lightgray; margin-left:60px; }
#suseo_station_wrap #public_transportation .right_p{ width:520px; padding-left : 50px; box-sizing: border-box; }
#suseo_station_wrap #public_transportation p #green_span{ color:green; }
#suseo_station_wrap #public_transportation p #red_span{ color:red; }
#suseo_station_wrap #public_transportation p #sky_span{ color: skyblue;}
#suseo_station_wrap #public_transportation p #braun_span{ color: brown;}
</style>
</head>
<body>
<!-- 정차역 상세안내 페이지 -->
<div id="suseo_station_wrap">
<h1>수서역</h1>
	<div id="infomenu_div">
		<a href="#">홈&nbsp;》&nbsp;</a>
		<a href="#">이용안내&nbsp;》&nbsp;</a>
		<a href="#">정차역이용안내&nbsp;》&nbsp;</a>
		<a href="#">수서역</a>
	</div>
	<div id="container" class="view_map">
	    <div id="mapWrapper" >
	        <div id="map" ></div> <!-- 지도를 표시할 div 입니다 --> 
	    </div>
     </div>
    <div id="suseo_station_info">
	    <span>§ 주소 : 서울 강남구 밤고개로 99 (우)06369</span>
	    <span>§ 문의 : 1800-1472</span>
    </div>
    <div id="public_transportation">
    	<div id="subway">
    		<span>- 수서역③  |   5번출구 도보 6분 -</span>
    	</div>
    	<div id="bus">
			<p class="left_p">＊고속철도수서역(23150)</p>
                <p class="right_p">
					<span id="sky_span">[간선]</span> 343, 402<br>
					<span id="green_span">[지선]</span> 2412, 3146, 3425, 3426, 4419<br>
					<span id="green_span">[일반]</span> 101, 331, 87<br>
					<span id="sky_span">[마을]</span> 강남03, 강남06,강남06-1, 강남06-2<br>
					<span id="red_span">[급행]</span> 1007, 1007-1, 5600, 5700A, 5700B, 6900 <br>
					<span id="purple_span">[시외]</span> 3300</p><br><br><br><br>
            
            <p class="left_p">＊고속철도수서역(23320)</p>
                <p class="right_p">
                    <span id="sky_span">[간선]</span> 402<br>
                     <span id="green_span">[지선]</span> 3425, 3426, 4419<br>
                    <span id="green_span">[일반]</span> 101, 331<br>
                     <span id="red_span">[급행]</span> 1007, 1007-1, 500-2, 5600, 5700A, 5700B, 6900</p><br><br><br><br>
            
			<p class="left_p">＊수서역5번출구.이마트 앞(23544)</p>
                <p class="right_p">
                    <span id="sky_span">[마을]</span> 강남03, 강남06,강남06-1, 강남06-2</p><br><br><br><br>
            
			<p class="left_p">＊수서역5번출구(23409)</p>
                <p class="right_p">
                      <span id="green_span">[지선]</span> 2412,3416,8441(맟춤버스)(평일)<br>
                    <span id="green_span">[일반]</span> 101,331,87<br>
                    <span id="red_span">[급행]</span> 1007, 1007-1, 5600, 5700A, 5700B, 6900</p><br><br><br><br>
			<p class="left_p">＊수서역(23408)</p>
                <p class="right_p">
                    <span id="sky_span">[간선]</span> 343, 402<br>
                     <span id="green_span">[지선]</span> 2412, 3416, 3425, 3426, 4419<br>
                    <span id="green_span">[일반]</span> 101, 331, 87<br>
                     <span id="sky_span">[마을]</span> 강남03, 강남06, 강남06-1, 강남06-2<br>
                    <span id="red_span">[급행]</span> 1007, 1007-1, 500-2, 5600, 5700A, 5700B, 6900</p><br><br><br><br>
            
			<p class="left_p">＊쟁골마을(03426)</p>
                <p class="right_p">
                    <span id="sky_span">[간선]</span>402<br>
                     <span id="green_span">[지선]</span> 2412, 3416, 3425, 3426, 3426, 4419<br>
                    <span id="green_span">[일반]</span> 101<br>
                     <span id="sky_span">[마을]</span> 강남03, 강남06, 강남06-1, 강남06-2<br>
                    <span id="red_span">[급행]</span> 5600, 5700A, 5700B</p><br><br><br><br>
            
			<p class="left_p">＊수서역.로즈데일빌딩(23410)</p>
                <p class="right_p">
                     <span id="sky_span">[간선]</span>333, 401, 461, N37(심야)<br>
                     <span id="green_span">[지선]</span> 3011, 3413, 3416<br>
                    <span id="braun_span">[광역]</span>M5333<br>
                    <span id="braun_span">[공항]</span>6300<br>
                    <span id="green_span">[일반]</span> 101, 16, 331, 87</p><br><br><br><br>
    	</div>
    </div>
</div> 

</body>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a5fac192cc4bee20c2660a9fa322fa96"></script>
<script>
	var container = document.getElementById('container'), // 지도와 로드뷰를 감싸고 있는 div
    mapWrapper = document.getElementById('mapWrapper'), // 지도를 감싸고 있는 div
    mapContainer = document.getElementById('map'); // 지도를 표시할 div 

	var placePosition = new kakao.maps.LatLng(37.485479, 127.104414);// 지도와 로드뷰 위에 마커로 표시할 특정 장소의 좌표
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