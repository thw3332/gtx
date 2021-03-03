<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
#daejeon_station_wrap { margin: 0 auto; width: 1280px; }
#daejeon_station_wrap h1 { text-align:center; margin-bottom: 50px; }
#daejeon_station_wrap #infomenu_div { margin: 0 auto; text-align:right;  border-bottom: 2px solid gray; width: 900px; height: 30px; }
#daejeon_station_wrap #infomenu_div a{ text-decoration: none; color: black; }
#daejeon_station_wrap #infomenu_div a:nth-last-of-type(1){font-weight: bold;}

#daejeon_station_wrap #container { width:900px;	height:550px; margin:0 auto; border:1px solid gray; border-radius: 5px; margin-top:10px; box-shadow:  0px 0px 5px gray;}
#daejeon_station_wrap #container #mapWrapper { margin:0 auto; width:900px; height:550px; position:relative; z-index: 1; }
#daejeon_station_wrap #container #btnRoadview { display: none; }
#daejeon_station_wrap #container #mapWrapper #map{ width:100%; height:100%; }

#daejeon_station_wrap #daejeon_station_info{ width:900px; height:70px; margin: 10px auto; border:1px solid lightgray; display:flex; flex-direction: column; text-align: left; padding:10px; box-sizing: border-box; }
#daejeon_station_wrap #daejeon_station_info span{ padding-left:70px; color : #727070; font-size: 14px; margin-bottom: 5px; }
#daejeon_station_wrap #public_transportation { width:900px;  margin: 0 auto; }
#daejeon_station_wrap #public_transportation #subway { width:900px; height:50px;  margin: 10px 0; justify-content: center;  margin-top:10px; border:1px solid lightgray; line-height: 50px; padding-left:75px; box-sizing: border-box;  }
#daejeon_station_wrap #public_transportation #right_subway{ width:900px;  margin: 0 auto; text-align: center;  border:1px solid lightgray; line-height:120px;  }
#daejeon_station_wrap #public_transportation span{ color : #c64208; font-size: 14px; }
#daejeon_station_wrap #public_transportation #bus { border:1px solid lightgray; text-align: left; padding : 10px; box-sizing: border-box; }
#daejeon_station_wrap #public_transportation p{ box-sizing:border-box; font-size: 14px; display: inline-block;  height:60px; width:500px; vertical-align: middle; display:inline-block; border-bottom: 1px solid lightgray;}
#daejeon_station_wrap #public_transportation .left_p{ color : #727070; font-weight: bold; display:inline-block; width:250px; line-height: 40px; text-align: left; border-right:1px solid lightgray; margin-left:60px; }
#daejeon_station_wrap #public_transportation .right_p{ width:520px; padding-left : 50px; box-sizing: border-box; }
#daejeon_station_wrap #public_transportation p #green_span{ color:green; }
#daejeon_station_wrap #public_transportation p #red_span{ color:red; } 

</style>
</head>
<body>
<!-- 정차역 상세안내 페이지 -->
<div id="daejeon_station_wrap">
<h1>대전역</h1>
	<div id="infomenu_div">
		<a href="#">홈&nbsp;》&nbsp;</a>
		<a href="#">이용안내&nbsp;》&nbsp;</a>
		<a href="#">정차역이용안내&nbsp;》&nbsp;</a>
		<a href="#">대전역</a>
	</div>
<div id="container" class="view_map">
	    <div id="mapWrapper" >
	        <div id="map" ></div> <!-- 지도를 표시할 div 입니다 --> 
	    </div>
     </div>
    <div id="daejeon_station_info">
	    <span>§ 주소 : 대전 동구 중앙로 215 (우)34626</span>
	    <span>§ 문의 : 1544-7788</span>
    </div>
    <div id="public_transportation">
    	<div id="subway">
    		<span>- 대전역 1호선 대전역 하차후 4번출구 도보 1분  |  중앙로역 1번출구 도보 14분 -</span>
    	</div>
    	<div id="bus">
			<p class="left_p">＊대전역(12410)</p><p class="right_p"><span id="green_span">[일반]</span>606, 611, 614, 622 
			<p class="left_p">＊대전역(12400)</p><p class="right_p"><span id="green_span">[일반]</span> 201, 202, 314, 512, 613, 616, 705, 711, 802<br><span id="red_span">[급행]</span> 2</p><br>
			<p class="left_p">＊대전역(14730)</p><p class="right_p"><span id="red_span">[광역]</span> 1001(BRT)</p><br>
			<p class="left_p">＊대전역(12390)</p><p class="right_p"><span id="green_span">[일반]</span> 314, 501, 613, 614, 622, 711, 802<br><span id="red_span">[급행]</span>2</p><br>
			<p class="left_p">＊대전역네거리(14230)</p><p class="right_p"><span id="green_span">[일반]</span>107,201,202</p><br>
		</div>
    </div>
</div>

</body>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a5fac192cc4bee20c2660a9fa322fa96"></script>
<script>
	var container = document.getElementById('container'), // 지도와 로드뷰를 감싸고 있는 div
    mapWrapper = document.getElementById('mapWrapper'), // 지도를 감싸고 있는 div
    mapContainer = document.getElementById('map'); // 지도를 표시할 div 

	var placePosition = new kakao.maps.LatLng(36.332317, 127.433878);// 지도와 로드뷰 위에 마커로 표시할 특정 장소의 좌표
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