<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
    #ticketcheckwrap { width: 1280px; height: 100%; margin: 0 auto; }
    #ticketcheckwrap h1 { height: 140px; text-align: center; line-height: 160px; }
    #ticketcheckwrap .menucheck { width: 100%; height: 25px; text-align: right; }
    #ticketcheckwrap .checkorder { width: 100%; height: 50px; text-align: right; line-height: 50px; }
    #ticketcheckwrap .checkorder div { display: inline-block; width: 60px; height: 30px; text-align: center; line-height: 30px; border-radius: 50px; vertical-align: middle; font-size: 14px; background: pink; }
    #ticketcheckwrap .ticketcheckbox { width: 100%; height: 310px; border: 1px solid lightgray; }
    #ticketcheckwrap .ticketcheckbox .check_one { margin: 15px 230px 0 230px; }
    #ticketcheckwrap .ticketcheckbox .check_one select { width: 200px; height: 50px; text-align: center; margin: 17px 10px; border: 1px solid lightgray; cursor: pointer; display: inline-block; }
	#ticketcheckwrap .ticketcheckbox .check_one select:nth-child(1), select:nth-child(2) { margin-top: 20px; }
	#ticketcheckwrap .ticketcheckbox .check_one a { text-decoration: none; color: black; }
    #ticketcheckwrap .ticketcheckbox .check_one a #changeinfo { font-size: 30px; color: lightgray; padding: 0 5px; }
    #ticketcheckwrap .ticketcheckbox .check_one .calendar { width: 200px; height: 50px; text-align: center; position: relative; vertical-align: middle; margin: 10px; border: 1px solid lightgray; cursor: pointer; display: inline-block; background: white;}
	#ticketcheckwrap .ticketcheckbox .check_one .calendar input[type=text] { width: 160px; height: 50px; border: none; outline: none; }
	#ticketcheckwrap .ticketcheckbox .check_one .calendar a { text-decoration: none; color: black; }
    #ticketcheckwrap .ticketcheckbox .check_one .calendar #calendarwrap { display: none; width: 250px; height: 270px; margin: 15px auto; background: white; border: 1px solid lightgray; position: absolute; z-index: 1; left: 55px; }
	#ticketcheckwrap .ticketcheckbox .check_one .calendar #calendarwrap p { width: 235px; margin: 0 auto; text-align: right; }
	#ticketcheckwrap .ticketcheckbox .check_one .calendar #calendarwrap #ym { width: 250px; height: 30px; text-align: center; }
    #ticketcheckwrap .ticketcheckbox .check_one .calendar #calendarwrap #ym label { width: 30px; height: 25px; border: 1px solid #ccc; outline: none; display: inline-block; cursor: pointer; }
    #ticketcheckwrap .ticketcheckbox .check_one .calendar #calendarwrap #ym #yearmonth { width: 161px; height: 20px; margin: 9px auto; text-align: center; line-height: 20px; display: inline-block;}
    #ticketcheckwrap .ticketcheckbox .check_one .calendar #calendarwrap #calendar_table { width: 250px; margin: 0 auto; }
    #ticketcheckwrap .ticketcheckbox .check_one .calendar #calendarwrap #calendar_table table { width: 240px; text-align: center; border: none; margin: 8px auto; }
    #ticketcheckwrap .ticketcheckbox .check_one .calendar #calendarwrap #calendar_table tr th, td { width: 30px; height: 30px; border: 1px solid lightgray; }
    #ticketcheckwrap .ticketcheckbox .check_one .calendar #calendarwrap #calendar_table tr .choice { font-weight: bold; cursor: pointer; }
    #ticketcheckwrap .ticketcheckbox .check_one .time { width: 70px; height: 50px; text-align: center; border: 1px solid lightgray; cursor: pointer; outline: none; margin-left: 10px; }
    #ticketcheckwrap .ticketcheckbox .check_two { margin: 0 230px; }
    #ticketcheckwrap .ticketcheckbox .check_two ul { text-align: left; }
    #ticketcheckwrap .ticketcheckbox .check_two ul li { list-style: none; }
    #ticketcheckwrap .ticketcheckbox .check_two ul li div { display: inline-block; margin: 15px; }
    #ticketcheckwrap .ticketcheckbox .check_two ul li div select { width: 180px; height: 50px; text-align: center; margin: 5px 15px 0 0; border: 1px solid lightgray; cursor: pointer; outline: none; }
    #ticketcheckwrap .searchbtn { width: 100%; text-align: center; margin: 30px 0 50px 0; }
    #ticketcheckwrap .searchbtn input { width: 180px; height: 50px; cursor: pointer; outline: none; }
    #ticketcheckwrap .ticketchecklist { width: 100%; height: 310px; }
    #ticketcheckwrap .ticketchecklist table { width: 100%; border-collapse: collapse; text-align: center; }
    #ticketcheckwrap .ticketchecklist table tr .infotitle { background: lightgray; text-align: left; padding: 0 7px; }
    #ticketcheckwrap .ticketchecklist table tr th { background: lightgray; width: 140px; height: 30px; border: 1px solid darkgray; }
    #ticketcheckwrap .ticketchecklist table tr td { width: 140px; height: 30px; border: 1px solid darkgray; }
    #ticketcheckwrap .ticketchecklist table tr td input[type=button] { width: 70px; height: 30px; border: 1px solid #2B9898; color: white; background: #2B9898; font-size: 15px; cursor: pointer; outline: none; }
    #ticketcheckwrap .ticketchecklist table tr td>div { width: 120px; height: 30px; margin: 3px auto; }
    #ticketcheckwrap .ticketchecklist table tr td>div>a { text-decoration: none; color: white; line-height: 30px; background: #2B9898; padding: 5px 10px; }
</style>
</head>
<body>
	<div id="ticketcheckwrap">
		<h1>일반승차권 조회</h1>
		<div class="menucheck">홈 > 승차권 > 승차권예약 > <strong>일반승차권조회</strong></div>
		<hr>
		<div class="checkorder">
			<div>조회</div>—<div>예약</div>—<div>결제</div>—<div>발권</div>
		</div>
		<form action="ticketCheckList" method="post">
            <div class="ticketcheckbox">
                <div class="check_one">
                	<input type="hidden" name="startstation" value="${startstation }" id="startst">
                    <select name="start_station" id="start_st">
						<option value="st-01" selected>수서</option>
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
					<a href="javascript:changeinfo(this.form);"><span id="changeinfo">⇌</span></a>
					<input type="hidden" name="endstation" value="${endstation }" id="endst">
					<select name="end_station" id="end_st">
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
						<option value="st-11" selected>부산</option>
					</select>
                    <div class="calendar">
						<c:set var="nowDate" value="<%= new Date() %>"/>
						<fmt:formatDate var="currDate" value="${nowDate }" pattern="yyyy-MM-dd(E)"/>
						<fmt:parseDate var="startDate" value="${startdate }" pattern="yyyy-MM-dd"/>
						<fmt:formatDate var="start_Date" value="${startDate }" pattern="yyyy-MM-dd(E)"/>
						<c:if test="${empty start_Date }">
							<input type="text" name="start_date" value="${currDate }" readonly="readonly" id="startDate">
						</c:if>
						<c:if test="${!empty start_Date }">
							<input type="text" name="start_date" value="${start_Date }" readonly="readonly" id="startDate">
						</c:if>
						<a href="javascript:calendar();">📅</a>
						<div id="calendarwrap">
							<p onclick="closeCalendar();">Ｘ</p>
					        <div id="ym">
					            <label onclick="lastMonth();">&lt;</label>
					            <div id="yearmonth"></div>
					            <label onclick="nextMonth();">&gt;</label>
					        </div>
					        <div id="calendar_table"></div>
					    </div>
					</div>
                    <select name="start_time" class="time">
                    	<c:set var="nowTime" value="<%= new Date() %>"/>
						<fmt:formatDate var="currTime" value="${nowTime }" pattern="H"/>
                    	<c:forEach var="item" varStatus="i" begin="0" end="22" step="2">
                    		<c:if test="${empty starttime }">
								<option value="${item}" <c:if test="${item <= currTime}">selected="selected"</c:if>>
						    		<c:if test="${item < 10}">0</c:if><c:out value="${item} 시" />
						    	</option>
							</c:if>
							<c:if test="${!empty starttime }">
								<option value="${item}" <c:if test="${item <= starttime}">selected="selected"</c:if>>
						    		<c:if test="${item < 10}">0</c:if><c:out value="${item} 시" />
						    	</option>
							</c:if>
					    </c:forEach>
                    </select>
                </div>
                <div class="check_two">
                    <ul>
                       	<li>
                            <div>◾ 인원정보</div>
                            <div>
                            	<input type="hidden" name="adult" value="${adult }" id="adultperson">
                                <select name="adult_person" id="adultper">
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
                                </select>&nbsp;
                                <input type="hidden" name="child" value="${child }" id="childperson">
                                <select name="child_person" id="childper">
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
                            </div>
                        </li>
                        <li>
                            <div>◾ 여정경로</div>
                            <div><input type="radio" checked> 직통</div>
                        </li>
                        <li>
                            <div>◾ 차종구분</div>
                            <div><input type="radio" checked> GTX</div>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="searchbtn"><input type="submit" value="조회하기"></div>
		</form>
		<div class="ticketchecklist">
		    <table>
                <tr>
                    <td colspan="9" class="infotitle">· ${start_name } → ${end_name } &nbsp; ${startdate}</td>
                </tr>
		        <tr>
		            <th>구분</th>
		            <th>열차번호</th>
		            <th>출발역</th>
		            <th>도착역</th>
		            <th>특실</th>
		            <th>일반실</th>
		            <th>운행시간</th>
		            <th>운행요금</th>
		            <th>소요시간</th>
		        </tr>
		        <c:forEach var="tdto" items="${tdto }">
		        	<tr>
			            <td>직통</td>
			            <td>
			            	${tdto.tr_code }
			            	<input type="hidden" name="tr_code" value="${tdto.tr_code }">
			            </td>
			            <c:set var="start_time" value="${tdto.rt_stime }"/>
			            <td>
			            	${tdto.st_sname }<br>${fn:substring(start_time,0,5)}
			            	<input type="hidden" name="st_scode" value="${tdto.st_scode }">
			            </td>
			            <c:set var="end_time" value="${tdto.rt_etime }"/>
			            <td>
			            	${tdto.st_ename }<br>${fn:substring(end_time,0,5)}
			            	<input type="hidden" name="st_ecode" value="${tdto.st_ecode }">
			            </td>
	                    <td>
		                    <c:if test="${empty adult && empty child}">
		                    	<input type="button" value="좌석선택" onclick="location.href='seatChoice?tr_code=${tdto.tr_code}&st_scode=${tdto.st_scode }&st_ecode=${tdto.st_ecode }&start_date=${startdate}&adult_person=${adult_person}&child_person=${child_person }&hocha=3'">
					    	</c:if>
					    	<c:if test="${!empty adult && !empty child}">
					    		<input type="button" value="좌석선택" onclick="location.href='seatChoice?tr_code=${tdto.tr_code}&st_scode=${tdto.st_scode }&st_ecode=${tdto.st_ecode }&start_date=${startdate}&adult=${adult}&child=${child }&hocha=3'">
					    	</c:if>
	                    </td>
			            <td>
		                    <c:if test="${empty adult && empty child}">
		                    	<input type="button" value="좌석선택" onclick="location.href='seatChoice?tr_code=${tdto.tr_code}&st_scode=${tdto.st_scode }&st_ecode=${tdto.st_ecode }&start_date=${startdate}&adult_person=${adult_person}&child_person=${child_person }&hocha=1'">
					    	</c:if>
					    	<c:if test="${!empty adult && !empty child}">
					    		<input type="button" value="좌석선택" onclick="location.href='seatChoice?tr_code=${tdto.tr_code}&st_scode=${tdto.st_scode }&st_ecode=${tdto.st_ecode }&start_date=${startdate}&adult=${adult}&child=${child }&hocha=1'">
					    	</c:if>
			            </td>
			            <td><div><a href="routetime">보기</a></div></td>
			            <td><div><a href="price">보기</a></div></td>
			            <c:set var="lead_time" value="${tdto.rt_leadtime }"/>
			            <td>${fn:substring(lead_time,0,5)}</td>
			        </tr>
		        </c:forEach>
		    </table>
		</div>
	</div>
</body>
<script src="https://code.jquery.com/jquery-2.2.1.js"></script>
<script type="text/javascript">
	var startst = document.getElementById("startst"); // 출발역
	var startselect = document.getElementById("start_st"); // 출발역 select box
	
	for(var i = 0; i < startselect.length; i++) {
		
		if(startst.value == startselect[i].value) {
			startselect[i].selected = true;
		}
	}
	
	var endst = document.getElementById("endst"); // 도착역
	var endselect = document.getElementById("end_st"); // 도착역 select box
	
	for(var i = 0; i < endselect.length; i++) {
		
		if(endst.value == endselect[i].value) {
			endselect[i].selected = true;
		}
	}
	//----------------------------------------------------------------------
	function changeinfo(frm) { // 출발역과 도착역 바꾸기
		var temp = $("#start_st").val();
		$("#start_st").val($("#end_st").val());
		$("#end_st").val(temp);
	}
	//----------------------------------------------------------------------
	var adultperson = document.getElementById("adultperson"); // 어른
	var adultselect = document.getElementById("adultper"); // 어른 select box
	
	for(var i = 0; i < adultselect.length; i++) {

		if(adultperson.value == adultselect[i].value) {
			adultselect[i].selected = true;
		}
	}
	
	var childperson = document.getElementById("childperson"); // 어린이
	var childselect = document.getElementById("childper"); // 어린이 select box
	
	for(var i = 0; i < childselect.length; i++) {
		
		if(childperson.value == childselect[i].value) {
			childselect[i].selected = true;
		}
	}
	//-----------------------------------------------------------------------------
    var today = new Date(); //오늘 날짜를 기준으로 생성
    var date = new Date(); // today의 Date를 카운트
    var year = today.getFullYear(); // 년도
    var month = (today.getMonth() + 1); // 월
    var calendarwrap = document.getElementById("calendarwrap"); // 달력
    var close = document.getElementById("close"); // X 부분
    
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
    
    function choiceDay(year, month, day) { // 날짜 선택
    	var startDate = document.getElementById("startDate"); // 현재일자
		var calendar = document.getElementById("calendarwrap"); // 달력
		var sevenday = new Array('일', '월', '화', '수', '목', '금', '토'); // 요일
		var startday = year + "-" + month + "-" + day; // 선택일자
		var currday = sevenday[new Date(startday).getDay()]; // 선택요일
		startDate.value = year + "-" + month + "-" + day + "(" + currday + ")";
		calendarwrap.style.display = "none"; // 달력 닫기
    }
    
    function closeCalendar() { // 달력 닫기
		calendarwrap.style.display = "none";
	}
    
</script>
</html>