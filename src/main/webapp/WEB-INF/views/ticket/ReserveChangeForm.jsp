<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
#reserve_change_form_wrap { margin: 0 auto; width: 1280px; }
#reserve_change_form_wrap h1{ text-align:center; margin-bottom: 50px; }
#reserve_change_form_wrap h2{font-weight: 500; color:#7e7e7e;background: url(image/bgimg/bg_lefttop_pink.png) no-repeat left top; padding-top: 10px;}
#reserve_change_form_wrap #infomenu_div { margin: 0 auto; text-align:right; border-bottom: 2px solid gray; width: 1280px; height: 30px; }
#reserve_change_form_wrap #infomenu_div a{ text-decoration: none; color: black; }
#reserve_change_form_wrap #infomenu_div a:nth-last-of-type(1){font-weight: bold;}
#reserve_change_form_wrap #reserve_change_menu_btn input { width: 422px; height: 55px; color:#3E3E3E; outline: none; vertical-align: middle; margin: 5px 0; border: 1px solid lightgray; background-color: #F4F4F4; font-size: 20px;}
#reserve_change_form_wrap #reserve_change_menu_btn input:hover{cursor: pointer; }   
#reserve_change_form_wrap .reserve_change_div { width: 100%; height: 310px; }
#reserve_change_form_wrap .reserve_change_div table { width: 100%; border-collapse: collapse; text-align: center; }
#reserve_change_form_wrap .reserve_change_div table tr { height:40px; } 
#reserve_change_form_wrap .reserve_change_div table tr:nth-child(1) { background: gray; }
#reserve_change_form_wrap .reserve_change_div table tr th { background: lightgray; width: 140px; height: 30px; border: 1px solid darkgray; }
#reserve_change_form_wrap .reserve_change_div table tr td { width: 140px; height: 30px; border: 1px solid darkgray; }
#reserve_change_form_wrap .reserve_change_div table tr td div { width: 80px; height: 30px; background: pink; margin: 3px auto; }
#reserve_change_form_wrap .reserve_change_div table tr td div:nth-child(1) { background: yellow; }
#reserve_change_form_wrap .reserve_change_div table tr td div a { text-decoration: none; color: black; vertical-align: middle; }
#reserve_change_form_wrap .reserve_change_div table tr td:nth-child(7) div, td:nth-child(8) div { background: lightgray; }
#reserve_change_form_wrap #reserve_change_info{width: 1280px; margin:10px auto; border:1px solid lightgray; padding:20px; display: flex; justify-content: space-between; align-items: center;  box-sizing: border-box;}
#reserve_change_form_wrap #reserve_change_info2{width: 1280px; margin:10px auto; border:1px solid lightgray; padding:20px; display: flex; justify-content: space-between; align-items: center;  box-sizing: border-box;}
#reserve_change_form_wrap ul li{ font-size: 15px; color:#727070;background: url(resources/image/info/list_style.png) no-repeat left 4px; list-style: none; padding-left: 20px; }
#reserve_change_form_wrap #selectbox{ width:70%; height:30px; box-sizing: border-box; }
#reserve_change_form_wrap #rs_count{ width:25%; height:25px; text-align: center; } 
#reserve_change_form_wrap #bu_div{ display:flex; justify-content: center; align-content: center; }
#reserve_change_form_wrap #bu_div input[type=submit]{  width:150px; height:45px; border:1px solid lightgray; background: #e5335c; color:white; margin:20px; font-size: 17px; cursor:pointer; }
hr{margin:10px;}
</style>
</head>
<body>
<div id="reserve_change_form_wrap">
	<h1>예약변경</h1>
	<div id="infomenu_div">
		<a href="#">홈&nbsp;》&nbsp;</a>
		<a href="#">승차권&nbsp;》&nbsp;</a>
		<a href="#">예약변경</a>
	</div>
	<div id="reserve_change_menu_btn">
		<input id="ticket_info" type="button" value="발권/취소">
		<input id="delay_info" type="button" value="예약변경">
		<input id="train_schedule" type="button" value="이용내역/영수증">
	</div>
	<div id="reserve_change_info">
		<ul>
			<li>변경하실 승객유형 및 인원수를 선택하십시오.</li>
			<li>예약 및 변경내역에 따라 소정의 수수료가 부과될 수 있습니다.</li>
			<li>결제한 승차권에 대한 변경은 예약내역의 운임요금으로 청구됩니다.</li>
		</ul>
	</div>
	<div class="reserve_change_div">
		<form action="reserveUpadateForm" method="post">
		    <table>
		        <tr>
		            <th>승차일</th>
		            <th>열차번호</th>
		            <th>출발역</th>
		            <th>도착역</th>
		            <th>출발시간</th>
		            <th>도착시간</th>
		            <th>인원</th>
		            <th>좌석정보</th>
		        </tr>
		        <c:if test="${count == 0 }">
					<tr>
						<td colspan="10" >처리할 내역이 없습니다</td> 
					</tr>
				</c:if>
				<c:if test="${count != 0 }">
			        <c:forEach var="rsdto2" items="${rsdto2 }">
			        <input type="hidden" name="rs_code" value=${rsdto2.rs_code }>
				        <tr>
				            <td>${rsdto2.rs_startdate }</td>  <!-- 승차일 -->
				            <td>${rsdto2.tr_code}</td><!-- 열차번호 -->
				            <td>${rsdto2.st_scode}<br></td><!-- 출발역 -->
				            <td>${rsdto2.st_ecode}<br></td><!-- 도착역 -->
				            <c:set var="start_time" value="${rsdto2.rt_stime }"/>
		                    <c:set var="end_time" value="${rsdto2.rt_etime }"/>
		                    <td>${fn:substring(start_time,0,5)}</td><!-- 출발시간 -->
		                    <td>${fn:substring(end_time,0,5)}</td><!-- 도착시간 -->
				           	<td>${rsdto2.rs_count}</td><!-- 인원 -->
				           	<td>${rsdto2.tr_areano}&nbsp;${rsdto2.rs_seat}</td><!-- 좌석정보 -->
				        </tr>
			        </c:forEach>
			        </c:if>
		    </table>
		    <hr> 
		    <table>
		    <c:if test="${count == 0 }">
					<tr>
						<td colspan="10" >처리할 내역이 없습니다</td> 
					</tr>
				</c:if>
				<c:if test="${count != 0 }">
			    <tr>
			    	<th colspan="2">승차일</th>
		            <th colspan="2">열차번호</th>
					<th colspan="4">승객유형</th>
				</tr>
				<c:forEach var="rsdto2" items="${rsdto2 }">
					<tr>
						<td colspan="2">${rsdto2.rs_startdate }</td>  <!-- 승차일 -->
				        <td colspan="2">${rsdto2.tr_code}</td><!-- 열차번호 -->
						<td colspan="4">
							<select id="selectbox" name="rs_passenger">
								<option selected>${rsdto2.rs_passenger}</option>
									<c:choose>
									    <c:when test="${rsdto2.rs_passenger=='어른' }">
									          	<option>어린이</option>
									     </c:when>
									     <c:otherwise> 
									          <option>어른</option>
									     </c:otherwise> 
									 </c:choose>
							</select>
						</td>
					</tr>
					<input type="hidden" name="rt_code" value="${rsdto2.rt_code }">
				    <input type="hidden" name="rs_startdate" value="${rsdto2.rs_startdate }">
				    <input type="hidden" name="tr_code" value="${rsdto2.tr_code }">
				</c:forEach>
				</c:if>
			</table>
			<div id="bu_div">
			<input type="submit"  value="변경하기">
			</div>
			</form>
		</div>
</div>
</body>
</html>