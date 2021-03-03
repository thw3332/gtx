<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
#join_service_wrap { margin: 0 auto; width: 900px;}
#join_service_wrap h1{ text-align:center; margin-bottom: 50px; }
#join_service_wrap h2{ width:900px; margin:10px auto; text-align: left; font-weight: 500; color:#7e7e7e; background: url(resources/image/info/bg_lefttop_orange.png) no-repeat left top; padding: 10px 0; color:#4b4a4a; margin-left:0 }
#join_service_wrap #infomenu_div { margin: 10px auto; text-align:right; border-bottom: 2px solid gray; width: 900px; height: 30px; } 
#join_service_wrap #infomenu_div a{ text-decoration: none; color: black; }
#join_service_wrap #infomenu_div a:nth-last-of-type(1){font-weight: bold;}
#join_service_wrap #join_info,#member_info_modify,#basic_service_info{ width: 900px; margin:0 auto; border:1px solid lightgray; padding:10px; display: flex; justify-content: space-between; align-items: center;  box-sizing: border-box;}
#join_service_wrap #viproom_service_info ul li:nth-of-type(1){background: none;}
#join_service_wrap ul:nth-of-type(1) li{ font-size: 15px; color:#727070;background: url(resources/image/list_style.png) no-repeat left 4px;list-style: none; padding-left: 20px; }
#join_service_wrap ul:nth-of-type(2){ margin-right: 50px; }
#join_service_wrap ul:nth-of-type(2) li{ list-style: none; }

</style>
</head>
<body>
<!-- 회원제도 소개 페이지 -->	
<div id="join_service_wrap">
	<h1>회원제도소개</h1>
	<div id="infomenu_div">
		<a href="#">홈&nbsp;》&nbsp;</a>
		<a href="#">회원서비스&nbsp;》&nbsp;</a>
		<a href="#">회원제도소개</a>
	</div>
	<div id="join_service">
		<h2>특실서비스</h2>
	</div>
	<div id="join_info">
		<ul>
			<li>GTX 홈페이지 (#) 를 통해 가입하실 수 있습니다.</li>
		</ul>
	</div>
	<div id="member_info">
		<h2>회원정보 수정</h2>
	</div>
	<div id="member_info_modify">
		<ul>
			<li>GTX 홈페이지 (#) 를 통해 회원정보를 수정하실 수 있습니다.</li>
		</ul>
	</div>
	<div id="basic_service">
		<h2>GTX회원 기본 서비스</h2>
	</div>
	<div id="basic_service_info">
		<ul>
			<li><strong>철도승차권 예약</strong><br> 
				- 회원이면 누구나 GTX 홈페이지 (#) 를 통해 승차권을 예약 하실 수 있습니다.<br>
				- 회원이면 누구나 GTX 홈페이지 (#) 를 통해 예약된 승차권 변경/취소 하실 수 있습니다.<br><br>
			</li>
			<li><strong>이용내역 확인</strong><br>
				- 회원이면 누구나 GTX 홈페이지 (#) 를 통해 승차권을 예약 하실 수 있습니다
			</li>
		</ul>
	</div>
</div>
</body>
</html>