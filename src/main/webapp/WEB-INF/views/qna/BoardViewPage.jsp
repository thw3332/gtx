<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
  	#board_write_wrap { margin: 0 auto; width: 900px;}
  	#board_write_wrap h1{ text-align:center; margin-bottom: 50px; }
  	#board_write_wrap #infomenu_div { margin: 0 auto; text-align:right; border-bottom: 2px solid gray; width: 900px; height: 30px; }
  	#board_write_wrap #infomenu_div a{ text-decoration: none; color: black; }
  	#board_write_wrap #infomenu_div a:nth-last-of-type(1){font-weight: bold;}
  	#board_write_wrap #board_write_btn input { width: 295px; height: 55px; color:#3E3E3E; outline: none; vertical-align: middle; margin: 5px 0; border: 1px solid lightgray; background-color: #F4F4F4; font-size: 20px;}
    /*======================================================================*/
	#board_write_wrap table { margin: 0 auto; width: 900px; height: 350px; border-collapse:  collapse;  margin-top: 5px; border-top: 2px solid #6D3767; }
	#board_write_wrap table .board_write_tr .write_input_headline { margin: 0 auto; border: 1px solid gray; border-left:none; text-align: center; background: #F4F4F4; font-size: 17px; width: 100px; height: 50px;}
	#board_write_wrap table .board_write_tr .write_input { border: 1px solid gray; border-right: none; text-align: center;}
	#board_write_wrap table .board_write_tr #btn_next #rewrite_go { width: 110px; height: 50px; border: none; ;background: #00508F; color: white; font-size: 15px; margin-top: 20px; cursor: pointer; }
	#board_write_wrap table .board_write_tr #btn_next #rewrite_update { width: 110px; height: 50px; border: none; ;background: #00508F; color: white; font-size: 15px; margin-top: 20px; cursor: pointer; }
	#board_write_wrap table .board_write_tr #btn_next #rewrite_delete { width: 110px; height: 50px; border: none; ;background: #00508F; color: white; font-size: 15px; margin-top: 20px; cursor: pointer; }
	#board_write_wrap table .board_write_tr #btn_next #rewrite_list { width: 110px; height: 50px; border: none; ;background: #3E3E3E; color: white; font-size: 15px; margin-top: 20px; margin-left: 440px; cursor: pointer; }
	#board_write_wrap table .board_write_tr #content { height: 250px; }
	strong { color: #6D3767;  }
</style>
</head>
<body>
<div id="board_write_wrap">
	<h1>Q &amp; A</h1>
	<div id="infomenu_div">
		<a href="#">홈&nbsp;》&nbsp;</a>
		<a href="#">고객안내&nbsp;》&nbsp;</a>
		<a href="#"><strong>Q &amp; A</strong></a>
	</div>
	<div id="board_write_btn">
		<input id="info" type="button" value="공지사항">
		<input id="qna" type="button" value="Q & A">
		<input id="lost" type="button" value="유실물 안내">
	</div>
	<!--===========================================-->


	
		<table>
			<tr class="board_write_tr">
				<th class="write_input_headline">글 번호<strong>*</strong></th>
				<td class="write_input">${bdto.qna_num }</td>
				<th class="write_input_headline">작성자<strong>*</strong></th>
				<td class="write_input">${bdto.id }</td>
				<th class="write_input_headline">작성일<strong>*</strong></th>
				<td class="write_input">${bdto.qna_date }</td>
			</tr>

			 <tr class="board_write_tr">
				<th class="write_input_headline">제목<strong>*</strong></th>
				<td class="write_input" colspan="5">${bdto.qna_title }</td>
			</tr>
			<tr class="board_write_tr">
				<th class="write_input_headline">글 내용<strong>*</strong></th>
				<td class="write_input" id="content" colspan="5">${bdto.qna_content }</td>
			</tr>
			<tr class="board_write_tr">
				<th colspan="6" id="btn_next">
					<input class="left_btn" id="rewrite_go" type="button"  value="답글쓰기" onclick="location.href='boardReWrite?qna_num=${bdto.qna_num}&ref=${bdto.ref}&re_step=${bdto.re_step}&re_level=${bdto.re_level}'"> 
					<input class="left_btn" id="rewrite_update" type="button"  value="수정" onclick="location.href='boardUpPage?qna_num=${bdto.qna_num}&id=${bdto.id}'">
					<input class="right_btn" id="rewrite_delete" type="button"  value="삭제" onclick="location.href='boardDelete?qna_num=${bdto.qna_num}'">
					<input class="right_btn" id="rewrite_list" type="button"  value="목록보기" onclick="location.href='boardListPage'">
				</th>
			</tr>
			
			</table>
	</div>
</body>
</html>