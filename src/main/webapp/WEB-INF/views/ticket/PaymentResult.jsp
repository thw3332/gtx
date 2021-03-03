<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
#payment_result_wrap { margin: 0 auto; width: 1280px; }
#payment_result_wrap h1 { text-align:center; margin-bottom: 50px; }
#payment_result_wrap #infomenu_div { margin: 0 auto; text-align:right; border-bottom: 2px solid gray; width: 900px; height: 30px; }
#payment_result_wrap #infomenu_div a { text-decoration: none; color: black; }
#payment_result_wrap #infomenu_div a:nth-last-of-type(1) {font-weight: bold;}
#payment_result_wrap #payment_resultmsg { margin: 100px auto; text-align: center;} 
#payment_result_wrap #payment_resultmsg input{ border: none; border-radius: 3px; outline: none; background: rgba(0, 0, 0, 0.79); color: white; width:150px; height: 45px; font-size: 14px; }
</style>
</head>
<body>
<div id="payment_result_wrap">
	<h1>결제하기</h1>
	<div id="infomenu_div">
		<a href="#">홈&nbsp;》&nbsp;</a>
		<a href="#">승차권&nbsp;》&nbsp;</a>
		<a href="#">발권/취소&nbsp;》&nbsp;</a>
		<a href="#">결제하기</a>
	</div>
    <div id="payment_resultmsg">
        <p>결제가 정상적으로 완료되었습니다.</p><br>
        <input type="button" value="발권내역조회" onclick="location.href='usageHistory'">
    </div>
</div>
</body>
</html>