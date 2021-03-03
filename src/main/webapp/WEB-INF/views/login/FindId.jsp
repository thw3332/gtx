<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	
	#findPw_wrap { margin: 0 auto; width: 1280px; text-align:center; }
	#findPw_wrap h1 { text-align:center; margin-bottom: 50px; }
	#findPw_wrap #main_menu { margin: 0 auto; text-align:right;   border-bottom: 2px solid gray; width: 900px; height: 30px; }
	#findPw_wrap #main_menu a{ text-decoration: none; color: black; }
	#findPw_wrap #findPw_ment { margin: 0 auto; width: 1280px; text-align:center;}
	#findPw_wrap #findPw_ment p {color: gray; margin-top: 50px;}
	#findPw_wrap #findPw_ment p strong { color: #5396F8; font-size: 20px;  }
	#findPw_wrap #FindPw_search { margin: 0 auto; border: 1px solid gray; background:#FDE3E3; border-top: 3px solid #D13076; width: 500px; height: 230px; margin-top: 50px;}
	#findPw_wrap #FindPw_search div { margin-top: 55px; margin-right: 60px;}
	#findPw_wrap #FindPw_search div label {  display:inline-block; width: 180px; height: 30px; }
	#findPw_wrap #FindPw_search div input {width: 200px; display:inline-block; height: 30px;}
	#findPw_wrap #next_btn {margin-top: 50px;}
	#findPw_wrap #next_btn input { width: 100px; height: 50px; background:#5396F8; color: white; border: none; }
</style>
</head>
<body>

	
	<div id="findPw_wrap">
		<h1>아이디 찾기</h1>
		<div id="main_menu">
			<a href="#">홈&nbsp;》&nbsp;</a>
			<a href="#">GTX회원&nbsp;》&nbsp;</a>
			<a href="#"><strong>아이디 찾기</strong></a>
		</div>
		<form action="gosearchid" method="post">
		<div id="findPw_ment">
			<p>
			<strong>회원아이디/이메일 입력</strong><br>
			</p>
		</div>
		<div id="FindPw_search">
			<div><label>이름</label><input type="text" name="name"></div>
			<div><label>이메일</label><input type="text" name="email"></div>
		</div>
		<div id="next_btn">
			<input type="submit" value="찾 기" >
		</div>
		</form>
	</div>
</body>
</html>