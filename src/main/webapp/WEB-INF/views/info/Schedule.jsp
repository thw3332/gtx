<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
#schedule_info_wrap { margin: 0 auto; width: 1280px; text-align:center;  }
#schedule_info_wrap h1{text-align:center; margin-bottom: 50px; }
#schedule_info_wrap h2{font-weight: 500; color:#7e7e7e;background: url(resources/image/info/bg_lefttop_orange.png) no-repeat left top; padding: 10px 0; margin-top:10px; }
#schedule_info_wrap #infomenu_div { margin: 10px auto; text-align:right; border-bottom: 2px solid gray; width: 900px; height: 30px; }
#schedule_info_wrap #infomenu_div a{ text-decoration: none; color: black; }
#schedule_info_wrap #infomenu_div a:nth-last-of-type(1){font-weight: bold;}
#schedule_info_wrap #schedule_info_menu_btn input { width: 295px; height: 55px; color:#3E3E3E; outline: none; vertical-align: middle; margin: 5px 0; border: 1px solid lightgray; background-color: #F4F4F4; font-size: 20px;}
#schedule_info_wrap #schedule_info_menu_btn input:hover{cursor: pointer; background:palegoldenrod; }
#schedule_info_wrap .part_divs{ margin: 0 auto; box-sizing: border-box;border:1px solid lightgray; padding:10px; display: flex; justify-content: space-between; align-items: center; width:900px; height: 150px;}
#schedule_info_wrap .part_top_div{ margin: 0 auto; box-sizing: border-box; text-align: left; width:900px; height: auto; }
#schedule_info_wrap ul { padding: 0; margin: 0 auto;}
#schedule_info_wrap ul li{list-style: none;}
    
#schedule_info_wrap table{border-collapse: collapse; margin-left: 15px; margin-bottom: 15px;color:#727070;}
#schedule_info_wrap table,tr,th,td{border-bottom: 1px solid gray; border-left: none;}
#schedule_info_wrap table #tr1{height: 50px; background: #e6e6e6;}
#schedule_info_wrap table #tr2,#tr3{ height: 50px; }
#schedule_info_wrap table th,td{ width:250px; text-align: center;}
#schedule_info_wrap table th:nth-of-type(1),td:nth-of-type(1),td:nth-of-type(2),td:nth-of-type(3){border-right: 1px solid gray;}
#schedule_info_wrap table #tr1{ border-top: 3px solid gray;}

#schedule_info_wrap input[type=button]{ width: 295px; height: 55px; color:#0e770a; outline: none; border: 1px solid lightgray; background-color: #b5d3aa; font-size: 18px; cursor: pointer;}
#schedule_info_wrap #train_schedule_info .download{ width: 15px; height: 15px; position: absolute; z-index:1; left: 840px; top: 593px; }
#schedule_info_wrap #trainfare_info_div .download{ width: 15px; height: 15px; position: absolute; z-index:1; left: 800px; top: 360px;}
</style>
</head>
<body>
<!-- 승차권 이용안내 페이지 ( 3개 페이지 연동 ) -->	
<div id="schedule_info_wrap">
	<h1>열차운임 및 시간표</h1>
	<div id="infomenu_div">
		<a href="#">홈&nbsp;》&nbsp;</a>
		<a href="#">이용안내&nbsp;》&nbsp;</a>
		<a href="#">승차권이용안내&nbsp;》&nbsp;</a>
		<a href="#">열차운임 및 시간표</a>
	</div>
	<div id="schedule_info_menu_btn">
		<input id="ticket_info" type="button" value="승차권 구입/환불/분실" onclick="location.href='ticket'">
		<input id="delay_info" type="button" value="열차지연/운행중지" onclick="location.href='delayInfo'">
		<input id="train_schedule" type="button" value="열차 운임 및 시간표" onclick="location.href='trainSchedule'">
	</div>
	<div id="trainfare" class="part_top_div">
		<h2>열차 운임</h2>
	</div>
	<div id="trainfare_info_div" class="part_divs">
		<ul>
			<li><input type="button" value="운임표"><img src="resources/image/info/ico_download.png" alt="ico_down" class="download"></li>
		</ul>
	</div>
	<div id="train_schedule" class="part_top_div">
		<h2>열차 시간표</h2>
	</div>
	<div id="train_schedule_info" class="part_divs">
		<ul>
            <li><input type="button" value="2019.12.30 기준"><img src="resources/image/info/ico_download.png" alt="ico_down" class="download"></li>
		</ul>
		
	</div>
</div>
</body>
</html>