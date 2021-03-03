<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#joinwrap { margin: 0 auto; width: 1280px; text-align:center; }
	#joinwrap { text-align:center; margin-bottom: 50px; }
	#joinwrap #boardmenu { margin: 0 auto; text-align:right;   border-bottom: 2px solid gray; width: 900px; height: 30px; }
	#joinwrap #boardmenu a{ text-decoration: none; color: black; }
	#joinwrap #board_submenu_btn input { width: 295px; height: 55px; color:#3E3E3E; outline: none; vertical-align: middle; margin: 5px 0; border: 1px solid lightgray; background-color: #F4F4F4; font-size: 20px;}
	#joinwrap #board_submenu_btn input:hover{cursor: pointer; }
	//===============================
	#joinwrap { margin: 0 auto; width: 1280px; text-align:center; }
	#joinwrap #join_menu_btn { margin: 0 auto; text-align:right;   border-bottom: 2px solid gray; width: 900px; height: 30px; }
	#joinwrap #join_menu_btn a{ text-decoration: none; color: black; }
	//=====================================================
	#joinwrap form {margin: 10px auto;}
    #joinwrap form table { margin: 30px auto;   border-collapse: collapse; height: 300px; border-top:2px solid black; }
    #joinwrap form table #headline { }
    #joinwrap form table tr { border: 1px solid gray;  border-right: none; border-left: none; height: 60px;}
    #joinwrap form table tr th { width: 120px; border-right: 1px solid gray; background: #FCD6D5;   }
    #joinwrap form table tr td { width:632px;  text-align: left; box-sizing: border-box; padding-left: 10px;}
    #joinwrap form table tr td .text_input { width: 300px; height: 25px; }
    #joinwrap form table tr #id_text { width: 300px; height: 30px; margin-top: 14px; margin-left: 5px; padding-left: 20px; }
    #joinwrap form table tr #password { width: 300px; height: 30px; margin-top: 14px; margin-left: 5px; }
    #joinwrap form table tr #repassword { width: 300px; height: 30px; margin-top: 14px; margin-left: 5px; }
    #joinwrap form table tr #name_text { width: 300px; height: 30px; margin-left: 5px; padding-left: 20px;}
    #joinwrap form table tr #repw { width: 300px; height: 30px; margin-top: 14px; margin-left: 5px; }
    #joinwrap form table tr #year { width: 83px; height: 30px; margin-left: 5px; }
    #joinwrap form table tr #month { width: 83px; height: 30px; margin-left: 5px; }
    #joinwrap form table tr #day { width: 83px; height: 30px; margin-left: 5px; }
    #joinwrap form table tr #email { width: 300px; height: 30px; margin-top: 10px; margin-left: 5px; }
    #joinwrap form table tr #phone { width: 300px; height: 30px; margin-top: 10px; margin-left: 5px; }
    #joinwrap form table tr #zipcode { width: 300px; height: 30px;  margin-left: 5px; }
    #joinwrap form table tr #search_post { width: 114px; height: 33px; margin-top: 14px; }
    #joinwrap form table tr #roadaddress { width: 200px; height: 30px; margin-top: 10px; margin: 5px;  }
    #joinwrap form table tr #detailaddress { width: 200px; height: 30px; margin-top: 10px; margin: 5px; }
    #joinwrap form table tr td input[type=radio] { display: inline-block;}
    #joinwrap form table #addr_text { width: 50px; }
    #joinwrap form table tr #email_text p { margin: 15px; padding: 5px;  margin-left: 5px; font-size: 12px; }
    #joinwrap form table tr #phone_text p { margin: 15px; padding: 5px; margin-left: 5px; font-size: 12px; }
    #joinwrap form table tr #birth_text  { width: 300px; height: 30px; margin-top: 14px; margin-left: 5px;  padding-left: 20px; }
    .error { color: red; font-size: 12px;}
    #nopwchk{color: red; font-size: 12px;}
    #green{color: forestgreen; font-size: 12px;}
    #joinwrap form table .joinbtn {text-align: center; width: 100px;}
    #joinwrap form table .joinbtn .go_btn { width: 120px; height: 35px; border: none; background:#357EF8; color: white; font-size: 15px;}
    strong { color: #6D3767;  }
</style>
</head>
<body>
	<div id="joinwrap">
		<h1>회원정보 수정</h1>
			<div id="join_menu_btn">
				<a href="#">홈&nbsp;》&nbsp;</a>
				<a href="#">마이페이지&nbsp;》&nbsp;</a>
				<a href="#"><strong>회원정보 수정</strong></a> 
		</div>
	<div id="board_submenu_btn">
		<input id="info" type="button" value="공지사항">
		<input id="qna" type="button" value="Q & A">
		<input id="lost" type="button" value="유실물 안내">
		</div>
		<form action="infoUp" method="post">
		<p class="tag"></p>
			<table>
		
				<tr>
					<th>아이디</th>
					<td id="id_text">${id }<p id="idchk"></p></td>
				</tr>
				<tr>
					<th>이름</th>
					<td id="name_text">${mdto.name }</td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td id="pw_text"><input  type="password" name="password" id="password" placeholder="숫자, 특수기호(!@#*-), 영문자 조합 6~12자리" value="${mdto.password }">
					<p id="nopwchk"></p>
					</td>
				</tr>
				<tr>
					<th>비밀번호 확인</th>
					<td id="repw_text"><input  type="password" name="repassword" id="repassword">
					<p id="pwtext"></p>
					</td>
				</tr>
				<tr>
					<th>생년월일</th>
					<td id="birth_text"> 
					${mdto.birthday }
					</td>
				</tr>
				<tr>
					<th>이메일</th>
                    <td id="email_text">
                    <input type="email" name="email" id="email" value="${mdto.email }">
                    <p>
                        <strong>· </strong>이메일 미 등록시 승차권 예약발매 내역 메일 서비스에 제한 될 수 있습니다.<br>
                        <strong>· </strong>이메일 미 등록시 휴면고객 사전 알림 서비스에 제한 될 수 있습니다.<br>
                        <strong>· </strong>이메일을 등록하시면 예약내역, 포인트내역, 철도소식 등을 제공 받으실 수 있습니다.<br>
                        <strong>· </strong>이메일 변경 시 인증을 통해서만 변경이 가능합니다.
                    </p>
                    </td>
				</tr>
				<tr>
					<th>휴대전화</th>
					<td id="phone_text">
						<input id="phone" type="tel" name="phone" value="${mdto.phone }">
						<p>
                        <strong>· </strong>휴대전화번호를 등록하시면 GTX홈페이지에서 휴대전화번호로 로그인 할 수 있습니다. <br>
                        <strong>· </strong>휴대전화번호 변경 시 인증을 통해서만 변경이 가능합니다.
                        
                    </p>
					</td>
				</tr>
				<tr id="addr_tr">
					<th>주소</th>
					<td id="addr_text">
						<input id="zipcode" type="text" name="zipcode" value="${mdto.zipcode }">
						<input id="search_post" type="button" value="우편번호 찾기" class="button" onclick="postcode();">
						<br>
						<input id="roadaddress" type="text" name="roadaddress" value="${mdto.roadaddress }">
						<input id="detailaddress" type="text" name="detailaddress" value="${mdto.detailaddress }">
					</td>
                </tr>

				<tr>
					<td colspan="2" class="joinbtn">
						<input type="hidden" name="terms_agreeyn" value="${terms_agreeyn }">
						<input type="hidden" name="personal_agreeyn" value="${personal_agreeyn }">
						<input type="hidden" name="child_agreeyn" value="${child_agreeyn }">
						<input type="hidden" name="email_agreeyn" value="${email_agreeyn }">
						<input type="hidden" name="third_agreeyn" value="${third_agreeyn }">
						<input class="go_btn" type="submit" value="수정완료" ><!-- onclick="check(this.form);" -->
						<input class="go_btn" type="reset" value="다시입력">
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script type="text/javascript">
		function postcode() {
	    	new daum.Postcode({	
	            oncomplete: function(data) {	
	                var roadAddr = data.roadAddress; // 도로명 주소 변수
	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById("zipcode").value = data.zonecode;	
	                document.getElementById("roadaddress").value = roadAddr;
	                document.getElementById("detailaddress").focus();
	            }
	        }).open();
	    }

		function check(obj) {
			var regpw = /^(?=.*[a-zA-Z])(?=.*[!@#*-])(?=.*[0-9]).{6,12}$/; // 숫자 특수기호(!@#*-) 영문자 6~12자리
			var pw = document.getElementById("pw").value;
			
			if(!regpw.test(pw)){
                alert("비밀번호는 숫자, 특수기호(!@#*-), 영문자 조합 6~12자리만 가능합니다.");
                return;
            }
			obj.action = "Join";
			obj.submit();
		}
		
	 
//=================================	
	  joinwrap.addEventListener("focusout", function(){
			var pw = document.querySelector("#password");
			var repw = document.querySelector("#repassword"); 
			
				if(pw.value == null){
					nopwchk.innerHTML = "<span class='error'>*비밀번호를 입력해 주세요</span>";
				}else if(pw.value != null){
					nopwchk.innerHTML = "";
					}
				if(repw.value == null){
					if(pw.value != "" && repw.value == ""){
						  pwtext.innerHTML = "<span class='error'>*비밀번호를 입력해 주세요</span>"; 
					}
				}else if(repw.value != null){
					if(pw.value == repw.value){
						pwtext.innerHTML = "<span id='green'>*비밀번호가 일치합니다</span>";
					}else if(pw.value != repw.value){
						pwtext.innerHTML ="<span id='nopwchk'>*비밀번호가 일치하지 않습니다</span>";
					}	
				}
		 })  
    </script>
</body>
</html>