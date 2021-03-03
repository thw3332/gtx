<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
#jije_station_wrap { margin: 0 auto; width: 1280px; }
#jije_station_wrap h1 { text-align:center; margin-bottom: 50px; }
#jije_station_wrap #infomenu_div { margin: 0 auto; text-align:right;  border-bottom: 2px solid gray; width: 900px; height: 30px; }
#jije_station_wrap #infomenu_div a{ text-decoration: none; color: black; }
#jije_station_wrap #infomenu_div a:nth-last-of-type(1){font-weight: bold;}

#jije_station_wrap #container { width:900px;	height:550px; margin:0 auto; border:1px solid gray; border-radius: 5px; margin-top:10px; box-shadow:  0px 0px 5px gray;}
#jije_station_wrap #container #mapWrapper { margin:0 auto; width:900px; height:550px; position:relative; z-index: 1; }
#jije_station_wrap #container #btnRoadview { display: none; }
#jije_station_wrap #container #mapWrapper #map{ width:100%; height:100%; }

#jije_station_wrap #jije_station_info{ width:900px; height:70px; margin: 10px auto; border:1px solid lightgray; display:flex; flex-direction: column; text-align: left; padding:10px; box-sizing: border-box; }
#jije_station_wrap #jije_station_info span{ padding-left:70px; color : #727070; font-size: 14px; margin-bottom: 5px; }
#jije_station_wrap #public_transportation { width:900px;  margin: 0 auto; }
#jije_station_wrap #public_transportation #subway { width:900px; height:50px;  margin: 10px 0; justify-content: center;  margin-top:10px; border:1px solid lightgray; line-height: 50px; padding-left:75px; box-sizing: border-box;  }
#jije_station_wrap #public_transportation #right_subway{ width:900px;  margin: 0 auto; text-align: center;  border:1px solid lightgray; line-height:120px;  }
#jije_station_wrap #public_transportation span{ color : #c64208; font-size: 14px; }
#jije_station_wrap #public_transportation #bus { border:1px solid lightgray; text-align: left; padding : 10px; box-sizing: border-box; }
#jije_station_wrap #public_transportation p{ box-sizing:border-box; font-size: 14px; display: inline-block;  height:100px; width:500px; vertical-align: middle; display:inline-block; border-bottom: 1px solid lightgray; }
#jije_station_wrap #public_transportation .left_p{ color : #727070; font-weight: bold; display:inline-block; width:250px; line-height: 40px; text-align: left; border-right:1px solid lightgray; margin-left:60px; }
#jije_station_wrap #public_transportation .right_p{ width:520px; padding-left : 50px; box-sizing: border-box; }
#jije_station_wrap #public_transportation p #green_span{ color:green; }
#jije_station_wrap #public_transportation p #red_span{ color:red; } 
#jije_station_wrap #public_transportation p #purple_span{ color:purple; }    
#jije_station_wrap #public_transportation p  #braun_span{ color:brown; }
#jije_station_wrap #public_transportation p  #sky_span{ color:skyblue; }
#jije_station_wrap #public_transportation p  #jwa_span{ color:skyblue; }
  
</style>
</head>
<body>
<!-- 정차역 상세안내 페이지 -->
<div id="jije_station_wrap">
<h1>지제역</h1>
	<div id="infomenu_div">
		<a href="#">홈&nbsp;》&nbsp;</a>
		<a href="#">이용안내&nbsp;》&nbsp;</a>
		<a href="#">정차역이용안내&nbsp;》&nbsp;</a>
		<a href="#">지제역</a>
	</div>
	<div id="container" class="view_map">
	    <div id="mapWrapper" >
	        <div id="map" ></div> <!-- 지도를 표시할 div 입니다 --> 
	    </div>
     </div>
    <div id="jije_station_info">
	    <span>§ 주소 : 경기 평택시 지제동 559-4</span>
	    <span>§ 문의 : 1800-1472</span>
    </div>
    <div id="public_transportation">
    	<div id="subway">
    		<span>- 지제역 2번출구 도보 1분 -</span>
        </div>
    	<div id="bus">
			<p class="left_p">＊평택지제역(48880)</p>
                <p class="right_p">
                    <span id="braun_span">[광역]</span>M5438<br>
                    <span id="green_span">[일반]</span> 1000, 777, 999<br>
                    <span id="sky_span">[마을]</span> 16, 16-1</p><br><br><br><br>
            
			<p class="left_p">＊평택지제역(48130)</p>
                <p class="right_p">
                    <span id="green_span">[일반]</span>17, 2, 2-2, 20-1, 27, 29, 3(용이동차고지-금각1리)<br>
                    <span id="red_span">[좌석]</span>8000<br>
                    <span id="purple_span">[시외]</span>8455, 8456-1</p><br><br><br><br>
            
			<p class="left_p">＊평택지제역(15615)</p>
                <p class="right_p">
                    <span id="green_span">[일반]</span>1-1, 1000, 17, 2, 2-2, 20-1, 27, 29, 3(용이동차고지-금각1리)<br>
                    <span id="sky_span">[마을]</span> 16, 16-1<br>
                    <span id="purple_span">[시외]</span>8455, 8456-1</p><br><br><br><br>
            
			<p class="left_p">＊평택지제역(48961)</p>
                <p class="right_p">
                    <span id="green_span">[일반]</span>1-1, 100-1</p><br><br>
                    
            
			
    	</div>
    </div>
</div>

</body>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a5fac192cc4bee20c2660a9fa322fa96"></script>
<script>
	var container = document.getElementById('container'), // 지도와 로드뷰를 감싸고 있는 div
    mapWrapper = document.getElementById('mapWrapper'), // 지도를 감싸고 있는 div
    mapContainer = document.getElementById('map'); // 지도를 표시할 div 

	var placePosition = new kakao.maps.LatLng(37.018899, 127.070226);// 지도와 로드뷰 위에 마커로 표시할 특정 장소의 좌표
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