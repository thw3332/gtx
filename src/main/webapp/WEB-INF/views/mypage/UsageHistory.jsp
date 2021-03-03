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
#usage_history_wrap { margin: 0 auto; width: 1280px; }
#usage_history_wrap h1{ text-align:center; margin-bottom: 50px; }
#usage_history_wrap h2{font-weight: 500; color:#7e7e7e;background: url(image/bgimg/bg_lefttop_pink.png) no-repeat left top; padding-top: 10px;}
#usage_history_wrap #infomenu_div { margin: 0 auto; text-align:right; border-bottom: 2px solid gray; width: 1280px; height: 30px; }
#usage_history_wrap #infomenu_div a{ text-decoration: none; color: black; }
#usage_history_wrap #infomenu_div a:nth-last-of-type(1){font-weight: bold;}
#usage_history_wrap #delay_info_menu_btn input { width: 422px; height: 55px; color:#3E3E3E; outline: none; vertical-align: middle; margin: 5px 0; border: 1px solid lightgray; background-color: #F4F4F4; font-size: 20px;}
#usage_history_wrap #delay_info_menu_btn input:hover{cursor: pointer; }   
#usage_history_wrap .usage_history_list { width: 100%; height: 310px; margin:10px auto; }
#usage_history_wrap .usage_history_list>table { width: 100%; border-collapse: collapse; text-align: center; }
#usage_history_wrap .usage_history_list>table tr { height:50px; } 
#usage_history_wrap .usage_history_list>table tr:nth-child(1) { background: gray; }
#usage_history_wrap .usage_history_list>table tr th { background: lightgray; width: 140px; height: 30px; border: 1px solid darkgray; }
#usage_history_wrap .usage_history_list>table tr td { width: 140px; height: 30px; border: 1px solid darkgray; }
#usage_history_wrap .usage_history_list>table tr td div { width: 80px; height: 30px; background: pink; margin: 3px auto; }
#usage_history_wrap .usage_history_list>table tr td div:nth-child(1) { background: yellow; }
#usage_history_wrap .usage_history_list>table tr td div a { text-decoration: none; color: black; vertical-align: middle; }
#usage_history_wrap .usage_history_list>table tr td:nth-child(7) div, td:nth-child(8) div { background: lightgray; }
#usage_history_wrap #usage_history{width: 1280px; margin:10px auto; border:1px solid lightgray; padding:20px; display: flex; justify-content: space-between; align-items: center;  box-sizing: border-box;}
#usage_history_wrap ul li{ font-size: 15px; color:#727070;background: url(resources/image/info/list_style.png) no-repeat left 4px; list-style: none; padding-left: 20px; }
#usage_history_wrap .usage_history_list>form #btn { width:900px; margin:0 auto; text-align: center; }
#usage_history_wrap .usage_history_list>form #selectbtn {  width:150px; height:45px; border:1px solid lightgray; background: #266b24; color:white; margin:20px; font-size: 17px; cursor:pointer; }
#usage_history_wrap .usage_history_list>form #receiptbtn {  width:150px; height:45px; border:1px solid lightgray; background: #e5335c; color:white; margin:20px; font-size: 17px; cursor:pointer; }

#usage_history_wrap #select_zindex { display:block; width: 500px; height: 350px; margin: 0 auto; border: 10px solid lightgray; box-sizing: border-box; position: absolute; z-index:1; background: white; top:250px; left:500px;  }
#usage_history_wrap #select_zindex h4{ margin-left: 10px; margin-top:10px; cursor: pointer; }
#usage_history_wrap #select_zindex h4 span{ color: black; font-weight: bold; font-size: 12px; margin-left: 285px; }
#usage_history_wrap #select_zindex form>table{ border-collapse: collapse;font-size: 12px; margin: 10px; }
#usage_history_wrap #select_zindex form>table tr { height: 40px; }
#usage_history_wrap #select_zindex form>table tr:nth-of-type(1) { border-bottom: 1px solid black; border-top: 3px solid black; }
#usage_history_wrap #select_zindex form>#last_tr { border:1px solid lightgray; border-top: 1px solid black; border-right: none; border-left: none; }
#usage_history_wrap #select_zindex form>table th { border:1px solid lightgray; width: 80px; background: rgba(234, 234, 234, 0.55); border-right: none; border-left: none; }
#usage_history_wrap #select_zindex form>table td { border:1px solid lightgray; width: 150px; border-right: none; padding-left: 10px; }
#usage_history_wrap #select_zindex input { width:80px; height: 35px; background: #9f4b4b; color:#ede6e6; font-size: 13px; }
#usage_history_wrap #select_zindex #print_div { width : 500px; height: 50px; vertical-align: middle; text-align: center; margin: 0 auto; padding: 10px; box-sizing: border-box;}

</style>
</head>
<body>
<!-- 이용내역/영수증 페이지 -->
<div id="usage_history_wrap">
	<h1>이용내역</h1>
	<div id="infomenu_div">
		<a href="#">홈&nbsp;》&nbsp;</a>
		<a href="#">승차권&nbsp;》&nbsp;</a>
		<a href="#">이용내역</a>
	</div>
	<div id="delay_info_menu_btn">
		<input id="ticket_info" type="button" value="발권/취소">
		<input id="delay_info" type="button" value="예약변경">
		<input id="train_schedule" type="button" value="이용내역/영수증">
	</div>
	<div id="usage_history">
		<ul>
			<li><strong>${name }</strong>고객님의 발권 및 환불내역을 확인할 수 있습니다.</li>
		</ul>
	</div>
	<div class="usage_history_list">
		<form id="form" method="post">
		    <table>
		        <tr>
		        	<th>선택</th>
		            <th>승차일자</th>
		            <th>열차번호</th>
		            <th>출발역</th>
		            <th>도착역</th>
		            <th>승차자명</th>
		            <th>반환번호</th>
		            <th>발권상태</th>
		            <th>금액</th>
		        </tr>
	        	<c:if test="${count == 0 }">
					<tr>
						<td colspan="11" >이용내역이 없습니다.</td> 
					</tr>
				</c:if>
				<c:if test="${count != 0 }">			
			        <c:forEach var="pdto" items="${pdto }">
				        <tr>
				        	<td><input type="radio" value="${pdto.buy_code }" name="rscode"  id="radiobtn"></td>
				            <td>${pdto.rs_startdate }</td>  <!-- 승차일자 -->
				            <td>${pdto.tr_code}</td><!-- 열차번호 -->
				          	<c:set var="start_time" value="${pdto.rt_stime }"/>
				            <td>${pdto.st_scode}<br>${fn:substring(start_time,0,5)}</td><!-- 출발역 -->
				            <c:set var="end_time" value="${pdto.rt_etime }"/>
				            <td>${pdto.st_ecode}<br>${fn:substring(end_time,0,5)}</td><!-- 도착역 -->
				           	<td>${name }</td><!-- 인원 -->
				           	<td>${pdto.buy_room }</td><!-- 반환번호 -->
				           	<td>발권완료</td>
				           	<td><fmt:formatNumber var="totalprice" value="${pdto.buy_totalprice}" pattern="#,###원" />${totalprice }</td><!-- 결제 -->
				        </tr>
			        </c:forEach> 
		        </c:if>
		    	</table>
		    	<div id="btn">
		    	 	<input type="button"  value="상세조회"  id="selectbtn" onclick="selectbtn()">
		    	</div>
		    	<div id="select_zindex">
		    		<h4>이용내역 상세정보<span onclick="close()">[닫기ⓧ]</span></h4>
				    <table>
				      <c:forEach var="pdto" items="${pdto }">
				        <tr>
				            <th>승차권종류</th>
				            <td colspan="3">스마트티켓</td>
				        </tr>
				        <tr>
				            <th>승차일자</th>
				            <td>${pdto.rs_startdate }</td>
				            <th>열차번호</th>
				            <td>${pdto.tr_code }</td>
				        </tr>
				        <tr>
				            <th>구간</th>
				            <c:set var="start_time" value="${pdto.rt_stime }"/>
				             <c:set var="end_time" value="${pdto.rt_etime }"/>
				            <td colspan="3">${pdto.st_scode}(${fn:substring(start_time,0,5)}) ~ ${pdto.st_ecode}(${fn:substring(end_time,0,5)})</td>
				        </tr>
				        <tr>
				            <th>객실등급</th>
				            <td>${pdto.buy_room }실</td>
				            <th>승객유형</th>
				            <td>${pdto.buy_passenger }</td>
				        </tr>
				        <tr id="last_tr">
				            <th>결제금액</th>
				            <td colspan="3"><fmt:formatNumber var="totalprice" value="${pdto.buy_totalprice}" pattern="#,###원" />${totalprice }</td>
				        </tr>
				       </c:forEach>
				    </table>
				    <div id="print_div">
				        <input type="button" value="인쇄" onclick="printWin()">
				    </div>
		    	</div>
		    </form>
		</div>
</div>
</body>
<script>
		/* radio버튼이 클릭 될때만 버튼이 실행되도록 수정 */
        var radio = document.getElementById("radiobtn");
        var select_zindex =  document.getElementById("select_zindex");
        
        function selectbtn(){
            if(radio.checked==false){
                alert("먼저 목록을 선택해주세요");
            }else{
            	if(select_zindex.style.display ="none"){
            		select_zindex.style.display ="block";
            	}
            }
        }
        
        /* 윈도우 프린트 기능 */
        function printWin() {
        	if(window.print){
        	window.print();
        	}
        }
      
        function close(){
        	select_zindex.style.display ="none";
        }
</script>
</html>