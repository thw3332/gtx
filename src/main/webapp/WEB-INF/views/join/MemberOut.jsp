<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head><!--{ width: 100px; height: 68px; display: inline-block; background: #5C6583; border: none; color: white; outline: none; cursor: pointer;}  -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	#joinout_out_wrap { margin: 0 auto; width: 1280px; text-align:center; }
	#joinout_out_wrap h1 { text-align:center; margin-bottom: 50px; }
	#joinout_out_wrap #out_menu_btn { margin: 0 auto; text-align:right;   border-bottom: 2px solid gray; width: 900px; height: 30px; }
	#joinout_out_wrap #out_menu_btn a{ text-decoration: none; color: black; }
	
	#joinout_out_wrap #input_box{ width:550px;height: 250px; }
	#joinout_out_wrap #input_box div { margin: 10px; }
	#joinout_out_wrap #input_box label { display: inline-block; width: 100px; text-align: left; font-weight: bold; }
	#joinout_out_wrap #input_box input {  display: inline-block; width: 250px; height: 35px; outline: none; }	
	#joinout_out_wrap #out_input { width:600px;height: 300px; margin:0 auto; margin-top:50px; } 
	#joinout_out_wrap #out_div {  width:900px; height: 300px; margin: 0 auto; border: 1px solid gray; background: #FCFCFC; border-top: 4px solid #9E3B80;  }
	#joinout_out_wrap #input_box #delete {width: 350px; height: 50px; margin-top:20px; background:#ccc; color:black; font-weight: bold; outline:none; border:1px solid lightgray; }
</style>  
</head> 
<body>
	<div id="joinout_out_wrap">
	<h1>회원탈퇴</h1>
		<div id="out_menu_btn">
			<a href="#">홈&nbsp;》&nbsp;</a>
			<a href="#">마이페이지&nbsp;》&nbsp;</a>
			<a href="#"><strong>회원탈퇴</strong></a>
		</div>

	<div>
		<form action="goout" method="post">
		<div id="out_div">
			<div id="out_input">
				<div id="input_box">
					<div><label>이&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;름</label><input type="text" name="name"></div>
					<div><label>아 이 디</label><input type="text" name="id"></div>
					<div><label>비밀번호</label><input type="text" name="password"></div>
					<input class="right_btn" id="delete" type="submit" value="회원탈퇴">
				</div>
			</div>
		</div>
		</form>
	</div>
	</div>
</body>
</html>