<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
#busan_station_wrap { margin: 0 auto; width: 1280px;  }
#busan_station_wrap h1 { text-align:center; margin-bottom: 50px; }
#busan_station_wrap #infomenu_div { margin: 0 auto; text-align:right;  border-bottom: 2px solid gray; width: 900px; height: 30px; }
#busan_station_wrap #infomenu_div a{ text-decoration: none; color: black; }
#busan_station_wrap #infomenu_div a:nth-last-of-type(1){font-weight: bold;}

#busan_station_wrap #container { width:900px;	height:550px; margin:0 auto; border:1px solid gray; border-radius: 5px; margin-top:10px; box-shadow:  0px 0px 5px gray;}
#busan_station_wrap #container #mapWrapper { margin:0 auto; width:900px; height:550px;  }
#busan_station_wrap #container #btnRoadview { display: none; }
#busan_station_wrap #container #mapWrapper #map{ width:100%; height:100%; }

#busan_station_wrap #busan_station_info{ width:900px; height:90px; margin: 10px auto; border:1px solid lightgray; display:flex; flex-direction: column; text-align: left; padding:10px; box-sizing: border-box; }
#busan_station_wrap #busan_station_info span{ padding-left:70px; color : #727070; font-size: 14px; margin-bottom: 5px; }
#busan_station_wrap #public_transportation { width:900px;  margin: 0 auto; }
#busan_station_wrap #public_transportation #subway { width:900px; height:50px;  margin: 10px 0; justify-content: center;  margin-top:10px; border:1px solid lightgray; line-height: 50px; padding-left:75px; box-sizing: border-box;  }
#busan_station_wrap #public_transportation span{ color : #c64208; font-size: 14px; }
#busan_station_wrap #public_transportation #bus { border:1px solid lightgray; text-align: left; padding : 10px; box-sizing: border-box; }
#busan_station_wrap #public_transportation p{ border-bottom: 1px solid lightgray; box-sizing:border-box; font-size: 14px; display: inline-block;  height:60px; width:500px; vertical-align: middle; display:inline-block; }
#busan_station_wrap #public_transportation .left_p{ color : #727070; font-weight: bold; display:inline-block; width:250px; line-height: 40px; text-align: left; border-right:1px solid lightgray; margin-left:60px;  }
#busan_station_wrap #public_transportation .right_p{ width:520px; padding-left : 50px; box-sizing: border-box; }
#busan_station_wrap #public_transportation p #green_span{ color:green; }
#busan_station_wrap #public_transportation p #red_span{ color:red; }
</style>
</head>
<body>
<!-- 정차역 상세안내 페이지 -->
<div id="busan_station_wrap">
<h1>부산역</h1>
	<div id="infomenu_div">
		<a href="#">홈》</a>
		<a href="#">이용안내》</a>
		<a href="#">정차역이용안내》</a>
		<a href="#">부산역</a>
	</div>
    <div id="container" class="view_map">
	    <div id="mapWrapper" >
	        <div id="map" ></div> <!-- 지도를 표시할 div 입니다 --> 
	    </div>
     </div>
    <div id="busan_station_info">
	    <span>§ 주소 : 부산 동구 중앙대로 206 (우)48760</span>
	    <span>§ 문의 : 1544-7788</span>
	    <span>§ 부산시 중앙에 위치하여 우리나라 제 1의 항구도시의 관문으로서 1905년영업을 개시</span>
    </div>
    <div id="public_transportation">
    	<div id="subway">
    		<span>- 부산지하철 1호선 부산역 하차후 도보 3분  |  초량역 2번출구 도보 9분 -</span>
    	</div>
    	<div id="bus">
			<p class="left_p">＊부산역(03063)</p><p class="right_p"><span id="green_span">[일반]</span> 101, 134, 26, 27, 40, 41, 43, 82<br><span id="red_span">[급행]</span> 1001, 1003, 1003(심야)</p><br>
			<p class="left_p">＊부산역(03060)</p><p class="right_p"><span id="green_span">[일반]</span> 103, 167, 17, 190, 2, 508, 59, 61, 66, 67, 81, 85, 87, 88, 88-1<br><span id="red_span">[급행]</span> 1000, 1000(심야), 1004, 1004(심야)</p><br>
			<p class="left_p">＊부산역(03054)</p><p class="right_p"><span id="green_span">[일반]</span> 134, 167, 17, 2, 43, 61, 67<br><span id="red_span">[급행]</span> 1000, 1000(심야), 1001</p><br>
			<p class="left_p">＊부산역(03058)</p><p class="right_p"><span id="green_span">[일반]</span> 103, 26, 27, 40, 41, 59, 81, 87<br><span id="red_span">[급행]</span> 1003, 1003(심야), 1004, 1004(심야)</p><br>
			<p class="left_p">＊부산역후문(03061)</p><p class="right_p"><span id="green_span">[일반]</span> 5-1</p><br>
			<p class="left_p">＊부산역(03064)</p><p class="right_p"><span id="green_span">[일반]</span> 101, 190, 508, 66, 82, 85, 88, 88-1</p><br>
			<p class="left_p">＊부산역후문(03062)</p><p class="right_p"><span id="green_span">[일반]</span> 5-1</p><br>
			<p class="left_p">＊초량시장입구(03074)</p><p class="right_p"><span id="green_span">[일반]</span> 190, 508</p><br>
			<p class="left_p">＊국민은행(03065)</p><p class="right_p"><span id="green_span">[일반]</span> 103, 22</p><br>
    	</div>
    </div>
</div>

</body>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a5fac192cc4bee20c2660a9fa322fa96"></script>
<script>
	var container = document.getElementById('container'), // 지도와 로드뷰를 감싸고 있는 div
    mapWrapper = document.getElementById('mapWrapper'), // 지도를 감싸고 있는 div
    mapContainer = document.getElementById('map'); // 지도를 표시할 div 

	var placePosition = new kakao.maps.LatLng(35.114882, 129.041524);// 지도와 로드뷰 위에 마커로 표시할 특정 장소의 좌표
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