<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
#routearea_info_wrap { margin: 0 auto; width: 1280px; text-align:center;  }
#routearea_info_wrap h1{ text-align:center; margin-bottom: 50px;  }
#routearea_info_wrap #infomenu_div { margin: 0 auto; text-align:right;   border-bottom: 2px solid gray; width: 900px; height: 30px; }
#routearea_info_wrap #infomenu_div a{ text-decoration: none; color: black; }
#routearea_info_wrap #infomenu_div a:nth-last-of-type(1){font-weight: bold;}
#routearea_info_wrap #route_map_div{ margin: 0 auto; background:white; box-sizing: border-box; border: 1px solid lightgray; width: 900px; height: auto; padding: 10px; margin-top: 10px; margin-bottom: 10px; }
#routearea_info_wrap #route_map_div p{ text-align: left; color:#776e6e; font-size:12px; } 
#routearea_info_wrap #route_map_div img { width: 450px; height: 630px; }
</style>
</head>
<body>
<!-- 운행구간 페이지 -->
<div id="routearea_info_wrap">
<h1>운행구간</h1>
	<div id="infomenu_div">
		<a href="#">홈&nbsp;》&nbsp;</a>
		<a href="#">이용안내&nbsp;》&nbsp;</a>
		<a href="#">운행구간</a>
	</div>
	<div id="route_map_div">
	    <p>※ GTX는 처음부터 고속철도 전용선로를 빠르게 달리며,<br>
           시종착역인 수서역에서 부산까지 편리하게 이용하실 수 있습니다.</p>
		<img src="resources/image/info/map1.png">
	</div>
</div>
</body>
</html>