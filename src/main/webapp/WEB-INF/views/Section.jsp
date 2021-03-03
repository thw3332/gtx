<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	body { background:#e2e2e2} 
	#main_div_wrap { width: 1280px; height: 100%; margin: 0 auto; }
	#main_div_wrap .top_div { width: 1280px; height: 680px; text-align: center; }
	#main_div_wrap .top_div .top_sub_div { height: 120px; text-align: center; }
	#main_div_wrap .top_div .top_sub_div h1 { line-height: 90px; } 
	#main_div_wrap .top_div .left_div { width: 635px; height: 500px; text-align: center; display: inline-block; vertical-align: middle; margin-right: 3px; }
	#main_div_wrap .top_div .left_div .left_top { width: 635px; height: 372px; margin-bottom: 10px; box-shadow: 1px 1px 5px 1px gray; background: #cbc2ba; } 
	#main_div_wrap .top_div .left_div .left_top select { width: 275px; height:55px; text-align: center; margin: 17px 10px; border: 1px solid white; border-radius: 5px; cursor: pointer; display: inline-block; }
	#main_div_wrap .top_div .left_div .left_top select:nth-child(1), .left_div select:nth-child(2) { margin-top: 40px; } 
	#main_div_wrap .top_div .left_div .left_top .calendar { width: 269px; height: 48px; text-align: center; vertical-align: middle; margin: 10px 10px; border: 1px solid white; border-radius: 5px; cursor: pointer; display: inline-block; background: white;}
	#main_div_wrap .top_div .left_div .left_top .calendar input[type=text] { width: 240px; height: 48px; border: none; outline: none; }
	#main_div_wrap .top_div .left_div .left_top .calendar input[type=button] { width: 30px; height: 40px; outline: none; }
	#main_div_wrap .top_div .left_div .left_top .calendar a { text-decoration: none; color: black; }
	#main_div_wrap .top_div .left_div .left_top .calendar #calendarwrap { display: none; width: 250px; height: 270px; margin: 15px auto; background: white; border: 1px solid lightgray; position: absolute; z-index: 1; top: 518px; left: 475px; }
	#main_div_wrap .top_div .left_div .left_top .calendar #calendarwrap p { width: 235px; margin: 0 auto; text-align: right; /* border-bottom: 1px solid lightgray; */ }
	#main_div_wrap .top_div .left_div .left_top .calendar #calendarwrap #ym { width: 250px; height: 30px; text-align: center; }
    #main_div_wrap .top_div .left_div .left_top .calendar #calendarwrap #ym label { width: 30px; height: 25px; border: 1px solid #ccc; outline: none; display: inline-block; cursor: pointer; }
    #main_div_wrap .top_div .left_div .left_top .calendar #calendarwrap #ym #yearmonth { width: 161px; height: 20px; margin: 9px auto; text-align: center; line-height: 20px; display: inline-block;}
    #main_div_wrap .top_div .left_div .left_top .calendar #calendarwrap #calendar_table { width: 250px; margin: 0 auto; }
    #main_div_wrap .top_div .left_div .left_top .calendar #calendarwrap #calendar_table table { width: 240px; text-align: center; border: none; margin: 8px auto; }
    #main_div_wrap .top_div .left_div .left_top .calendar #calendarwrap #calendar_table tr th, td { width: 30px; height: 30px; border: 1px solid lightgray; }
    #main_div_wrap .top_div .left_div .left_top .calendar #calendarwrap #calendar_table tr .choice { font-weight: bold; cursor: pointer; }
	#main_div_wrap .top_div .left_div .left_top input[type=submit] { width: 570px; height: 50px; margin-top: 12px; border: 1px solid gray; border-radius: 5px; outline: none; cursor: pointer; font-size: 17px; }
	#main_div_wrap .top_div .left_div .left_bottom { width: 635px; height: 140px; margin-bottom: 10px; box-shadow: 1px 1px 5px 1px gray; background: white; }
	#main_div_wrap .top_div .left_div .left_bottom ul { text-align: center; }
	#main_div_wrap .top_div .left_div .left_bottom ul li { list-style: none; display: inline-block; height: 30px; }
	#main_div_wrap .top_div .left_div .left_bottom ul li .menu_img { width: 90px; height: 90px; margin: 10px auto; line-height: 80px; border-radius: 100%; cursor:pointer; }
	#main_div_wrap .top_div .left_div .left_bottom ul li .menu_txt { width: 130px; height: 30px; margin: 0 10px; line-height: 30px; cursor:pointer; } 
	#main_div_wrap .top_div .left_div .left_bottom ul li .menu_img a { text-decoration: none; color: black; font-size: 50px; text-align: center; vertical-align: middle; }
	#main_div_wrap .top_div .left_div .left_bottom ul li .menu_txt a { text-decoration: none; color: black; }
	#main_div_wrap .top_div .right_div { width: 635px; height: 500px; text-align: right; display: inline-block; vertical-align: middle; }
	#main_div_wrap .top_div .right_div .right_top { width: 635px; height: 372px; text-align: center; margin-bottom: 10px; box-shadow: 1px 1px 5px 1px gray; }
	#main_div_wrap .top_div .right_div .right_top img { width: 635px; height: 372px; text-align: center; }
	#main_div_wrap .top_div .right_div .right_bottom { width: 635px; height: 140px; box-shadow: 1px 1px 5px 1px gray; background: white; }
	#main_div_wrap .top_div .right_div .right_bottom h3 { width: 530px; display: inline-block; text-align: left; line-height: 40px; }
	#main_div_wrap .top_div .right_div .right_bottom a { text-decoration: none; color: black; }
	#main_div_wrap .top_div .right_div .right_bottom a span { width: 65px; display: inline-block; text-align: right; margin-right: 20px; font-size: 15px; color: black; }
	#main_div_wrap .top_div .right_div .right_bottom .noticelist { width: 100%; height: 100px; margin-top: 3px; }
	#main_div_wrap .top_div .right_div .right_bottom .noticelist p { text-align: left; width: 508px; display: inline-block; margin: 5px 0; }
	#main_div_wrap .top_div .right_div .right_bottom .noticelist p a { text-decoration: none; color: black; }
	#main_div_wrap .top_div .right_div .right_bottom .noticelist div { text-align: right; display: inline-block; width: 85px; margin-right: 19px; color: black; }
	#main_div_wrap .middle_div { width: 1280px; height: 170px; }
	#main_div_wrap .middle_div .mouse { width: 1280px; height: 30px; position: absolute; text-align: center; animation: motion 0.7s linear 0s infinite alternate; }
	@keyframes motion { 0% { margin-top: 40px; } 100% { margin-top: 60px; } }
	#main_div_wrap .bottom_div { width: 1280px; height: 800px; }
	#main_div_wrap .bottom_div h2 { width: 1192px; height: 70px; line-height: 70px; display: inline-block; margin-left: 5px; }
	#main_div_wrap .bottom_div a { text-decoration: none; color: black; }
	#main_div_wrap .bottom_div a span { width: 65px; display: inline-block; text-align: right; margin-right: 12px; font-size: 14px; }
	#main_div_wrap .bottom_div ul { text-align: center; }
	#main_div_wrap .bottom_div ul li { list-style: none; display: inline-block; width: 305px; height: 310px; text-align: left; margin: 8px 5px; box-shadow: 1px 1px 5px 1px gray; background: white; }
	#main_div_wrap .bottom_div ul li a:nth-child(1), li a:nth-child(4) { text-decoration: none; color: black; }
	#main_div_wrap .bottom_div ul li a:nth-child(1) img { width: 305px; height: 150px; }
	#main_div_wrap .bottom_div ul li p:nth-child(2) { height: 110px; font-size: 20px; font-weight: bold; line-height: 53px; }
	#main_div_wrap .bottom_div ul li p:nth-child(2) span { font-size: 14px; font-weight: lighter; color: gray; }
	#main_div_wrap .bottom_div ul li a:nth-child(4) { height: 50px; font-size: 15px; line-height: 50px; }
	#main_div_wrap .bottom_div ul li hr { height: 0.5px; background: lightgray; opacity: 0.3px; border: 0; }
	#main_div_wrap .bottom_div #hr{ height: 1px; background: lightgray; opacity: 0.3px; margin:10px; auto;}
</style>
</head>
<body>
<div id="main_div_wrap">
	<div class="top_div">
		<div class="top_sub_div"><h1>푸르른 상상 🚆  국민의 녹색 철도</h1></div>
		<div class="left_div">
			<div class="left_top">
				<form action="ticketCheckInfo" method="post">
					<select name="start_station" id="start_station">
						<option value="none" selected>출발역</option>
						<option value="st-01">수서</option>
						<option value="st-02">동탄</option>
						<option value="st-03">지제</option>
						<option value="st-04">천안아산</option>
						<option value="st-05">오송</option>
						<option value="st-06">대전</option>
						<option value="st-07">김천(구미)</option>
						<option value="st-08">동대구</option>
						<option value="st-09">신경주</option>
						<option value="st-10">울산(통도사)</option>
						<option value="st-11">부산</option>
					</select>
					<select name="end_station" id="end_station">
						<option value="none" selected>도착역</option>
						<option value="st-01">수서</option>
						<option value="st-02">동탄</option>
						<option value="st-03">지제</option>
						<option value="st-04">천안아산</option>
						<option value="st-05">오송</option>
						<option value="st-06">대전</option>
						<option value="st-07">김천(구미)</option>
						<option value="st-08">동대구</option>
						<option value="st-09">신경주</option>
						<option value="st-10">울산(통도사)</option>
						<option value="st-11">부산</option>
					</select>
					<div class="calendar">
						<c:set var="nowDate" value="<%= new Date() %>"/>
						<fmt:formatDate var="currDate" value="${nowDate }" pattern="yyyy-MM-dd"/>
						<input type="text" name="start_date" value="${currDate }" readonly="readonly" id="startDate">
						<a href="javascript:calendar();">📅</a>
						<c:out value="${startdate}"/>
						<div id="calendarwrap">
							<p id="close" onclick="closecalendar();">Ｘ</p>
					        <div id="ym">
					            <label onclick="lastMonth();">&lt;</label>
					            <div id="yearmonth"></div>
					            <label onclick="nextMonth();">&gt;</label>
					        </div>
					        <div id="calendar_table"></div>
					    </div>
					</div>
					<select name="start_time">
						<c:set var="nowTime" value="<%= new Date() %>"/>
						<fmt:formatDate var="currTime" value="${nowTime }" pattern="H"/>
						<c:forEach var="item" begin="0" end="22" step="2">
					    	<option value="${item}" <c:if test="${item <= currTime}">selected="selected"</c:if>>
					    		<c:if test="${item < 10}">0</c:if><c:out value="${item}시 이후" />
					    	</option>
					    </c:forEach>
					</select>
					<select name="adult" id="adult">
						<option value="0">어른(만 13세 이상) 0명</option>
						<option value="1" selected>어른(만 13세 이상) 1명</option>
						<option value="2">어른(만 13세 이상) 2명</option>
						<option value="3">어른(만 13세 이상) 3명</option>
						<option value="4">어른(만 13세 이상) 4명</option>
						<option value="5">어른(만 13세 이상) 5명</option>
						<option value="6">어른(만 13세 이상) 6명</option>
						<option value="7">어른(만 13세 이상) 7명</option>
						<option value="8">어른(만 13세 이상) 8명</option>
						<option value="9">어른(만 13세 이상) 9명</option>
					</select>
					<select name="child" id="child">
						<option value="0" selected>어린이(만 6~12세) 0명</option>
						<option value="1">어린이(만 6~12세) 1명</option>
						<option value="2">어린이(만 6~12세) 2명</option>
						<option value="3">어린이(만 6~12세) 3명</option>
						<option value="4">어린이(만 6~12세) 4명</option>
						<option value="5">어린이(만 6~12세) 5명</option>
						<option value="6">어린이(만 6~12세) 6명</option>
						<option value="7">어린이(만 6~12세) 7명</option>
						<option value="8">어린이(만 6~12세) 8명</option>
						<option value="9">어린이(만 6~12세) 9명</option>
					</select>
					<input type="submit" value="🔍 간편조회하기">
				</form>
			</div>
			<div class="left_bottom">
				<ul>
					<li>
						<div class="menu_img"><a href="#">🎟</a></div>
						<div class="menu_txt"><a href="#">예매내역·환불</a></div>
					</li>
					<li>
						<div class="menu_img"><a href="#">⏱</a></div>
						<div class="menu_txt"><a href="#">열차운임시간표</a></div>
					</li>
					<li>
						<div class="menu_img"><a href="boardListPage">📝</a></div>
						<div class="menu_txt"><a href="boardListPage">Q &amp; A</a></div>
					</li>
					<li>
						<div class="menu_img"><a href="lostInfo">🛍</a></div>
						<div class="menu_txt"><a href="lostInfo">유실물 안내</a></div>
					</li>
				</ul>
			</div>
		</div>
		<div class="right_div">
			<div class="right_top"><img alt="코로나 마스크" src="resources/image/index/mask5.png"></div> 
			<div class="right_bottom">
				<h3>공지사항</h3>
				<a href="#"><span> + 더보기</span></a>
				<div class="noticelist">
					<c:forEach var="ndto" items="${ndto }" begin="0" end="2">
						<p><a href="#"> • ${ndto.nt_title }</a></p>
						<div>${ndto.nt_date }</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
	<div class="middle_div">
		<div class="mouse">
		   <img src="resources/image/index/ico-e_scroll.png" alt="마우스">
		</div>
	</div>
	<div class="bottom_div">
		<h2>정차역 이용안내</h2>
		<a href="station"><span>더보기 + </span></a>
		<ul>
			<li>
				<a href="stationSuseo"><img src="resources/image/station/img_station_slide_suseo_01.jpg" alt="수서역"></a>
				<p>&nbsp;수서역<br><span>&nbsp;전국을 연결하는 철도교통의 새로운 중심지</span></p>
				<hr>
				<a href="stationSuseo">&nbsp;자세히보기 +</a>
			</li>
			<li>
				<a href="stationDongtan"><img src="resources/image/station/img_station_slide_dongtan_01.jpg" alt="동탄역"></a>
				<p>&nbsp;동탄역<br><span>&nbsp;새로운 교통문화의 시작</span></p>
				<hr>
				<a href="stationDongtan">&nbsp;자세히보기 +</a>
			</li>
			<li>
				<a href="stationJije"><img src="resources/image/station/img_station_slide_jije_01.jpg" alt="지제역"></a>
				<p>&nbsp;지제역<br><span>&nbsp;국제화 산업도시의 관문</span></p>
				<hr>
				<a href="stationJije">&nbsp;자세히보기 +</a>
			</li>
			<li>
				<a href="stationCheonan"><img src="resources/image/station/img_station_slide_cheonan.jpg" alt="천안아산역"></a>
				<p>&nbsp;천안아산역<br><span>&nbsp;각종 첨단시설을 갖춘 편리한 환승</span></p>
				<hr>
				<a href="stationCheonan">&nbsp;자세히보기 +</a>
			</li>
		</ul>
		<ul>
			<li>
				<a href="stationOhsong"><img src="resources/image/station/img_station_slide_ohsong.jpg" alt="오송역"></a>
				<p>&nbsp;오송역<br><span>&nbsp;국가 철도망 'X축'의 중심</span></p>
				<hr>
				<a href="stationOhsong">&nbsp;자세히보기 +</a>
			</li>
			<li>
				<a href="stationDaejeon"><img src="resources/image/station/img_station_slide_daejeon.jpg" alt="대전역"></a>
				<p>&nbsp;대전역<br><span>&nbsp;대한민국 철도역의 중심</span></p>
				<hr>
				<a href="stationDaejeon">&nbsp;자세히보기 +</a>
			</li>
			<li>
				<a href="stationKimcheon"><img src="resources/image/station/img_station_slide_kimcheon.jpg" alt="김천(구미)역"></a>
				<p>&nbsp;김천(구미)역<br><span>&nbsp;혁신도시의 원활한 접근</span></p>
				<hr>
				<a href="stationKimcheon">&nbsp;자세히보기 +</a>
			</li>
			<li>
				<a href="stationDongdaegu"><img src="resources/image/station/img_station_slide_dongdaegu.jpg" alt="동대구역"></a>
				<p>&nbsp;동대구역<br><span>&nbsp;명실상부한 대구·경북 지역의 최대 관문</span></p>
				<hr>
				<a href="stationDongdaegu">&nbsp;자세히보기 +</a>
			</li>
		</ul>
	</div>
</div>
</body>
<script type="text/javascript">
	var today = new Date(); //오늘 날짜를 기준으로 생성
	var date = new Date(); // today의 Date를 카운트
	var year = today.getFullYear(); // 년도
	var month = (today.getMonth() + 1); // 월
	var calendarwrap = document.getElementById("calendarwrap"); // 달력
	var close = document.getElementById("close");
	
	function lastMonth() { // 이전 달
	    month = month - 1; // 월 기억
	    
	    if(month < 1) {
	        year = year - 1;
	        month = 12;
	    }
	    calendar(); // 달력 출력 
	}
	
	function nextMonth() { //다음 달
	    month = month + 1; // 월 기억
	    
	    if(month > 12) {
	        year = year + 1;
	        month = 1;
	    }
	    calendar(); //달력 출력
	}
	
	function calendar() { // 달력 생성 함수
		calendarwrap.style.display = "block"; // 달력 열림
        ym.style.display = "block"; // 화살표 버튼 표기
        
        var yearmonth = document.getElementById("yearmonth"); // 년도와 월 표기
        yearmonth.innerText = year + "년 " + month + "월";
        
        var sevenday = new Array('일', '월', '화', '수', '목', '금', '토'); // 요일
        var nextmonth = new Date(year, month, 0); // 다음월 첫째날(전월 마지막날)
        var currmonth = new Date(year, (month - 1)); // 현재월
        var lastday = nextmonth.getDate(); // 현재월의 마지막날(날짜)
        var firstweek = currmonth.getDay(); // 현재월의 첫째날(요일)
        var daycnt = 0; // 7일 세는 체크키
        var wlastday = nextmonth.getDay(); // 마지막날짜의 요일
        
        var tbl = "<table>"; // 달력 그리기
        tbl += "<tr>";
        
        for(var i = 0; i < sevenday.length; i++) { // 요일 출력
            tbl += "<th>" + sevenday[i] + "</th>";
        }
        tbl += "</tr>"; // 줄바꿈
        tbl += "<tr>";
        
        for(var i = 0; i < firstweek; i++) { // 1일에 해당하는 요일이 나올 때까지 빈 칸 출력
            tbl += "<td></td>";
            daycnt++; // 7일 카운트
        }
        
        for(var i = 1; i <= lastday; i++) {
            if(daycnt % sevenday.length < 1) { // 일요일
                if(today.getFullYear() == date.getFullYear()) { // 현재 년도 일치
                    if(today.getMonth() == date.getMonth()) { // 현재 달 일치
                        if(i < date.getDate()) { // 현재 날짜보다 이전
                            tbl += "<td><font color=gray>" + i + "</font></td>";
                        }else if(i == date.getDate()) { // 현재 날짜와 동일
                            tbl += "<td class='choice' onclick='choiceDay(" + year + ", " + month + ", " + i + ");'><font color=red>" + i + "</font></td>";
                        }else if(date.getDate() < i && date.getDate()+7 > i) { // 현재 날짜로부터 7일
                            tbl += "<td class='choice' onclick='choiceDay(" + year + ", " + month + ", " + i + ");'><font color=red>" + i + "</font></td>";
                        }else { // 현재 날짜보다 이후
                            tbl += "<td><font color=gray>" + i + "</font></td>";
                        }
                        daycnt++;
                    }else {
                        tbl += "<td><font color=gray>" + i + "</font></td>";
                        daycnt++;
                    }
                }
            }else if(daycnt % sevenday.length < 6 ) { // 평일
                if(today.getFullYear() == date.getFullYear()) { // 현재 년도와 시스템 년도 일치
                    if(today.getMonth() == date.getMonth()) { // 현재 달과 시스템 달이 일치
                        if(i < date.getDate()) { // 현재 날짜보다 이전
                            tbl += "<td><font color=gray>" + i + "</font></td>";
                        }else if(i == date.getDate()) { // 현재 날짜와 동일
                            tbl += "<td class='choice' onclick='choiceDay(" + year + ", " + month + ", " + i + ");'><font color=black>" + i + "</font></td>";
                        }else if(date.getDate() < i && date.getDate()+7 > i) { // 현재 날짜로부터 7일
                            tbl += "<td class='choice' onclick='choiceDay(" + year + ", " + month + ", " + i + ");'><font color=black>" + i + "</font></td>";
                        }else { // 현재 날짜보다 이후
                            tbl += "<td><font color=gray>" + i + "</font></td>";
                        }
                        daycnt++;
                    }else {
                        tbl += "<td><font color=gray>" + i + "</font></td>";
                        daycnt++;
                    }
                }else {
                        tbl += "<td><font color=gray>" + i + "</font></td>";
                        daycnt++;
                }
            }else { // 토요일
                if(today.getFullYear() == date.getFullYear()) { // 현재 년도 일치
                    if(today.getMonth() == date.getMonth()) { // 현재 달 일치
                        if(i < date.getDate()) { // 현재 날짜보다 이전
                            tbl += "<td><font color=gray>" + i + "</font></td>";
                        }else if(i == date.getDate()) { // 현재 날짜와 동일
                            tbl += "<td class='choice' onclick='choiceDay(" + year + ", " + month + ", " + i + ");'><font color=blue>" + i + "</font></td>";
                        }else if(date.getDate() < i && date.getDate()+7 > i) { // 현재 날짜로부터 7일
                            tbl += "<td class='choice' onclick='choiceDay(" + year + ", " + month + ", " + i + ");'><font color=blue>" + i + "</font></td>";
                        }else { // 현재 날짜보다 이후
                            tbl += "<td><font color=gray>" + i + "</font></td>";
                        }
                        daycnt++;
                    }else {
                        tbl += "<td><font color=gray>" + i + "</font></td>";
                        daycnt++;
                    }
                    
                    if(daycnt == sevenday.length) {
                        tbl += "</tr><tr>"; // 토요일 다음 줄바꿈
                        daycnt = 0; // 초기화
                    }
                }else {
                        tbl += "<td><font color=gray>" + i + "</font></td>";
                        daycnt++;
                }
            }
        }
        
        for(var i = 0; i < sevenday.length; i++) {
            if(wlastday < i) { // 마지막 날짜의 요일과 1주일을 순서대로 비교하여 빈 칸 출력
                tbl += "<td></td>";
            }
        }
        tbl += "</tr>";
        tbl += "</table>";
        calendar_table.innerHTML = tbl;
	}
	
	function choiceDay(year, month, day) {		
		var startDate = document.getElementById("startDate");
		startDate.value = year + "-" + month + "-" + day;
		calendarwrap.style.display = "none";
	}
	
	function closecalendar() {
		calendarwrap.style.display = "none";
	}
</script>
</html>