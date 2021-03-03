<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
		#findPw_wrap { margin: 0 auto; width: 900px; text-align:center; }
		#findPw_wrap #main_menu { margin: 0 auto; text-align:right;   border-bottom: 2px solid gray; width: 900px; height: 30px; }
		#findPw_wrap #main_menu a{ text-decoration: none; color: black; }
		/* ======================================== */
		#findPw_wrap #info_ment { margin: 10px auto; width: 900px; height: 100px; background: #F7F7F7; }
		#findPw_wrap #info_ment #Pw_info {text-align: center; vertical-align: middle;}
		#findPw_wrap #info_ment #Pw_info strong {color: #9E3B80; }
		#findPw_wrap #info_ment input { margin: 17px auto; width: 100px; height: 40px; border: none; background:#9E3B80; color: white; }
</style>
</head>
<body>
	
 <div id="findPw_wrap">
	  <h1>비밀번호 찾기</h1>
		<div id="main_menu">
			<a href="#">홈&nbsp;》&nbsp;</a>
			<a href="#">GTX회원&nbsp;》&nbsp;</a>
			<a href="#"><strong>비밀번호 찾기</strong></a>
		</div>
		<div id="info_ment">
			
 			<p id="Pw_info">비밀번호는 [<strong>${fpw }</strong>] 입니다</p>
 			<input type="button" value="확인" onclick="location.href='loginForm'">
 		</div>
	</div>
 </div>
<c:out value="${id }"></c:out>
</body>
</html>