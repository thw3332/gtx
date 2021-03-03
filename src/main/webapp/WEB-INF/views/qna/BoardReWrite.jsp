<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#board_rewrite_wrap { margin: 0 auto; width: 900px;  }
	#board_rewrite_wrap h1{ text-align:center; margin-bottom: 50px; }
	#board_rewrite_wrap #infomenu_div { margin: 0 auto; text-align:right; border-bottom: 2px solid gray; width: 900px; height: 30px; }
	#board_rewrite_wrap #infomenu_div a{ text-decoration: none; color: black; }
	#board_rewrite_wrap ##infomenu_div a:nth-last-of-type(1){font-weight: bold;} 
	#board_rewrite_wrap #board_rewrite_btn input { width: 295px; height: 55px; color:#3E3E3E; outline: none; vertical-align: middle; margin: 5px 0; border: 1px solid lightgray; background-color: #F4F4F4; font-size: 20px;}
	/*======================================================================*/
	#board_rewrite_wrap table { margin: 0 auto; width: 900px; height: 350px; border-collapse:  collapse;  margin-top: 5px; border-top: 2px solid #6D3767;}
	#board_rewrite_wrap table .board_tr .input_headline { margin: 0 auto; border: 1px solid gray; border-left:none; text-align: center; background: #F4F4F4; font-size: 17px; width: 100px; height: 50px;   }
	#board_rewrite_wrap table #btn_input { text-align: center; }
	#board_rewrite_wrap table .board_tr .board_input { margin: 0 auto; border: 1px solid gray; border-right: none; }
	#board_rewrite_wrap table .board_tr .board_input #title_input { margin: 0 auto; width: 97%; height: 35px; outline: none; border: 1px solid lightgray; margin-left: 10px;  }
	#board_rewrite_wrap table #btn_input #rewrite_go { width: 110px; height: 50px; border: none; ;background: #00508F; color: white; font-size: 15px; margin-top: 20px; cursor: pointer; }
	#board_rewrite_wrap table #btn_input #rewrite_reset { width: 110px; height: 50px; border: none; ;background: #00508F; color: white; font-size: 15px; margin-top: 20px; cursor: pointer; }
	#board_rewrite_wrap table #btn_input #rewrite_list { width: 110px; height: 50px; border: none; ;background: #3E3E3E; color: white; font-size: 15px; margin-top: 20px; margin-left: 550px; cursor: pointer; }
	strong { color: #6D3767;  }
	textarea { width: 97%; outline: none; border: 1px solid lightgray; margin: 10px;  }
	#reboard_td { text-align: left; }
	#board_write_wrap table .board_write_tr #content { height: 250px; }
</style>
</head>
<body>

	<div id="board_rewrite_wrap">
	<h1>Q &amp; A</h1>
	<div id="infomenu_div">
		<a href="#">홈&nbsp;》&nbsp;</a>
		<a href="#">고객안내&nbsp;》&nbsp;</a>
		<a href="#"><strong>Q &amp; A</strong></a>
	</div>
	<div id="board_rewrite_btn">
		<input id="info" type="button" value="공지사항">
		<input id="qna" type="button" value="Q & A">
		<input id="lost" type="button" value="유실물 안내">
	</div>
	<!--===========================================-->
		<form action="boardRe" method="post">
		<table>
			<tr class="board_tr">
				<th class="input_headline">작성자&nbsp;<strong>*</strong></th>
				<td class="board_input" id="reboard_td">&nbsp;&nbsp;${id }</td>
			</tr>
			<tr class="board_tr">
				<th class="input_headline">제목&nbsp;<strong>*</strong></th>
				<td class="board_input">
					<input id="title_input" type="text" name="qna_title" value="   [답변]">
				</td>
			</tr>
			<tr class="board_tr">
				<th class="input_headline">글 내용&nbsp;<strong>*</strong></th>
				<td class="board_input">
				<textarea rows="15" cols="70" name="qna_content" id="content"></textarea>
				</td>
			</tr>
			<tr class="board_tr">
			</tr>
			<tr class="board_tr">
			<td colspan="2" id="btn_input">
				<input type="hidden" name="id" value="${id }">
				<input type="hidden"  name="ref"  value="${ref}">
				<input type="hidden"  name="re_step"  value="${re_step}">
				<input type="hidden"  name="re_level"  value="${re_level}">
				<input class="main_btn" id="rewrite_go" type="submit"  value="답글쓰기 완료">
				<input class="main_btn" id="rewrite_reset" type="reset"  value="다시작성">
				<input class="main_btn" id="rewrite_list" type="button"  onclick="location.href='boardListPage'" value="목록보기">
				</td>
				</tr>
			</table>
		</form>
	
	</div>
</body>
</html>