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
#reserve_change_wrap { margin: 0 auto; width: 1280px; }
#reserve_change_wrap h1{ text-align:center; margin-bottom: 50px; }
#reserve_change_wrap h2{ font-weight: 500; color:#7e7e7e;background: url(image/bgimg/bg_lefttop_pink.png) no-repeat left top; padding-top: 10px;}
#reserve_change_wrap #infomenu_div { margin: 0 auto; text-align:right; border-bottom: 2px solid gray; width: 1280px; height: 30px; }
#reserve_change_wrap #infomenu_div a{ text-decoration: none; color: black; }
#reserve_change_wrap #infomenu_div a:nth-last-of-type(1){font-weight: bold;}
#reserve_change_wrap #reserve_change_menu_btn input { width: 422px; height: 55px; color:#3E3E3E; outline: none; vertical-align: middle; margin: 5px 0; border: 1px solid lightgray; background-color: #F4F4F4; font-size: 20px;}
#reserve_change_wrap #reserve_change_menu_btn input:hover{cursor: pointer; }   
#reserve_change_wrap .reserve_change_div { width: 100%; height: 310px; }
#reserve_change_wrap .reserve_change_div table { width: 100%; border-collapse: collapse; text-align: center; }
#reserve_change_wrap .reserve_change_div table tr { height:40px; } 
#reserve_change_wrap .reserve_change_div table tr:nth-child(1) { background: gray; }
#reserve_change_wrap .reserve_change_div table tr th { background: lightgray; width: 140px; height: 30px; border: 1px solid darkgray; }
#reserve_change_wrap .reserve_change_div table tr td { width: 140px; height: 30px; border: 1px solid darkgray; }
#reserve_change_wrap .reserve_change_div table tr td div { width: 80px; height: 30px; background: pink; margin: 3px auto; }
#reserve_change_wrap .reserve_change_div table tr td div:nth-child(1) { background: yellow; }
#reserve_change_wrap .reserve_change_div table tr td div a { text-decoration: none; color: black; vertical-align: middle; }
#reserve_change_wrap .reserve_change_div table tr td:nth-child(7) div, td:nth-child(8) div { background: lightgray; }
#reserve_change_wrap #reserve_change_info{ width: 1280px; margin:10px auto; border:1px solid lightgray; padding:20px; display: flex; justify-content: space-between; align-items: center;  box-sizing: border-box;}
#reserve_change_wrap ul li{ font-size: 15px; color:#727070;background: url(resources/image/info/list_style.png) no-repeat left 4px; list-style: none; padding-left: 20px; }
#reserve_change_wrap #submit_div{ margin:0 auto; text-align: center; } 
#reserve_change_wrap #submit_div input[type=submit]{ width:150px; height:45px; border:1px solid lightgray; background: #006835; color:white; margin:20px;font-size: 15px; cursor:pointer;  } 

</style>
</head>
<body>
<div id="reserve_change_wrap">
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
			<li><strong>${name }</strong>고객님의 예약 및 발권내역은 아래와 같습니다.</li>
			<li>승차일자, 구간, 차실, 출발시각 변경하거나 승차인원이 증가하는 경우는 예약취소 후 다시 예약해야 합니다.</li>
			<li>출발시각 이전까지 예약한 승차권을 발권받지 않은 경우 자동 예약 좌석이 자동으로 취소되오니 반드시 승차권을 발권하시기 바랍니다.</li>		
		</ul>
	</div>
	<div class="reserve_change_div">
	<form action="reserveChangeForm" method="post" id="form">
		    <table>
		        <tr>
		        	<th>선택</th>
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
			        <c:forEach var="rsdto" items="${rsdto }">
				        <tr>
				        	<td><input type="radio" name="select"  value="${rsdto.rs_code }" id="radio"></td>
				            <td>${rsdto.rs_startdate }</td>  <!-- 승차일 -->
				            <td>${rsdto.tr_code}</td><!-- 열차번호 -->
				            <td>${rsdto.st_scode}<br></td><!-- 출발역 -->
				            <td>${rsdto.st_ecode}<br></td><!-- 도착역 -->
				            <c:set var="start_time" value="${rsdto.rt_stime }"/>
		                    <c:set var="end_time" value="${rsdto.rt_etime }"/>
		                    <td>${fn:substring(start_time,0,5)}</td><!-- 출발시간 -->
		                    <td>${fn:substring(end_time,0,5)}</td><!-- 도착시간 -->
				           	<td>${rsdto.rs_count}</td><!-- 인원 -->
				           	<td>${rsdto.tr_areano}&nbsp;${rsdto.rs_seat}</td><!-- 좌석정보 -->
				        </tr>
				        <input type="hidden" name="rt_code" value="${rsdto.rt_code }">
				        <input type="hidden" name="rs_startdate" value="${rsdto.rs_startdate }">
				        <input type="hidden" name="tr_code" value="${rsdto.tr_code }">
			        </c:forEach>
			      </c:if>
		    </table>
		    <div id="submit_div"><input type="submit"  value="인원수/유형변경"></div>
		</form>
		</div>
		<div id="reserve_change_info2">
			<ul>
				<li>결제 구입시한까지 결제(또는 구매)하지 않으면 자동으로 취소됩니다.</li>
				<li>역창구에서 승차권을 구입 시 본인을 확인할 수 있는 회원카드나 신분증을 제시해야 합니다.</li>
				<li>출발시각 이전까지 예약한 승차권을 발권받지 않는 경우 예약좌석이 자동으로 취소되니, 반드시 승차권을 발권 받으시기 바랍니다. </li>
			</ul>
		</div>
</div>
</body>
<script>
/* radio버튼이 클릭 될때만 결제하기 버튼이 실행되도록 수정 */
        var radio = document.getElementById("radiobtn");
        var form = document.getElementById("form");
        function faction1(){
            if(radio.checked==false){
                alert("발권할 내역을 선택해주세요");
            }else{
                form.submit();
            }
        }
</script>
</html>