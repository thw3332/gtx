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
#payment_wrap { margin: 0 auto; width: 1280px; }
#payment_wrap h1{ text-align:center; margin-bottom: 50px; }
#payment_wrap h2{font-weight: 500; color:#7e7e7e;background: url(image/bgimg/bg_lefttop_pink.png) no-repeat left top; padding-top: 10px;}
#payment_wrap #infomenu_div { margin: 0 auto; text-align:right; border-bottom: 2px solid gray; width: 1280px; height: 30px; }
#payment_wrap #infomenu_div a{ text-decoration: none; color: black; }
#payment_wrap #infomenu_div a:nth-last-of-type(1){font-weight: bold;}
#payment_wrap .payment_div { width: 100%; height: 310px; margin-top:5px;}
#payment_wrap .payment_div table { width: 100%; border-collapse: collapse; text-align: center; }
#payment_wrap .payment_div table tr { height:40px; } 
#payment_wrap .payment_div table tr:nth-child(1) { background: gray; }
#payment_wrap .payment_div table tr th { background: lightgray; width: 140px; height: 30px; border: 1px solid darkgray; }
#payment_wrap .payment_div table tr td { width: 140px; height: 30px; border: 1px solid darkgray; }
#payment_wrap .payment_div table tr td div { width: 80px; height: 30px; background: pink; margin: 3px auto; }
#payment_wrap .payment_div table tr td div:nth-child(1) { background: yellow; }
#payment_wrap .payment_div table tr td div a { text-decoration: none; color: black; vertical-align: middle; }
#payment_wrap .payment_div table tr td:nth-child(7) div, td:nth-child(8) div { background: lightgray; }
#payment_wrap ul li{ font-size: 15px; color:#727070;background: url(resources/image/info/list_style.png) no-repeat left 4px; list-style: none; padding-left: 20px; }
#payment_wrap #bu_div{ display:flex; justify-content: center; align-content: center; }
#payment_wrap #bu_div input[type=submit]{  width:150px; height:45px; border:1px solid lightgray; background: #e5335c; color:white; margin:20px; font-size: 17px; cursor:pointer; }
#payment_wrap #bu_div input[type=button]{  width:150px; height:45px; border:1px solid lightgray; background: gray; color:white; margin:20px; font-size: 17px; cursor:pointer; }
#payment_wrap #price{ width: 1280px; height:60px; margin:10px auto; border:1px solid lightgray; padding:20px; display: flex; justify-content: flex-end; align-items: center;  box-sizing: border-box;}
#payment_wrap #price #total{ color:#e5335c;  }
hr{margin:10px;}
</style>
</head>
<body>
<div id="payment_wrap">
	<h1>예약하기</h1>
	<div id="infomenu_div">
		<a href="#">홈&nbsp;》&nbsp;</a>
		<a href="#">승차권&nbsp;》&nbsp;</a>
		<a href="#">발권/취소&nbsp;》&nbsp;</a>
		<a href="#">예약하기</a>
	</div>
	<div class="payment_div">
	<form action="paymentView" method="post">
	    <table>
	        <tr>
	            <th>승차일자</th>
	            <th>열차번호</th>
	            <th>출발역</th>
	            <th>도착역</th>
	            <th>출발시간</th>
	            <th>도착시간</th>
	            <th>인원</th>
	            <th>총 결제금액</th>
	        </tr>
	        <c:if test="${count == 0 }">
				<tr>
					<td colspan="10" >처리할 내역이 없습니다</td> 
				</tr>
			</c:if>
			<c:if test="${count != 0 }">
		        <c:forEach var="pdto" items="${pdto }">
			        <tr>
			            <td>${pdto.rs_startdate }</td> <!-- 승차일 -->
			            <td>${pdto.tr_code}</td><!-- 열차번호 -->
			            <td>${pdto.st_scode}<br></td><!-- 출발역 -->
			            <td>${pdto.st_ecode}<br></td><!-- 도착역 -->
			            <c:set var="start_time" value="${pdto.rt_stime }"/>
	                    <c:set var="end_time" value="${pdto.rt_etime }"/>
	                    <td>${fn:substring(start_time,0,5)}</td><!-- 출발시간 -->
	                    <td>${fn:substring(end_time,0,5)}</td><!-- 도착시간 -->
			           	<td>${pdto.rs_count}</td><!-- 인원 -->
			           	<td>${pdto.rs_totalprice }</td><!-- 총 결제금액 -->
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
			    	<th>열차번호</th>
			    	<th>객실등급</th>
			    	<th>좌석정보</th>
			    	<th>승객유형</th>
			    	<th colspan="2">운임요금</th>
			    	<th colspan="2">영수금액</th>
				</tr>
				<c:forEach var="pdto1" items="${pdto1 }">
					<tr>
						<td>${pdto1.tr_code}</td>
						<td>${pdto1.tr_room }</td>
						<td>${pdto1.tr_areano }&nbsp;${pdto1.rs_seat }</td>
						<td>${pdto1.rs_passenger }</td>
						<c:choose>
							<c:when test="${pdto1.rs_passenger=='어른' }">
								<td colspan="2"><fmt:formatNumber var="totalprice" value="${pdto1.pr_adultprice}" pattern="#,###원" />${totalprice }</td>
								<td colspan="2">	<fmt:formatNumber var="totalprice" value="${pdto1.pr_adultprice}" pattern="#,###원" />${totalprice }</td>
							</c:when>
							<c:otherwise>
								<td colspan="2"><fmt:formatNumber var="totalprice" value="${pdto1.pr_childprice}" pattern="#,###원" />${totalprice }</td>
								<td colspan="2">	<fmt:formatNumber var="totalprice" value="${pdto1.pr_childprice}" pattern="#,###원" />${totalprice }</td>
							</c:otherwise>
						</c:choose>
					</tr>
					<input type="hidden" name="buy_code" value="${pdto1.rs_code }">
					<input type="hidden" name="rt_code" value="${pdto1.rt_code }">
					<input type="hidden" name="tr_code" value="${pdto1.tr_code }">
					<input type="hidden" name="rs_startdate" value="${pdto1.rs_startdate }">
				</c:forEach>
			</c:if>
		</table>
		<div id="bu_div">
		<input type="submit"  value="결제하기" >
		<input type="button"  value="취소하기" onclick="location.href='issueList'">
		</div>
	</form>
	</div>
	
</div>
</body>
</html>