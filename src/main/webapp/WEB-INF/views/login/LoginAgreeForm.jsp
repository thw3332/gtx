<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<style>
	#Login_wrap { margin: 0 auto; width: 1280px; text-align:center; }
	#Login_wrap h1 { text-align:center; margin-bottom: 50px; }
	#Login_wrap #Login_menu_btn { margin: 0 auto; text-align:right;   border-bottom: 2px solid gray; width: 900px; height: 30px; }
	#Login_wrap #Login_menu_btn a{ text-decoration: none; color: black; }
    #Login_wrap #id_pw_div div{ margin: 10px; }
	#Login_wrap #id_pw_div label { display: inline-block; width: 200px;  }
	#Login_wrap #id_pw_div input {  display: inline-block; width: 200px; height: 25px; outline: none;}
	#Login_wrap #btn_div input { width: 100px; height: 73px; display: inline-block; background: #5C6583; border: none; color: white; outline: none; cursor: pointer;}
	#Login_wrap #login_div { margin: 0 auto; border: 1px solid gray; width: 800px; height: 250px; margin-top: 20px; background: #FCFCFC; border-top: 4px solid #9E3B80; }
    #Login_wrap #login_div #login_btn #id_skip { margin: 10px; }
	#Login_wrap #login_input { height: 120px; display: flex; justify-content: center; align-items: center; margin-right: 60px; margin-top:15px; }
    #Login_wrap #login_btn {   height: 100px;  }
    #Login_wrap #search_btn input { margin: 10px; width: 120px; height: 50px; background:#E5EAED; border: 1px solid lightgray; outline: none; cursor: pointer; }
    #Login_wrap #search_btn { border-top: 1px solid lightgray; width: 500px; margin-left: 150px; }
    #Login_wrap #Login_wrap_footer { margin: 10px auto; width: 800px; height: 120px; border: 1px solid gray; background: #FCFCFC; text-align: left; box-sizing: border-box; padding: 10px;  }
    
    #Login_wrap #Login_wrap_footer strong { color: red;}
    #Login_wrap #Login_wrap_footer span { display: block; font-size: 13px; color: black; box-sizing: border-box; margin-top: 10px; }
    #Login_wrap #Login_wrap_footer span:nth-of-type(1){font-weight: bold;}
</style>
<head> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
 <div id="Login_wrap">
			<h1>로그인</h1>
			<div id="Login_menu_btn">
				<a href="#">홈&nbsp;》&nbsp;</a>
				<a href="#">GTX회원&nbsp;》&nbsp;</a>
				<a href="#">로그인</a> 
		</div>
		<div id="login_div">
			<div id="login_input">
				<div id="id_pw_div">
					<div><label>아이디</label><input type="text"></div>
					
					<div><label>비밀번호</label><input type="text"></div>
				</div>
				<div id="btn_div"><input type="button" value="확인"></div>
			</div>
			<div id="login_btn">
			<input id="id_skip" type="checkbox" value="아이디 저장">아이디 저장
			
			<div id="search_btn">
			    <input type="button" value="아이디찾기"><input type="button" value="비밀번호찾기"><input type="button" value="회원가입">
			</div>
			</div>		
		</div>
		<div id="Login_wrap_footer">
		      <span>※ 비밀번호 5회 오류 시 로그인할 수 없습니다.</span>
		      <span><strong>· </strong>마이페이지 > 회원정보관리 > 이메일/휴대전화인증에서 인증을 받으시면 이메일 또는 휴대전화번호로 로그인할 수 있습니다.</span>
		      <span><strong>· </strong>로그인 후 1시간 동안 입력이 없을 경우 자동으로 로그아웃됩니다.</span>
		</div>
</div>
</body>
</html>