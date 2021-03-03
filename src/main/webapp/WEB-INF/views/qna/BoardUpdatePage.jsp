<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	#board_update_wrap { margin: 0 auto; width: 900px; }
	#board_update_wrap h1{ text-align:center; margin-bottom: 50px; }
	#board_update_wrap #infomenu_div { margin: 0 auto; text-align:right; border-bottom: 2px solid gray; width: 900px; height: 30px; }
	#board_update_wrap #infomenu_div a{ margin: 0 auto; text-decoration: none; color: black; }
	#board_update_wrap ##infomenu_div a:nth-last-of-type(1){font-weight: bold;}
	#board_update_wrap #board_update_btn input { margin: 0 auto; border: 1px solid red; width: 295px; height: 55px; color:#3E3E3E; outline: none; vertical-align: middle; margin: 5px 0; border: 1px solid lightgray; background-color: #F4F4F4; font-size: 20px;}
	/*==========================================*/
	#board_update_wrap table { margin: 0 auto; width: 900px; height: 350px; border-collapse:  collapse; margin-top: 5px; border-top: 2px solid #6D3767; }
	#board_update_wrap table .board_update_tr .update_input_headline { margin: 0 auto; border: 1px solid gray; border-left:none; text-align: center; background: #F4F4F4; font-size: 17px; width: 100px; height: 50px;}
	#board_update_wrap table .board_update_tr .update_input { border: 1px solid gray; border-right: none;}
	#board_update_wrap table .board_update_tr #btn_next #reset { width: 110px; height: 50px; border: none; ;background: #00508F; color: white; font-size: 15px; margin-top: 20px; }
	#board_update_wrap table .board_update_tr #btn_next #update_go { width: 110px; height: 50px; border: none; ;background: #00508F; color: white; font-size: 15px; margin-top: 20px; }
	#board_update_wrap table .board_update_tr #btn_next #update_list { width: 110px; height: 50px; border: none; ;background: #3E3E3E; color: white; font-size: 15px; margin-top: 20px; margin-left: 550px; }
	textarea { width: 97%; outline: none; border: 1px solid lightgray; margin: 10px; }
	#board_update_wrap table .board_update_tr .update_input { margin: 0 auto; border: 1px solid gray; border-right: none; text-align: center;}
	#board_update_wrap table .board_update_tr .update_input #title_input { margin: 0 auto; width: 97%; height: 35px; outline: none; border: 1px solid lightgray; margin-left: 0px;  }
	#board_update_wrap table .board_update_tr #reboard_td { text-align: left; }
	strong { color: #6D3767;  }
	#board_update_wrap table .board_update_tr #content { height: 250px; }
</style>
</head>
<body>
	<div id="board_update_wrap">
	<h1>Q &amp; A 수정</h1>
	<div id="infomenu_div">
		<a href="#">홈&nbsp;》&nbsp;</a>
		<a href="#">고객안내&nbsp;》&nbsp;</a>
		<a href="#"><strong>Q &amp; A</strong></a>
	</div>
	<div id="board_update_btn">
		<input id="info" type="button" value="공지사항">
		<input id="qna" type="button" value="Q & A">
		<input id="lost" type="button" value="유실물 안내">
	</div>
	<!-- ========================= -->
		<form action="boardUp" method="post">
		<table >
			<tr class=board_update_tr>
				<th class="update_input_headline">작성자<strong>*</strong></th>
				<td class="update_input" id="reboard_td">
					&nbsp;&nbsp;${id }
				</td>
			</tr>
			<tr class=board_update_tr>
				<th class="update_input_headline">제목<strong>*</strong></th>
				<td class="update_input"><input id="title_input" type="text" name="qna_title" value="${bdto.qna_title }"></td>
			</tr>
			<tr class=board_update_tr>
				<th class="update_input_headline">글 내용<strong>*</strong></th>
				<td class="update_input"><textarea rows="10" cols="50" name="qna_content" id="content">${bdto.qna_content }</textarea></td>
			</tr>
			<tr class=board_update_tr>
				<td colspan="2" id="btn_next">
					<input id="reset" type="reset" value="다시작성">
					<input  type="hidden"  name="qna_num"  value="${bdto.qna_num }">
					<input id="update_go" type="submit" value="수정완료">
					<input id="update_list" type="button" onclick="location.href='boardListPage'" value="목록보기">
				</td>
			</tr>
			</table>
		</form>
    </div>
</body>
</html>