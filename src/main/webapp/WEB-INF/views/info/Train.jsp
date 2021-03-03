<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
#train_service_wrap { margin: 0 auto; width: 1280px;}
#train_service_wrap h1{text-align:center; margin-bottom: 50px; }
#train_service_wrap h2{ width:900px; margin:0 auto; text-align: left; font-weight: 500; color:#7e7e7e;background: url(resources/image/info/bg_lefttop_orange.png) no-repeat left top; padding: 10px 0; margin-top:10px; }
#train_service_wrap #infomenu_div { margin: 10px auto; text-align:right; border-bottom: 2px solid gray; width: 900px; height: 30px; }
#train_service_wrap #infomenu_div a{ text-decoration: none; color: black; }
#train_service_wrap #infomenu_div a:nth-last-of-type(1){font-weight: bold;}
#train_service_wrap #viproom_service_info h4{ color:#4b4a4a; margin: 15px; margin-left: -15px; }
#train_service_wrap .redcolor{ color: red;}
#train_service_wrap #viproom_service_info,#wifi_service_info,#event_service_info{ width: 900px; margin:0 auto; border:1px solid lightgray; padding:10px; display: flex; justify-content: space-between; align-items: center;  box-sizing: border-box;}
#train_service_wrap #viproom_service_info ul li:nth-of-type(1){background: none;}
#train_service_wrap ul:nth-of-type(1) li{ font-size: 15px; color:#727070;background: url(resources/image/list_style.png) no-repeat left 4px;list-style: none; padding-left: 20px; }
#train_service_wrap ul:nth-of-type(2){ margin-right: 50px; }
#train_service_wrap ul:nth-of-type(2) li{ list-style: none; }

</style>
</head>
<body>
<!-- 승차권 이용안내 페이지 ( 3개 페이지 연동 ) -->	
<div id="train_service_wrap">
	<h1>열차서비스</h1>
	<div id="infomenu_div">
		<a href="#">홈&nbsp;》&nbsp;</a>
		<a href="#">이용안내&nbsp;》&nbsp;</a>
		<a href="#">열차서비스</a>
	</div>
	<div id="viproom_service">
		<h2>특실서비스</h2>
	</div>
	<div id="viproom_service_info">
		<ul>
			<li><h4>GTX 특실물품 고객 설문조사 결과를 반영한 고객맞춤 패키지 상품 제공</h4></li>
			<li>물품(기본) <br>생수, 견과류, 쿠키, 물티슈(선택)<br> 신문, 수면안대</li>
			<li>제공방법 : 기본제공 물품은 패키지 형태로 모든 특실 고객에게 승무원이 직접 제공하고,<br>
				선택물품은 고객 요청 시 승무원이 개별 제공<br>
				<span class="redcolor">※ 상기 물품은 고객설문조사 결과에 따라 변경될 수 있습니다.</span>
			</li>
		</ul>
		<ul><li><img src="resources/image/info/ico_relate_service1.png" alt=""></li></ul>
	</div>
	<div id="wifi_service">
		<h2>무선인터넷서비스</h2>
	</div>
	<div id="wifi_service_info">
		<ul>
			<li>서비스내용 : 매월 80TB 사용 가능(최대 1GB/인)<br>
				<span class="redcolor">※ 전체 용량 소진 시 사용 제한이 있을 수 있습니다</span>
			</li>
			<li>고객센터 : 1588-0000(08:00~23:00)<br>
				<span class="redcolor">※ 일부 구간에서 이용 속도가 느리고 장애가 발생할 수 있습니다.</span>
			</li>
		</ul>
		<ul><li><img src="resources/image/info/ico_relate_service3.png" alt=""></li></ul>
	</div>
	<div id="event_service">
		<h2>열차 내 이벤트 안내</h2>
	</div>
	<div id="event_service_info">
		<ul>
			<li>사랑의 프로포즈 서비스<br>
				- 대상 : GTX승차고객<br>
				- 신청방법 : 열차출발 5일 전 고객사연 유선신청<br>
				- 열차 내 프로포즈 및 감사 사연 소개를 통한 감동적인 서비스 제공<br>
				<span class="redcolor">※ 차내 육성방송으로 사연소개 및 기념촬영 등</span><br>
			</li>
		</ul>
		<ul><li><img src="resources/image/info/ico_relate_service4.png" alt=""></li></ul>
	</div>
</div>
</body>
</html>