<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
#ohsong_station_wrap { margin: 0 auto; width: 1280px; }
#ohsong_station_wrap h1 { text-align:center; margin-bottom: 50px; }
#ohsong_station_wrap #infomenu_div { margin: 0 auto; text-align:right;  border-bottom: 2px solid gray; width: 900px; height: 30px; }
#ohsong_station_wrap #infomenu_div a{ text-decoration: none; color: black; }
#ohsong_station_wrap #infomenu_div a:nth-last-of-type(1){font-weight: bold;}

#ohsong_station_wrap #container { width:900px;	height:550px; margin:0 auto; border:1px solid gray; border-radius: 5px; margin-top:10px; box-shadow:  0px 0px 5px gray;}
#ohsong_station_wrap #container #mapWrapper { margin:0 auto; width:900px; height:550px; position:relative; z-index: 1; }
#ohsong_station_wrap #container #btnRoadview { display: none; }
#ohsong_station_wrap #container #mapWrapper #map{ width:100%; height:100%; }

#ohsong_station_wrap #ohsong_station_info{ width:900px; height:70px; margin: 10px auto; border:1px solid lightgray; display:flex; flex-direction: column; text-align: left; padding:10px; box-sizing: border-box; }
#ohsong_station_wrap #ohsong_station_info span{ padding-left:70px; color : #727070; font-size: 14px; margin-bottom: 5px; }
#ohsong_station_wrap #public_transportation { width:900px;  margin: 0 auto; }
#ohsong_station_wrap #public_transportation #subway { width:900px; height:50px;  margin: 10px 0; justify-content: center;  margin-top:10px; border:1px solid lightgray; line-height: 50px; padding-left:75px; box-sizing: border-box;  }
#ohsong_station_wrap #public_transportation #right_subway{ width:900px;  margin: 0 auto; text-align: center;  border:1px solid lightgray; line-height:120px;  }
#ohsong_station_wrap #public_transportation span{ color : #c64208; font-size: 14px; }
#ohsong_station_wrap #public_transportation #bus { border:1px solid lightgray; text-align: left; padding : 10px; box-sizing: border-box; }
#ohsong_station_wrap #public_transportation p{ box-sizing:border-box; font-size: 14px; display: inline-block;  height:100px; width:500px; vertical-align: middle; display:inline-block; border-bottom: 1px solid lightgray; }
#ohsong_station_wrap #public_transportation .left_p{ color : #727070; font-weight: bold; display:inline-block; width:250px; line-height: 40px; text-align: left; border-right:1px solid lightgray; margin-left:60px; }
#ohsong_station_wrap #public_transportation .right_p{ width:520px; padding-left : 50px; box-sizing: border-box; }
#ohsong_station_wrap #public_transportation p #green_span{ color:green; }
#ohsong_station_wrap #public_transportation p #red_span{ color:red; } 
#ohsong_station_wrap #public_transportation p #sky_span{ color:skyblue; }


</style>
</head>
<body>
<!-- 정차역 상세안내 페이지 -->
<div id="ohsong_station_wrap">
<h1>오송역</h1>
	<div id="infomenu_div">
		<a href="#">홈&nbsp;》&nbsp;</a>
		<a href="#">이용안내&nbsp;》&nbsp;</a>
		<a href="#">정차역이용안내&nbsp;》&nbsp;</a>
		<a href="#">오송역</a>
	</div>
	<div id="container" class="view_map">
	    <div id="mapWrapper" >
	        <div id="map" ></div> <!-- 지도를 표시할 div 입니다 --> 
	    </div>
     </div>
    <div id="ohsong_station_info">
	    <span>§ 주소 : 충북 청주시 흥덕구 오송읍 봉산리 369-1</span>
	    <span>§ 문의 : 1544-7788</span>
    </div>
    <div id="public_transportation">
    	<!--<div id="subway">
    		<span>- 부산지하철 1호선 부산역 하차후 도보 3분  |  초량역 2번출구 도보 9분 -</span>
    	</div>-->
    	<div id="bus">
			<p class="left_p">＊오송역6(1462)</p>
                <p class="right_p">
                    <span id="green_span">[일반]</span> 517<br>
                    <span id="sky_span">[마을]</span> 52</p><br><br><br><br>
            
			<p class="left_p">＊오송역5(1458)</p>
                <p class="right_p">
                   <span id="green_span">[일반]</span> 500, 511, 515-1, 515-2, 525<br>
                   <span id="red_span">[좌석]</span> 535<br>
                   <span id="red_span">[급행]</span> 757<br>
                   <span id="sky_span">[마을]</span> 53</p><br><br><br><br>
            
			<p class="left_p">＊오송역7(1497)</p>
                <p class="right_p">
                    <span id="green_span">[일반]</span> 525<br>
                   <span id="red_span">[좌석]</span> 505<br>
                    <span id="sky_span">[마을]</span> 52</p><br><br><br><br>
                   
            
			<p class="left_p">＊오송역4(1447)</p>
                <p class="right_p">
                    <span id="green_span">[일반]</span> 500, 500(단축), 511, 511(단축), 517<br>
                    <span id="red_span">[좌석]</span> 502, 502(단축)(조치원역-고속버스터미널), 502 (단축)(조치원역-고속버스터미널)<br>
                    <span id="red_span">[급행]</span>747, 747(단축)(오송역4-고속버스터미널), 747-1,747-1(단축)</p><br><br><br><br>
            
            <p class="left_p">＊오송역3(13012)</p>
                <p class="right_p">
                        <span id="braun_span">[광역]</span>1001(BRT)<br>
                    <span id="red_span">[급행]</span>757, 990(반석역-오송역)(BRT),990(오송역-반석역)</p><br><br><br><br>
            
			<p class="left_p">＊오송역종점(1499)</p>
                <p class="right_p">
                    <span id="green_span">[일반]</span> 515-1, 515-2<br>
                    <span id="red_span">[좌석]</span> 535<br>
                     <span id="red_span">[급행]</span> 747, 747(단축),(고속버스터미널-오송역종점), 757(단축)<br>
                    <span id="sky_span">[마을]</span> 53</p><br><br><br><br>
            
			<p class="left_p">＊오송역북문삼거리(3221)</p>
                <p class="right_p">
                    <span id="green_span">[일반]</span> 511, 511(단축), 515-1</p><br><br><br><br>
            
			<p class="left_p">＊오송역북문삼거리(03062)</p>
                <p class="right_p"><span id="green_span">[일반]</span> 511, 515-2</p><br><br><br><br>
    	</div>
    </div>
</div>

</body>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a5fac192cc4bee20c2660a9fa322fa96"></script>
<script>
	var container = document.getElementById('container'), // 지도와 로드뷰를 감싸고 있는 div
    mapWrapper = document.getElementById('mapWrapper'), // 지도를 감싸고 있는 div
    mapContainer = document.getElementById('map'); // 지도를 표시할 div 

	var placePosition = new kakao.maps.LatLng(36.620479, 127.327249);// 지도와 로드뷰 위에 마커로 표시할 특정 장소의 좌표
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