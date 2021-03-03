<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
#issue_cancel_wrap { margin: 0 auto; width: 1280px; }
#issue_cancel_wrap h1{ text-align:center; margin-bottom: 50px; }
#issue_cancel_wrap h2{font-weight: 500; color:#7e7e7e;background: url(image/bgimg/bg_lefttop_pink.png) no-repeat left top; padding-top: 10px;}
#issue_cancel_wrap #infomenu_div { margin: 0 auto; text-align:right; border-bottom: 2px solid gray; width: 1280px; height: 30px; }
#issue_cancel_wrap #infomenu_div a{ text-decoration: none; color: black; }
#issue_cancel_wrap #infomenu_div a:nth-last-of-type(1){font-weight: bold;}
#issue_cancel_wrap #delay_info_menu_btn input { width: 422px; height: 55px; color:#3E3E3E; outline: none; vertical-align: middle; margin: 5px 0; border: 1px solid lightgray; background-color: #F4F4F4; font-size: 20px;}
#issue_cancel_wrap #delay_info_menu_btn input:hover{cursor: pointer; }   
#issue_cancel_wrap .reserve_list { width: 100%; height: 310px; margin:10px auto; }
#issue_cancel_wrap .reserve_list table { width: 100%; border-collapse: collapse; text-align: center; }
#issue_cancel_wrap .reserve_list table tr { height:40px; } 
#issue_cancel_wrap .reserve_list table tr:nth-child(1) { background: gray; }
#issue_cancel_wrap .reserve_list table tr th { background: lightgray; width: 140px; height: 30px; border: 1px solid darkgray; }
#issue_cancel_wrap .reserve_list table tr td { width: 140px; height: 30px; border: 1px solid darkgray; }
#issue_cancel_wrap .reserve_list table tr td div { width: 80px; height: 30px; background: pink; margin: 3px auto; }
#issue_cancel_wrap .reserve_list table tr td div:nth-child(1) { background: yellow; }
#issue_cancel_wrap .reserve_list table tr td div a { text-decoration: none; color: black; vertical-align: middle; }
#issue_cancel_wrap .reserve_list table tr td:nth-child(7) div, td:nth-child(8) div { background: lightgray; }
#issue_cancel_wrap #reserve_info{width: 1280px; margin:10px auto; border:1px solid lightgray; padding:20px; display: flex; justify-content: space-between; align-items: center;  box-sizing: border-box;}
#issue_cancel_wrap #reserve_info2{width: 1280px; margin:10px auto; border:1px solid lightgray; padding:20px; display: flex; justify-content: space-between; align-items: center;  box-sizing: border-box;}
#issue_cancel_wrap ul li{ font-size: 15px; color:#727070;background: url(resources/image/info/list_style.png) no-repeat left 4px; list-style: none; padding-left: 20px; }
#issue_cancel_wrap #cancel_bu{ width:80px; height:35px; border:1px solid lightgray; background:#d40707; color:white; margin:5px;font-size: 12px; cursor:pointer;  } 
#issue_cancel_wrap #payment_bu{ width:80px; height:35px; border:1px solid lightgray; background:blue; color:white; margin:5px;font-size: 12px; cursor:pointer;  } 
</style>
</head>
<body>
<!-- 발권/취소 페이지 -->
<div id="issue_cancel_wrap">
	<h1>발권/취소</h1>
	<div id="infomenu_div">
		<a href="#">홈&nbsp;》&nbsp;</a>
		<a href="#">승차권&nbsp;》&nbsp;</a>
		<a href="#">발권/취소</a>
	</div>
	<div id="delay_info_menu_btn">
		<input id="ticket_info" type="button" value="발권/취소">
		<input id="delay_info" type="button" value="예약변경">
		<input id="train_schedule" type="button" value="이용내역/영수증">
	</div>
	<div id="reserve_info">
		<ul>
			<li><strong>${name }</strong>고객님의 예약 및 발권내역은 아래와 같습니다.</li>
			<li>출발시각 이전까지 예약한 승차권을 발권받지 않은 경우 자동 예약 좌석이 자동으로 취소되오니 반드시 승차권을 발권하시기 바랍니다.</li>
		</ul>
	</div>
	<div class="reserve_list">
		<form id="form" method="post">
		    <table>
		        <tr>
		        	<th>선택</th>
		            <th>승차일</th>
		            <th>열차번호</th>
		            <th>출발역</th>
		            <th>도착역</th>
		            <th>금액</th>
		            <th>인원</th>
		            <th>예약유형</th>
		            <th>결제</th>
		            <th>발권여부</th>
		            <th>취소/환불</th>
		        </tr>
	        	<c:if test="${count == 0 }">
					<tr>
						<td colspan="11" >발권내역이 없습니다.</td> 
					</tr>
				</c:if>
				<c:if test="${count != 0 }">			
			        <c:forEach var="rsdto" items="${rsdto }">
				        <tr>
				        	<td><input type="radio" value="${rsdto.rs_code }" name="rscode"  id="radiobtn"></td>
				            <td>${rsdto.rs_startdate }</td>  <!-- 승차일 -->
				            <td>${rsdto.tr_code}</td><!-- 열차번호 -->
				          	<c:set var="start_time" value="${rsdto.rt_stime }"/>
				            <td>${rsdto.st_scode}<br>${fn:substring(start_time,0,5)}</td><!-- 출발역 -->
				            <c:set var="end_time" value="${rsdto.rt_etime }"/>
				            <td>${rsdto.st_ecode}<br>${fn:substring(end_time,0,5)}</td><!-- 도착역 -->
		                    <td><fmt:formatNumber var="totalprice" value="${rsdto.rs_totalprice}" pattern="#,###원" />${totalprice }</td><!-- 금액 -->
				           	<td>${rsdto.rs_count}</td><!-- 인원 -->
				           	<td>${rsdto.tr_room }</td><!-- 승객유형 -->
				           	<td><fmt:formatNumber var="totalprice" value="${rsdto.rs_totalprice}" pattern="#,###원" />${totalprice }</td><!-- 결제 -->
				           	<td>${nowtime } 까지<br><input type="submit" id="payment_bu" value="결제하기" onclick="faction1()"></td><!-- 발권여부 -->
				           	<td><input type="submit" id="cancel_bu" value="예약취소" onclick="faction2()"></td><!-- 취소/환불 -->
				        </tr>
				        <input type="hidden" name="rt_code" value="${rsdto.rt_code }">
				        <input type="hidden" name="rs_startdate" value="${rsdto.rs_startdate }">
				        <input type="hidden" name="rt_code" value="${rsdto.rt_code }">
				        <input type="hidden" name="tr_code" value="${rsdto.tr_code }">
			        </c:forEach>
		        </c:if>
		    	</table>
		    	</form>
		</div>
		<div id="reserve_info2">
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
                form.action="payment";
                form.submit();
            }
        }
            
        function faction2(){
            if(radio.checked==false){
          
                alert("취소할 내역을 선택해주세요");
            }else{
            	form.action="reserveDelete"; 
                form.submit();
            }
        }
        
        
        
</script>
</html>