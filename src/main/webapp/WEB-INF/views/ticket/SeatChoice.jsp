<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
    #seatwrap { width: 1000px; height: 900px; margin: 0 auto; }
	#seatwrap p { margin: 0 10px; text-align: left; }
	#seatwrap h2 { margin: 0 10px; text-align: left; }
	#seatwrap .close { margin: 0 10px; text-align: right; cursor: pointer; }
	#seatwrap .trainhowrap { margin: 20px auto; }
	#seatwrap .trainhowrap .trainho { list-style: none; display: flex; justify-content: center; }
	#seatwrap .trainhowrap .trainho .ho { width: 60px; height: 60px; border: 1px solid black; margin: 20px 10px; text-align: center; line-height: 30px; }
	#seatwrap .trainhowrap .trainho .ho a { text-decoration: none; color:black; text-align: center; }
    #seatwrap .trainhowrap .pinfo { text-align: center; }
    #seatwrap .trainhowrap .pinfo input { width: 16px; height: 16px; font-size: 16px; text-align: center; border: none; }
    #seatwrap .tinfo { width: 100%; height: 50px; border: 1px solid black; text-align: right; }
    #seatwrap .seat_table { width: 700px; height: 300px; margin: 0 auto; }
    #seatwrap .seat_table table { width: 500px; height: 200px; margin: 20px auto; border-collapse: collapse; }
    #seatwrap .seat_table table tr td { width: 40px; height: 50px; border: 1px solid black; text-align: center; }
    #seatwrap .seat_table tr .blank { width: 10px; border: none; }
    #seatwrap .seat_table table tr .way { width: 10px; height: 50px; border: none; }
    #seatwrap .choices { width: 500px; height: 50px; }
    #seatwrap .choices #choicelist { list-style: none; padding-left: 0; display: inline-block; }
    #seatwrap .choices #choicelist li { width: 40px; height: 30px; display: inline-block; }
    #seatwrap .choices #choicelist li input { width: 35px; height: 20px; }
</style>
</head>
<body>
	<form action="seatReserve" method="post">
		<div id="seatwrap">
	    	<h2>좌석선택</h2>
	    	<p>· 요청하신 <span>승객</span> ${person }<span>명</span>의 원하시는 좌석을 선택하여 주십시오.</p>
	    	<p>· 발매가 가능한 좌석을 선택하실 수 있습니다.</p>
	    	<p>· 원하시는 좌석을 선택 후 [선택좌석 예약하기] 버튼을 클릭하시면 예약이 완료됩니다.(복수선택 가능)</p>
	    	<p>· 원하지 않는 좌석이 선택된 경우에는 좌석을 한 번 더 클릭하시면 취소됩니다.</p>
	    	<c:set var="resultset" value="${resultset}"/>
	    	<input type="hidden" name="tr_code" value="${trcode }">
	    	<input type="hidden" name="person" value="${person }" id="cnt">
	    	<input type="hidden" name="ho" value="${ho }" id="hocha">
	    	<input type="hidden" name="start_date" value="${startdate }">
	    	<input type="hidden" name="st_scode" value="${st_scode }">
	    	<input type="hidden" name="st_ecode" value="${st_ecode }">
	    	<input type="hidden" name="adult" value="${adult }">
	    	<input type="hidden" name="child" value="${child }">
	    	<input type="hidden" name="adult_person" value="${adult_person }">
	    	<input type="hidden" name="child_person" value="${child_person }">
	    	<div class="trainhowrap">
	   			<c:if test="${ho == 3 }">
	   				<ul class="trainho">
		   				<li class="ho ho-05">일반실<br>5호차</li>
		   				<li class="ho ho-04">일반실<br>4호차</li>
		   				<li class="ho ho-03">특실<br>3호차</li>
		   				<li class="ho ho-02">일반실<br>2호차</li>
		   				<li class="ho ho-01">일반실<br>1호차</li>
		   			</ul>
	   				<p class="pinfo">${trcode } &nbsp; ${start_name } &nbsp; → &nbsp; ${end_name } &nbsp; 특실 &nbsp; <input type="text" name="hocha" value="3">호차 &nbsp; 좌석정보</p>
	   			</c:if>
	   			<c:if test="${ho != 3 }">
	   				<ul class="trainho">
		   				<li class="ho ho-05" onclick="seatSelect(5);">일반실<br>5호차</li>
		   				<li class="ho ho-04" onclick="seatSelect(4);">일반실<br>4호차</li>
		   				<li class="ho ho-03">특실<br>3호차</li>
		   				<li class="ho ho-02" onclick="seatSelect(2);">일반실<br>2호차</li>
		   				<li class="ho ho-01" onclick="seatSelect(0);">일반실<br>1호차</li>
		   			</ul>
	   				<p class="pinfo">${trcode } &nbsp; ${start_name } &nbsp; → &nbsp; ${end_name } &nbsp; 일반실 &nbsp; <input type="text" name="hocha" id="hochanum">호차 &nbsp; 좌석정보</p>
	   			</c:if>
	    	</div>
	    	<div class="tinfo">선택좌석 선택불가 선택가능</div>
	    	<div class="seat_table"></div>
	    	<!-- <div class="choices">선택좌석 : <div class="choicediv"></div><div class="choicediv"></div><div class="choicediv"></div><div class="choicediv"></div><div class="choicediv"></div><div class="choicediv"></div><div class="choicediv"></div><div class="choicediv"></div><div class="choicediv"></div></div> -->
	    	<div class="choices">선택좌석 : <!-- <div id="choicediv"></div> -->
	   			<ul id="choicelist">
	<!--    		<li><input type="text" name="seat1" id="seat_1"></li>
	   				<li><input type="text" name="seat2" id="seat_2"></li>
	   				<li><input type="text" name="seat3" id="seat_3"></li>
	   				<li><input type="text" name="seat4" id="seat_4"></li>
	   				<li><input type="text" name="seat5" id="seat_5"></li>
	   				<li><input type="text" name="seat6" id="seat_6"></li>
	   				<li><input type="text" name="seat7" id="seat_7"></li>
	   				<li><input type="text" name="seat8" id="seat_8"></li>
	   				<li><input type="text" name="seat9" id="seat_9"></li> -->
	   				<li><input type="text" name="seat1" class="seat_t"></li>
	   				<li><input type="text" name="seat2" class="seat_t"></li>
	   				<li><input type="text" name="seat3" class="seat_t"></li>
	   				<li><input type="text" name="seat4" class="seat_t"></li>
	   				<li><input type="text" name="seat5" class="seat_t"></li>
	   				<li><input type="text" name="seat6" class="seat_t"></li>
	   				<li><input type="text" name="seat7" class="seat_t"></li>
	   				<li><input type="text" name="seat8" class="seat_t"></li>
	   				<li><input type="text" name="seat9" class="seat_t"></li>
	   			</ul>
	    	</div>
	    	<div><input type="submit" value="선택좌석 예약하기"></div>
	   	</div>
   	</form>
</body>
<script src="https://code.jquery.com/jquery-2.2.1.js"></script>
<script type="text/javascript">
	var hocha = document.getElementById("hocha");
	var cols = new Array(5); //좌석 열
    var rows = ["D", "C", "", "B", "A"]; //좌석 행 알파벳
    var cnt = document.getElementById("cnt");
    var maxcnt = 0 // 선택 가능 총 인원 수
    var choiceseat = 0; //좌석을 몇개 선택했는지
    var remainseat = 0; //좌석
    var seat_table = document.querySelector(".seat_table"); // 좌석 그려지는 위치
	var arrt = new Array();
    // 예약 및 구매완료 좌석 배열 값을 배열에 담기
	<c:forEach var="item" items="${resultset}">
		arrt.push("${item}");
	</c:forEach>

	seatSelect(hocha.value); // 좌석 선택 화면
	
    function seatSelect(ho) {
		 if(ho == 3) { // 3호차 특실
			$(".ho-05").css("background", "#9d9c9c");
			$(".ho-04").css("background", "#9d9c9c");
			$(".ho-03").css("background", "#a70808");
			$(".ho-02").css("background", "#9d9c9c");
			$(".ho-01").css("background", "#9d9c9c");
			seat_Table(); // 좌석 실행
		}else if(ho == 1) { // 1호차 일반실(좌석선택 버튼에서 실행)
			$(".ho-05").css("background", "#fcfcfc");
			$(".ho-05").css("cursor", "pointer");
			$(".ho-04").css("background", "#fcfcfc");
			$(".ho-04").css("cursor", "pointer");
			$(".ho-03").css("background", "#9d9c9c");
			$(".ho-02").css("background", "#fcfcfc");
			$(".ho-02").css("cursor", "pointer");
			$(".ho-01").css("background", "#a70808");
			$(".ho-01").css("cursor", "pointer");
			$("#hochanum").val(1);
			seat_Table(); // 좌석 실행
		}else { 
			 if(ho == 0) { // 1호차 일반실(1호차 직접 선택)
				$.ajax({
		    		url : "seatChoice",
		    		type : "post",
		    		data : {
		    			tr_code : "${trcode}",
		    			st_scode : "${st_scode }",
		    			st_ecode : "${st_ecode }",
		    			start_date : "${startdate}",
		    			person : "${person }",
		    			hocha : "0"
		    		},
		    		datatype : "html",
		    		success : function(data) {
		    			$('.seat_table').children().remove();
		    			$('.seat_table').html(data);
		    			$(".ho-05").css("background", "#fcfcfc");
						$(".ho-05").css("cursor", "pointer");
						$(".ho-04").css("background", "#fcfcfc");
						$(".ho-04").css("cursor", "pointer");
						$(".ho-03").css("background", "#9d9c9c");
						$(".ho-02").css("background", "#fcfcfc");
						$(".ho-02").css("cursor", "pointer");
						$(".ho-01").css("background", "#a70808");
						$(".ho-01").css("cursor", "pointer");
						$("#hochanum").val(1);
		    		},
		    		error : function(data) {
		    			alert("ajax 실패");
		    		}
		    	});
			}else if(ho == 2) { // 2호차 일반실 
				$.ajax({
		    		url : "seatChoice",
		    		type : "post",
		    		data : {
		    			tr_code : "${trcode}",
		    			st_scode : "${st_scode }",
		    			st_ecode : "${st_ecode }",
		    			start_date : "${startdate}",
		    			person : "${person }",
		    			hocha : "2"
		    		},
		    		datatype : "html",
		    		success : function(data) {
		    			$('.seat_table').children().remove();
		    			$('.seat_table').html(data);
		    			$(".ho-05").css("background", "#fcfcfc");
						$(".ho-05").css("cursor", "pointer");
						$(".ho-04").css("background", "#fcfcfc");
						$(".ho-04").css("cursor", "pointer");
						$(".ho-03").css("background", "#9d9c9c");
						$(".ho-02").css("background", "#a70808");
						$(".ho-02").css("cursor", "pointer");
						$(".ho-01").css("background", "#fcfcfc");
						$(".ho-01").css("cursor", "pointer");
						$("#hochanum").val(2);
		    		},
		    		error : function(data) {
		    			alert("ajax 실패");
		    		}
		    	});
			}else if(ho == 4) { // 4호차 일반실
				$.ajax({
		    		url : "seatChoice",
		    		type : "post",
		    		data : {
		    			tr_code : "${trcode}",
		    			st_scode : "${st_scode }",
		    			st_ecode : "${st_ecode }",
		    			start_date : "${startdate}",
		    			person : "${person }",
		    			hocha : "4"
		    		},
		    		datatype : "html",
		    		success : function(data) {
		    			$('.seat_table').children().remove();
		    			$('.seat_table').html(data);
		    			$(".ho-05").css("background", "#fcfcfc");
						$(".ho-05").css("cursor", "pointer");
						$(".ho-04").css("background", "#a70808");
						$(".ho-04").css("cursor", "pointer");
						$(".ho-03").css("background", "#9d9c9c");
						$(".ho-02").css("background", "#fcfcfc");
						$(".ho-02").css("cursor", "pointer");
						$(".ho-01").css("background", "#fcfcfc");
						$(".ho-01").css("cursor", "pointer");
						$("#hochanum").val(4);
		    		},
		    		error : function(data) {
		    			alert("ajax 실패");
		    		}
		    	});
			}else if(ho == 5) { // 5호차 일반실
				$.ajax({
		    		url : "seatChoice",
		    		type : "post",
		    		data : {
		    			tr_code : "${trcode}",
		    			st_scode : "${st_scode }",
		    			st_ecode : "${st_ecode }",
		    			start_date : "${startdate}",
		    			person : "${person }",
		    			hocha : "5"
		    		},
		    		datatype : "html",
		    		success : function(data) {
		    			$('.seat_table').children().remove();
		    			$('.seat_table').html(data);
		    			$(".ho-05").css("background", "#a70808");
						$(".ho-05").css("cursor", "pointer");
						$(".ho-04").css("background", "#fcfcfc");
						$(".ho-04").css("cursor", "pointer");
						$(".ho-03").css("background", "#9d9c9c");
						$(".ho-02").css("background", "#fcfcfc");
						$(".ho-02").css("cursor", "pointer");
						$(".ho-01").css("background", "#fcfcfc");
						$(".ho-01").css("cursor", "pointer");
						$("#hochanum").val(5);
		    		},
		    		error : function(data) {
		    			alert("ajax 실패");
		    		}
		    	});
			}
		}
	}
    //좌석보여줌. 좌석 선택 체크키 : 기본값 0, 선택시 1, 예매완료 시 2
    function seat_Table() {
    	
        for (var i=0; i<cols.length; i++){	
            cols[i] = new Array(8); //좌석 행
        }
        
        var stable = ""; // 좌석 그리기
        stable += "<table>";
        for(var i=0; i<cols.length; i++){
            stable += "<tr>";
            for(var j=cols[i].length; j>0; j--){
                if(i==0 || i==1 || i==3 || i==4) {
                	cols[i][j] = 0; // 기본 값(예약 및 구매 전)
                    
                	if(j % 2 == 1) {
                        stable += "<td class='blank'></td>";
                    }
                    stable += "<td id='td" + i + j + "' onclick='choice(" + i + "," +  j + ");'>" + j + rows[i] + "</td>";
                    arrt.forEach(function(item){
                    	if((j + rows[i]) == item) {
                        	cols[i][j] = 2; // 예약 및 구매완료
                        }else {
                        	cols[i][j] = 0; // 기본 값(예약 및 구매 전)
                        }
                    });
                }else {
                    stable += "<td class='way'></td>";
                }
            }
            stable += "</tr>";
        }
        stable += "</table>";
        seat_table.innerHTML = stable;
        tdColor(); // 색상
    }
    //좌석선택
    function choice(row, col, val){
        if(choiceseat>=maxcnt.value){
            //alert("좌석 선택이 완료되었습니다.");
        }else{
            seat(row, col);
        }
        tdColor(); // 색상
    }
    // 좌석 상태 값 변경
    function seat(row, col){
        if(cols[row][col]==0){ // 선택 전
            cols[row][col] = 1; // 선택 후
            choiceSeatInfo(row, col);
            choiceseat++;
            remainseat--;
        }else if(cols[row][col]==1){ // 선택 좌석
            cols[row][col] = 0; // 선택 취소
            choiceSeatInfo(row, col);
            choiceseat--;
            remainseat++;
        }
    }
    // 색바꾸기
    function tdColor(){
         for(var i=0; i<cols.length; i++){
            for(var j=cols[i].length; j>0; j--){
                if(cols[i][j]==0){ // 기본값
                    $('#td'+i+j).css("background", "#fcfcfc"); 
                    $('#td'+i+j).css("cursor", "pointer"); 
                }else if(cols[i][j]==1){ // 선택한 좌석
                    $('#td'+i+j).css("background", "#a70808"); 
                    $('#td'+i+j).css("cursor", "pointer"); 
                }else if(cols[i][j]==2){ // 예약 및 구매완료
                    $('#td'+i+j).css("background", "#9d9c9c");     
                }
            }
        } 
    }
    // 선택한 좌석 출력 => 수정해야 함
    function choiceSeatInfo(row, col) {
    	var inputlist = document.getElementsByClassName("seat_t");
    	var cho = String(col) + rows[row];
    	
    	var check = false;
    	for(var i=0; i<inputlist.length; i++){
    		if(inputlist[i].value == cho){
    			check = true;
    		}
    	}
    	var drawcheck = false;
    	if(check==false){
    		for(var i=0; i<inputlist.length; i++){
    			if(inputlist[i].value == ""){
    				inputlist[i].value =cho;
    				break;
    			}
    		}
    	}else{
    		for(var i=0; i<inputlist.length; i++){
    			if(drawcheck == true && i<inputlist.length-1){
    				inputlist[i].value = inputlist[i+1].value;
    			}
    			if(inputlist[i].value == cho){
    				inputlist[i].value="";
    				drawcheck = true;
    			}	
    			
    		}
    	}
    }
</script>
</html>