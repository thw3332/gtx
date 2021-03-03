<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
#ticket_info_wrap { margin: 0 auto; width: 1280px; text-align:center;  }
#ticket_info_wrap h1{text-align:center; margin-bottom: 50px; }
#ticket_info_wrap h2{font-weight: 500; color:#7e7e7e;background: url(resources/image/info/bg_lefttop_orange.png) no-repeat left top; padding: 10px 0; margin-top:10px;}
#ticket_info_wrap #infomenu_div { margin: 10px auto; text-align:right; border-bottom: 2px solid gray; width: 900px; height: 30px; }
#ticket_info_wrap #infomenu_div a{ text-decoration: none; color: black; }
#ticket_info_wrap #infomenu_div a:nth-last-of-type(1){font-weight: bold;}
#ticket_info_wrap #ticket_info_menu_btn input { width: 295px; height: 55px; color:#3E3E3E; outline: none; vertical-align: middle; margin: 5px 0; border: 1px solid lightgray; background-color: #F4F4F4; font-size: 20px;}
#ticket_info_wrap #ticket_info_menu_btn input:hover{cursor: pointer;background:palegoldenrod; }
#ticket_info_wrap #purchase_office_info,#purchase_period_info,#payment_ticketing_info,#refund_info{ margin: 0 auto; box-sizing: border-box;border:1px solid lightgray; padding:10px; display: flex; justify-content: space-between; align-items: center; width:900px; height: auto; font-size: 15px; }
#ticket_info_wrap .part_top_div{ margin: 0 auto; box-sizing: border-box; text-align: left; width:900px; height: auto; }
#ticket_info_wrap ul { padding: 0; }
#ticket_info_wrap ul li{ color:#727070; background: url(resources/image/info/list_style.png) no-repeat left 4px; list-style: none; padding-left: 15px;text-align: left; margin:10px 0;}
#ticket_info_wrap #refund_info{ display: block; } 
#ticket_info_wrap #refund_info table{border-collapse: collapse;}
#ticket_info_wrap #refund_info table,tr,th,td{border-bottom: 1px solid gray; border-left: none;}
#ticket_info_wrap #refund_info table #tr1,#tr2{height: 50px; background: #e6e6e6;}
#ticket_info_wrap #refund_info table #tr3{ height: 50px; }
#ticket_info_wrap #refund_info table th,td{ width:300px; text-align: center;}
#ticket_info_wrap #refund_info table th:nth-of-type(1),td:nth-of-type(1),td:nth-of-type(2){border-right: 1px solid gray;}
#ticket_info_wrap #refund_info table #tr1{ border-top: 3px solid gray;}
    
    
</style>
</head>
<body>
<!-- 승차권 이용안내 페이지 ( 3개 페이지 연동 ) -->	
<div id="ticket_info_wrap">
	<h1>승차권 구입/환불/분실</h1>
	<div id="infomenu_div">
		<a href="#">홈&nbsp;》&nbsp;</a>
		<a href="#">이용안내&nbsp;》&nbsp;</a>
		<a href="#">승차권이용안내&nbsp;》&nbsp;</a>
		<a href="#">승차권 구입/환불/분실</a>
	</div>
	<div id="ticket_info_menu_btn">
		<input id="ticket_info" type="button" value="승차권 구입/환불/분실" onclick="location.href='ticket'">
		<input id="delay_info" type="button" value="열차지연/운행중지" onclick="location.href='delayInfo'">
		<input id="train_schedule" type="button" value="열차 운임 및 시간표" onclick="location.href='trainSchedule'">
	</div>
	<div id="purchase_office" class="part_top_div">
		<h2>구입처</h2>
	</div>
	<div id="purchase_office_info">
		<ul>
			<li> 홈페이지 www.srail.co.kr 또는 etk.srail.co.kr</li>
			<li> 승차권 자동발매기</li>
			<li> 역 (전용역, 공용역 포함)</li>
		</ul>
	</div>
	<div id="purchase_period" class="part_top_div">
		<h2>구입기간</h2>
	</div>
	<div id="purchase_period_info">
		<ul>
            <li> 홈페이지는 열차출발 1주일전 07:00부터 열차출발 20분전까지 가능합니다.</li>
		</ul>
	</div>
	<div id="payment_ticketing" class="part_top_div">
		<h2>결제/발권</h2>
	</div>
	<div id="payment_ticketing_info">
		<ul>
			<li> 현금결제(홈페이지에 한함)를 이용하여 결제 할 수 있습니다.</li>
			<li> 결제 후 홈티켓으로 직접 발권 하실 수 있습니다.</li>
		</ul>
	</div>
	<div id="refund" class="part_top_div">
		<h2>환불</h2>
	</div>
	<div id="refund_info">
		<ul>
			<li> 인터넷에서 발행 받은 승차권의 운임·요금 환불은 승차권에 기재된 출발역 출발 전까지 인터넷으로 직접 환불하실 수 있습니다.</li>
			<li> 승차권에 표기된 열차 출발시각 이후에는 환불이 불가능합니다.</li>
			<li> 승차권에 표기된 도착역 도착시각 이후에는 환불 하실 수 없습니다.</li>
			<li> 구입한 승차권을 환불하는 경우 환불시점에 따른 위약금이 발생합니다.</li>
			<li> 취소/위약금</li>
		</ul>
		<table>
           <tr id="tr1">
            <th rowspan="2">구분</th>
            <th colspan="2" id="th1">출발 전</th>
           </tr>
           <tr id="tr2">
            <th>1일 전까지</th>
            <th id="th2">1시간 전 ~ 출발시간 전</th>
           </tr>
           <tr id="tr3">
            <td>일반 승차권</td>
            <td>무료</td>
            <td id="td3">10%</td>
           </tr>
        </table>
	</div>
</div>
</body>
</html>