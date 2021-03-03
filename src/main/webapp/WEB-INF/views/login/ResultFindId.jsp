<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
		#findId_wrap { margin: 0 auto; width: 900px; text-align:center; }
		#findId_wrap #main_menu { margin: 0 auto; text-align:right;   border-bottom: 2px solid gray; width: 900px; height: 30px; }
		#findId_wrap #main_menu a{ text-decoration: none; color: black; }
		/* ======================================== */
		#findId_wrap #info_ment {  width: 900px; height: 100px; background: #F7F7F7; margin-top:10px;  }
		#findId_wrap #info_ment #id_info { text-align: center; vertical-align: middle;}
		#findId_wrap #info_ment #id_info strong {color: #9E3B80; }
		#findId_wrap #info_ment input { margin: 17px auto; width: 100px; height: 40px; border: none; background:#9E3B80; color: white; }
</style>
</head>
<body>
	<div id="findId_wrap">
	  <h1>아이디 찾기</h1>
		<div id="main_menu">
			<a href="#">홈&nbsp;》&nbsp;</a>
			<a href="#">GTX회원&nbsp;》&nbsp;</a>
			<a href="#"><strong>아이디 찾기</strong></a>
		</div>
		<div id="info_ment">
 			<p id="id_info">아이디는 [<strong>${fid }</strong>] 입니다</p>
 			<input type="button" value="확인" onclick="location.href='loginForm'">
 		</div>
	</div>
</body>
</html>