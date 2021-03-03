<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="https://code.jquery.com/jquery-2.2.1.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style> 
	#headerwrap { margin: 0 auto; height: 100px; background:white;  box-sizing: border-box; text-align: center; }
	#headerwrap>div { height: 104px; }
	#headerwrap #menu_button_div { display: flex; justify-content: center; align-items: center; } 
	#headerwrap #menu_div{ width:800px; }
	#menu { width:800px; list-style: none;  }  
	#menu>li { position: relative; display: inline-block; padding: 20px; width: 120px; height: 50px; line-height: 50px; text-align: center; }
	#menu li>a { text-decoration: none; color: #333; font-size: 18px; font-weight: 500; }
	#menu>li:hover  { border-bottom:3px solid #b2125c;} 
	#menu ul li span { font-size: 15px; }  
	#menu .sub_menu { position: absolute; display: none; list-style: none; padding-top: 25px; margin-left: -20px; z-index:2; }
	#menu .sub_menu li { padding: 0 20px; width: 150px; height: 40px; line-height: 40px; text-align: center; }
	#menu .sub_menu li a:hover { color: #b2125c; }
	#menu .sub_menu a { text-decoration: none; font-size: 15px; color: #cccccc; }
	#headerwrap #logo_div { display: flex; flex-direction: column; justify-content: center; align-items: center; }
	#headerwrap #logo_div #logoimg { width: 130px; height: 70px; cursor:pointer; margin-bottom: 10px; }
	hr { border: 1px solid #e3cee2; margin-top: -2px; }
	#headerwrap>p { color: #b2125c; font-size: 15px; font-weight: bold; padding: 20px; }
	#buttondiv { width: 160px; line-height: 100px; }
	#buttondiv>a:hover { color: #b2125c; font-weight: bold; }
	#buttondiv>a { text-decoration: none; font-size:13px; } 
	#buttondiv a:link{ color: black; }
	#buttondiv a:visited{ color: black; } 
	hr{ border:1px solid lightgray; }  
	#layer{ background:url(resources/image/header/header_bg.png) 0 0 repeat-x;  background-position-y: bottom;  top:99px; width:100%; height:180px; display:none; position:absolute; z-index:2; box-shadow: 4px 4px 10px lightgray;}   
	#usermenu_ul { list-style: none; } 
	#usermenu_ul>li { width:150px; height: 40px; }
	#usermenu_ul>li>a{ text-decoration: none; font-size:13px;}
	#usermenu_ul>li>a:hover { color: #b2125c; font-weight: bold; }
</style>
</head> 
<body>
<div id="layer"></div>
<div id="headerwrap">
	<div id="menu_button_div">
		<div id="logo_div"><img id="logoimg" src="resources/image/logo/gtxlogo.png" alt="logo" onclick="location.href='section'"></div>
		<div id="menu_div" >	
			<ul id="menu" >
				<li class="dd"><a href="#">승차권</a>
					<ul class="sub_menu">
						<li><a href="ticketCheck">승차권예약</a></li>
						<li><a href="issueList">발권/취소</a></li>
						<li><a href="reserveChange">예약변경</a></li>
					</ul>
				</li>
				<li class="dd"><a href="#">고객안내</a>
					<ul class="sub_menu">
						<li><a href="noticeListPage">공지사항</a></li>
						<li><a href="boardListPage">Q &amp; A</a></li>
						<li><a href="lostInfo">유실물안내</a></li>
					</ul>
				</li>
				<li class="dd"><a href="#">이용안내</a>
					<ul class="sub_menu">
						<li><a href="train">열차서비스안내</a></li>
						<li><a href="ticket">승차권이용안내</a></li>
						<li><a href="station">정차역이용안내</a></li>
						<li><a href="routeArea">운행구간</a></li>
					</ul>
				</li>
				<li class="dd"><a href="#">회원서비스</a>
					<ul class="sub_menu">
						<li><a href="memberservice">회원제도소개</a></li>
						<li><a href="joinForm">회원가입신청</a></li>
					</ul>
				</li>
			</ul>
		</div>
		
		<div id="buttondiv">
			<c:if test="${id == null}">
				<a href="loginForm"><span id="loginForm">로그인</span></a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="joinForm"><span id="join">회원가입</span></a>
			</c:if>
			<c:if test="${id != null }">
				<a href="#"><span id="#">로그아웃</span></a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="#"><span id="mypagemenu">MyPage</span></a>
				<ul id="usermenu_ul">
					<li><a href="useIinfoUpdate">회원정보수정</a></li>
					<li><a href="usageHistory">이용내역/영수증</a></li>
				</ul>
			</c:if>
			
		</div>
		
	</div>
</div>
<hr>
</body>
<script>
$(document).ready(function(){
	$("#menu").hover(function(){
		$(".sub_menu",this).stop().slideDown(0);
		$("#layer").css("display","block"); 
		 
	},function(){
		$(".sub_menu",this).stop().slideUp(0);  
		$("#layer").css("display","none");
	});
});
</script>
</html>