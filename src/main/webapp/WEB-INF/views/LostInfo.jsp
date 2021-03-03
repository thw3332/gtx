<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
#lost_info_wrap { margin: 0 auto; width: 1280px; text-align:center;  }
#lost_info_wrap h1{text-align:center; margin-bottom: 50px;}
#lost_info_wrap h2{font-weight: 500; color:#7e7e7e;background: url(resources/image/info/bg_lefttop_orange.png) no-repeat left top; padding: 10px 0; margin-top:10px;}
#lost_info_wrap #infomenu_div { margin: 10px auto; text-align:right; border-bottom: 2px solid gray; width: 900px; height: 30px; }
#lost_info_wrap #infomenu_div a{ text-decoration: none; color: black; }
#lost_info_wrap #infomenu_div a:nth-last-of-type(1){font-weight: bold;}
#lost_info_wrap #ticket_info_menu_btn input { width: 295px; height: 55px; color:#3E3E3E; outline: none; vertical-align: middle; margin: 5px 0; border: 1px solid lightgray; background-color: #F4F4F4; font-size: 20px;}
#lost_info_wrap #ticket_info_menu_btn input:hover{cursor: pointer;background:palegoldenrod; }
#lost_info_wrap #purchase_office_info,#purchase_period_info,#payment_ticketing_info,#refund_info{ margin: 0 auto; box-sizing: border-box;border:1px solid lightgray; padding:10px; display: flex; justify-content: space-between; align-items: center; width:900px; height: auto; font-size: 15px; }
#lost_info_wrap .part_top_div{ margin: 0 auto; box-sizing: border-box; text-align: left; width:900px; height: auto; }
#lost_info_wrap ul { padding: 0; }
#lost_info_wrap ul li{ color:#727070; background: url(resources/image/info/list_style.png) no-repeat left 4px; list-style: none; padding-left: 15px;text-align: left; margin:10px 0;}
#lost_info_wrap #refund_info{ display: block; } 
#lost_info_wrap #refund_info table{border-collapse: collapse;}
#lost_info_wrap #refund_info table,tr,th,td{border-bottom: 1px solid gray; border-left: none;}
#lost_info_wrap #refund_info table #tr1,#tr2{height: 50px; background: #e6e6e6;}
#lost_info_wrap #refund_info table #tr3{ height: 50px; }
#lost_info_wrap #refund_info table th,td{ width:300px; text-align: center;}
#lost_info_wrap #refund_info table th:nth-of-type(1),td:nth-of-type(1),td:nth-of-type(2){border-right: 1px solid gray;}
#lost_info_wrap #refund_info table #tr1{ border-top: 3px solid gray; }
</style>
</head>
<body>
<div id="lost_info_wrap">
	<h1>유실물 신고 안내</h1>
	<div id="infomenu_div">
		<a href="#">홈&nbsp;》&nbsp;</a>
        <a href="#">고객안내&nbsp;》&nbsp;</a>
        <a href="#"><strong>유실물 신고 안내</strong></a>
	</div>
	<div id="purchase_office" class="part_top_div">
		<h2>유실물 신고 안내</h2>
	</div>
	<div id="purchase_office_info">
		<ul>
			<li> 열차를 이용하면서 분실한 물건이 있다면 유실물센터 또는 고객센터(1800-1472)</li>
			<li> GTX 홈페이지(www.gtx.co.kr)에서 검색 및 확인 할 수 있습니다.</li>
		</ul>
	</div>
	<div id="purchase_period" class="part_top_div">
		<h2>유실물 신고 및 습득시 요령</h2>
	</div>
	<div id="purchase_period_info">
		<ul>
            <li> 열차에 내린 직후 분실한 사실을 아셨다면 즉시 역직원에게 알려주세요.</li>
            <li> 열차에 타신 후 분실한 사실을 아셨다면 즉시 객실장 또는 승무원에게 알려주세요.</li>
            <li> 분실한 사실을 뒤늦게 아셨다면 유실물센터 또는 고객센터로 신고하세요.</li>
            <li> 물건을 빨리 찾고 싶으시다면 열차번호, 이용구간, 열차호차, 좌석번호를 알려주세요.</li>
		</ul>
	</div>
	<div id="payment_ticketing" class="part_top_div">
		<h2>유실물 습득(GTX직원, 고객)</h2>
	</div>
	<div id="payment_ticketing_info">
		<ul>
			<li> 열차 운행 중인 경우 : 최근 정차역장에게 유실물 수배 요청</li>
			<li> 열차 운행 종료한 경우 : 종착역 관리자에게 인도 및 수배요청</li>
			<li> 유실물 센터(5일간 게시, 7일간 보관, 고객인도) : 정당한 권리자가 다른 역에서 수령 희망 시, 해당역으로 인도조치</li>
			<li> 습득물 발생 시 관계법령에 따라 각 기관에서 7일 동안 보관(또는 즉시) 후 유실자가 나타나지 않을 경우 관할경찰서로 습득물이<br>이관되오니, 이점 참고바랍니다.</li>
		</ul>
	</div>
</div>
</body>
</html>