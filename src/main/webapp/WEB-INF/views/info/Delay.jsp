<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
#delay_info_wrap { margin: 0 auto; width: 900px; text-align:center;  }
#delay_info_wrap h1{ text-align:center; margin-bottom: 50px;  } 
#delay_info_wrap h2{ font-weight: 500; color:#7e7e7e; background: url(resources/image/info/bg_lefttop_orange.png) no-repeat left top; padding: 10px 0; margin-top:10px;}
#delay_info_wrap #infomenu_div { margin: 10px auto; text-align:right; border-bottom: 2px solid gray; width: 900px; height: 30px; }
#delay_info_wrap #infomenu_div a{ text-decoration: none; color: black; }
#delay_info_wrap #infomenu_div a:nth-last-of-type(1){font-weight: bold;}
#delay_info_wrap #delay_info_menu_btn input { width: 295px; height: 55px; color:#3E3E3E; outline: none; vertical-align: middle; margin: 5px 0; border: 1px solid lightgray;  font-size: 20px;}
#delay_info_wrap #delay_info_menu_btn input:hover{cursor: pointer; background:palegoldenrod; }
#delay_info_wrap .part_divs{ margin: 0 auto; box-sizing: border-box;border:1px solid lightgray; padding:10px; display: flex; justify-content: space-between; align-items: center; width:900px; height: auto; }
#delay_info_wrap .part_top_div{ margin: 0 auto; box-sizing: border-box; text-align: left; width:900px; height: auto; }
#delay_info_wrap ul { padding: 0; }
#delay_info_wrap ul li{ color:#727070; background:url(resources/image/info/list_style.png) no-repeat left 3px; list-style: none; padding-left: 15px;text-align: left;font-size: 15px; margin:10px 0;}
#delay_info_wrap #delay_info_div{ display: block; } 
#delay_info_wrap table{border-collapse: collapse; margin-left: 15px; margin-bottom: 15px;color:#727070;}
#delay_info_wrap table,tr,th,td{border-bottom: 1px solid gray; border-left: none;}
#delay_info_wrap table #tr1{height: 50px; background: #e6e6e6;}
#delay_info_wrap table #tr2,#tr3{ height: 50px; }
#delay_info_wrap table th,td{ width:300px; text-align: center; } 
#delay_info_wrap table th:nth-of-type(1),td:nth-of-type(1),td:nth-of-type(2),td:nth-of-type(3){border-right: 1px solid gray;}
#delay_info_wrap table #tr1{ border-top: 3px solid gray;} 
        
</style>
</head>
<body>
<!-- 승차권 이용안내 페이지 ( 3개 페이지 연동 ) -->	
<div id="delay_info_wrap">
	<h1>열차지연/운행중지</h1>
	<div id="infomenu_div">
		<a href="#">홈&nbsp;》&nbsp;</a>
		<a href="#">이용안내&nbsp;》&nbsp;</a>
		<a href="#">승차권이용안내&nbsp;》&nbsp;</a>
		<a href="#">열차지연/운행중지</a>
	</div>
	<div id="delay_info_menu_btn">
		<input id="ticket_info" type="button" value="승차권 구입/환불/분실" onclick="location.href='ticket'">
		<input id="delay_info" type="button" value="열차지연/운행중지" onclick="location.href='delayInfo'">
		<input id="train_schedule" type="button" value="열차 운임 및 시간표" onclick="location.href='trainSchedule'">
	</div>
	<div id="delay" class="part_top_div">
		<h2>열차지연</h2>
	</div>
	<div id="delay_info_div" class="part_divs">
		<ul>
			<li>천재지변 이외 GTX의 귀책사유로 GTX가 20분 이상 지연된 경우 소비자 분쟁해결 기준에 정한 금액을 보상하여 드립니다.</li>
		</ul>
		<table>
           <tr id="tr1">
            <th>구분</th>
            <th colspan="3" id="th1">GTX</th>
           </tr>
           <tr id="tr2">
            <td>지연시간</td>
            <td>20분 이상 40분 미만</td>
            <td>40분 이상 1시간 미만</td>
            <td>1시간 이상</td>
           </tr>
           <tr id="tr3">
            <td>결제수단(현금)</td>
            <td>12.5%</td>
            <td>25%</td>
            <td id="td3">50%</td>
           </tr>
        </table>
	</div>
	<div id="stop_service" class="part_top_div">
		<h2>운행중지</h2>
	</div>
	<div id="stop_service_info" class="part_divs">
		<ul>
            <li>법령, 정부기관의 명령, 전쟁, 소요, 천재지변 등 불가항력적인 사유로 열차운행이 중지되었을 경우 승차하지 않은 구간의 운임·요금을 환불하여 드립니다.</li>
            <li>여행시작전에 여행을 포기하는 경우, 운임·요금 전액을 환불하여 드립니다.</li>
            <li>열차고장, 선로고장, 파업, 노사분규 등 SR의 책임사유로 열차 운행이 중지되었을 경우 승차권에 표시된 영수금액을 환불하여 드립니다.</li>
		</ul>
		
	</div>
</div>
</body>
</html>