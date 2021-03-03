<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>

#station_info_wrap { margin: 0 auto; width: 1280px; text-align:center;  }
#station_info_wrap h1{text-align:center; margin-bottom: 50px; }
#station_info_wrap #infomenu_div { margin: 0 auto; text-align:right;   border-bottom: 2px solid gray; width: 900px; height: 30px; }
#station_info_wrap #infomenu_div a{ text-decoration: none; color: black; }
#station_info_wrap #infomenu_div a:nth-last-of-type(1){font-weight: bold;}
#station_info_wrap #station_info_list{width: 900px; margin: 0 auto; display: flex; justify-content: space-between; box-sizing: border-box; border: 1px solid lightgray; margin-top: 5px; border-radius: 5px; }
#station_info_wrap #station_info_list ul{ padding: 0; }
#station_info_wrap #station_info_list ul li{ list-style: none; width:400px; height: 350px; box-sizing: border-box; margin: 20px; font-size: 14px; }
#station_info_wrap #station_info_list ul li img{ width: 400px; height: 250px; border-radius: 5px; box-shadow: 4px 4px 4px gray; cursor:pointer; }
#station_info_wrap #station_info_list ul li p{ display: block; box-sizing: border-box; margin-top: 10px; text-align: left; width: 400px; height: 80px; background:  #d9d6d6; border: 1px solid lightgray; border-radius: 5px; padding: 10px; color: black; box-shadow: 4px 4px 4px gray; font-weight: bold;}
#station_info_wrap #station_info_list #line_div{margin-top:20px;  width: 0px; height: 2230px; border: 0.1px solid #d9d6d6; border-style: dashed;}
#station_info_wrap #station_info_list ul li em{ display:block;margin-top:10px; font-size: 10px; }
</style>
</head>
<body>
<!-- 정차역 이용안내 페이지 -->
<div id="station_info_wrap">
<h1>정차역 이용안내</h1>
	<div id="infomenu_div">
		<a href="#">홈&nbsp;》&nbsp;</a>
		<a href="#">이용안내&nbsp;》&nbsp;</a>
		<a href="#">정차역이용안내</a>
	</div>
<div id="station_info_list">
    <ul>
        <li><img src="resources/image/station/img_station_slide_suseo_01.jpg" alt="#" id="#" onclick="location.href='stationSuseo'"><br>
            <p id="#" class="station_name">[수서역]<br><em>- 주소 : 서울 강남구 밤고개로 99 수서역사 (우)06369<br>
			- 전화번호 : 1800-1472</em></p>
            
        </li>
        <li><img src="resources/image/station/img_station_slide_dongtan_01.jpg" alt="#" id="#" onclick="location.href='stationDongtan'"><br>
            <p id="#" class="station_name">[동탄역]<em>- 주소 : 경기 화성시 오산동 92-2<br>
			- 전화번호 : 1800-1472</em></p>
        </li>
        <li><img src="resources/image/station/img_station_slide_jije_01.jpg" alt="#" id="#" onclick="location.href='stationJije'"><br>
            <p id="#" class="station_name">[지제역]<em>- 주소 : 경기 평택시 경기대로 777 (우)17824<br>
			- 전화번호 : 1800-1472</em></p>
        </li>
        <li><img src="resources/image/station/img_station_slide_cheonan.jpg" alt="#" id="#" onclick="location.href='stationCheonan'"><br>
            <p id="#" class="station_name">[천안아산역]<em>- 주소 : 충남 아산시 배방읍 희망로 100 천안아산역 (우)31470<br>
			- 전화번호 : 1544-7788</em></p>
        </li>
        <li><img src="resources/image/station/img_station_slide_ohsong.jpg" alt="#" id="#" onclick="location.href='stationOhsong'"><br>
            <p id="#" class="station_name">[오송역]<em>- 주소 : 충북 청주시 흥덕구 오송읍 봉산리 369-1<br>
			- 전화번호 : 1544-7788</em></p>
        </li>
        <li><img src="resources/image/station/img_station_slide_daejeon.jpg" alt="#" id="#" onclick="location.href='stationDaejeon'"><br>
            <p id="#" class="station_name">[대전역]<em>- 주소 : 대전 동구 중앙로 215 대전역 (우)34626<br>
			- 전화번호 : 1544-7788</em></p>
        </li>
    </ul>
    <div id="line_div"></div>
    <ul>
        <li><img src="resources/image/station/img_station_slide_kimcheon.jpg" alt="#" id="#" onclick="location.href='stationKimcheon'"><br>
            <p id="#" class="station_name">[김천(구미)역]<em>- 주소 : 경북 김천시 김천로 111 김천역 (우)39597<br>
			- 전화번호 : 1544-7788</em></p>
        </li>
        <li><img src="resources/image/station/img_station_slide_dongdaegu.jpg" alt="#" id="#" onclick="location.href='stationDongdaegu'"><br>
            <p id="#" class="station_name">[동대구역]<em>- 주소 : 대구 동구 동대구로 550 (우)41229<br>
			- 전화번호 : 1544-7788</em></p>
        </li>
        <li><img src="resources/image/station/img_station_slide_sinkyungju.jpeg" alt="#" id="#" onclick="location.href='stationSinkyungju'"><br>
            <p id="#" class="station_name">[신경주역]<em>- 주소 : 경북 경주시 건천읍 신경주역로 80 신경주역 (우)38183<br>
			- 전화번호 : 1544-7788</em></p>
        </li>
        <li><img src="resources/image/station/img_station_slide_ulsan.jpg" alt="#" id="#" onclick="location.href='stationUlsan'"><br>
            <p id="#" class="station_name">[울산역]<em>- 주소 : 울산 울주군 삼남면 신화리 467<br>
			- 전화번호 : 1544-7788</em></p>
        </li>
        <li><img src="resources/image/station/img_station_slide_busan.gif" alt="#" id="#" onclick="location.href='stationBusan'"><br>
            <p id="#" class="station_name">[부산역]<em>- 주소 : 부산 동구 중앙대로 206 한국철도공사부산지역본부 (우)48760<br>
			- 전화번호 : 1544-7788</em></p>
        </li>
    </ul>
</div>
</div>
</body>
</html>