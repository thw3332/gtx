<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
#kimcheon_station_wrap { margin: 0 auto; width: 1280px; }
#kimcheon_station_wrap h1 { text-align:center; margin-bottom: 50px; }
#kimcheon_station_wrap #infomenu_div { margin: 0 auto; text-align:right;  border-bottom: 2px solid gray; width: 900px; height: 30px; }
#kimcheon_station_wrap #infomenu_div a{ text-decoration: none; color: black; }
#kimcheon_station_wrap #infomenu_div a:nth-last-of-type(1){font-weight: bold;}

#kimcheon_station_wrap #container { width:900px;	height:550px; margin:0 auto; border:1px solid gray; border-radius: 5px; margin-top:10px; box-shadow:  0px 0px 5px gray;}
#kimcheon_station_wrap #container #mapWrapper { margin:0 auto; width:900px; height:550px; position:relative; z-index: 1; }
#kimcheon_station_wrap #container #btnRoadview { display: none; }
#kimcheon_station_wrap #container #mapWrapper #map{ width:100%; height:100%; }

#kimcheon_station_wrap #kimcheon_station_info{ width:900px; height:70px; margin: 10px auto; border:1px solid lightgray; display:flex; flex-direction: column; text-align: left; padding:10px; box-sizing: border-box; }
#kimcheon_station_wrap #kimcheon_station_info span{ padding-left:70px; color : #727070; font-size: 14px; margin-bottom: 5px; }
#kimcheon_station_wrap #public_transportation { width:900px;  margin: 0 auto; }
#kimcheon_station_wrap #public_transportation #subway { width:900px; height:50px;  margin: 10px 0; justify-content: center;  margin-top:10px; border:1px solid lightgray; line-height: 50px; padding-left:75px; box-sizing: border-box;  }
#kimcheon_station_wrap #public_transportation #right_subway{ width:900px;  margin: 0 auto; text-align: center;  border:1px solid lightgray; line-height:120px;  }
#kimcheon_station_wrap #public_transportation span{ color : #c64208; font-size: 14px; }
#kimcheon_station_wrap #public_transportation #bus { border:1px solid lightgray; text-align: left; padding : 10px; box-sizing: border-box; }
#kimcheon_station_wrap #public_transportation p{ box-sizing:border-box; font-size: 14px; display: inline-block;  height:100px; width:500px; vertical-align: middle; display:inline-block; border-bottom: 1px solid lightgray; }
#kimcheon_station_wrap #public_transportation .left_p{ color : #727070; font-weight: bold; display:inline-block; width:250px; line-height: 40px; text-align: left; border-right:1px solid lightgray; margin-left:60px; }
#kimcheon_station_wrap #public_transportation .right_p{ width:520px; padding-left : 50px; box-sizing: border-box; }
#kimcheon_station_wrap #public_transportation p #green_span{ color:green; }
#kimcheon_station_wrap #public_transportation p #red_span{ color:red; }  

</style>
</head>
<body>
<!-- 정차역 상세안내 페이지 -->
<div id="kimcheon_station_wrap">
<h1>김천(구미)역</h1>
	<div id="infomenu_div">
		<a href="#">홈&nbsp;》&nbsp;</a>
		<a href="#">이용안내&nbsp;》&nbsp;</a>
		<a href="#">정차역이용안내&nbsp;》&nbsp;</a>
		<a href="#">김천(구미)역</a>
	</div>
	<div id="container" class="view_map">
	    <div id="mapWrapper" >
	        <div id="map" ></div> <!-- 지도를 표시할 div 입니다 --> 
	    </div>
     </div>
    <div id="kimcheon_station_info">
	    <span>§ 주소 : 경북 김천시 남면 혁신1로 51 (우)39660 지번남면 | 옥산리 790</span>
	    <span>§ 문의 : 1544-7788</span>
    </div>
    <div id="public_transportation">
    	<!--<div id="subway">
    		<span>- 부산지하철 1호선 부산역 하차후 도보 3분  |  초량역 2번출구 도보 9분 -</span>
    	</div>-->
    	<div id="bus">
			<p class="left_p">＊KTX김천구미역/김천행(14641)</p>
                <p class="right_p">
                    <span id="green_span">[일반]</span> KTX11, KTX12, KTX15-9, KTX63, 김천12-0<br>
                    <span id="red_span">[좌석]</span>5000(구미종합터미널건너- 김천시외버스터미널종점), 김천12-0, 김천12-1, 김천12-2<br>
                    <span id="orange_span">[농어촌]</span>성주 - 김천(KTX김천역)</p><br><br><br><br>
            
			<p class="left_p">＊김천(구미)역 구미행(14040)</p>
                <p class="right_p">
                    <span id="green_span">[일반]</span>52-1(김천(구미)역구미행-선산터미널종점), 52-1(선산터미널종점-김천(구미)역구미행)<br>
                   <span id="red_span">[좌석]</span>52-1 (김천(구미)역구미행-선산터미널종점), 5000 (김천시외버스터미널(종점)-구미종합터미널앞)  </p><br><br><br><br><br><br>
          
			<p class="left_p">＊KTX김천구미역(15134)</p>
                <p class="right_p">
                    <span id="green_span">[일반]</span> KTX13-2, KTX14-6, KTX15, 길항12-6, 김천12-4,<br>
                   <span id="red_span">[좌석]</span>KTX113-2, 김천112-4, 시청112-9, 종상111-0<br>
                     <span id="orange_span">[농어촌]</span>김천-성주(KTX김천역), 김천-성주 (KTX김천역,성주고등학교)</p><br><br><br><br>
            
			<p class="left_p">＊KTX김천구미역(종점)(16217)</p>
                <p class="right_p">
                    <span id="green_span">[일반]</span> 순환1, 순환2, 순환3, 순환4, 정골12, 중앙13-2</p><br><br><br><br>
                   
          
			<p class="left_p">＊대한법률구조공단(16227)</p>
                <p class="right_p">
                    <span id="green_span">[일반]</span>김천12-6, 순환1, 순환2, 순환3, 순환4, 율곡11<br>
                    <span id="red_span">[좌석]</span>율곡111, 종상111</p><br><br><br>
            
			<p class="left_p">＊대한법률구조공단(15934)</p>
                <p class="right_p">
                    <span id="green_span">[일반]</span>갈항12-6, 김천12, 김천12-0, 김천12-1, 김천12-3<br>
                      <span id="red_span">[좌석]</span>김천112, 김천112-0, 김천112-3, 김천112-4</p><br><br><br><br>
			
    	</div>
    </div>
</div>

</body>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a5fac192cc4bee20c2660a9fa322fa96"></script>
<script>
	var container = document.getElementById('container'), // 지도와 로드뷰를 감싸고 있는 div
    mapWrapper = document.getElementById('mapWrapper'), // 지도를 감싸고 있는 div
    mapContainer = document.getElementById('map'); // 지도를 표시할 div 

	var placePosition = new kakao.maps.LatLng(36.113442, 128.180953);// 지도와 로드뷰 위에 마커로 표시할 특정 장소의 좌표
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