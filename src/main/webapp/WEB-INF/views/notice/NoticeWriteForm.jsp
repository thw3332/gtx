<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
    #notice_write_wrap { margin: 0 auto; width: 900px;  }
	#notice_write_wrap h1{ text-align:center; margin-bottom: 50px; }
	#notice_write_wrap #infomenu_div { margin: 0 auto; text-align:right; border-bottom: 2px solid gray; width: 900px; height: 30px; }
	#notice_write_wrap #infomenu_div a{ text-decoration: none; color: black; }
	#notice_write_wrap ##infomenu_div a:nth-last-of-type(1){font-weight: bold;} 
	#notice_write_wrap #notice_write_btn input { width: 295px; height: 55px; color:#3E3E3E; outline: none; vertical-align: middle; margin: 5px 0; border: 1px solid lightgray; background-color: #F4F4F4; font-size: 20px;}
	/*======================================================================*/    
    #notice_write_wrap table { margin: 0 auto; width: 900px; height: 350px; border-collapse:  collapse;  margin-top: 5px; border-top: 2px solid #6D3767;}
	#notice_write_wrap table .notice_write_tr .input_headline { margin: 0 auto; border: 1px solid gray; border-left:none; text-align: center; background: #F4F4F4; font-size: 17px; width: 100px; height: 50px;   }
	#notice_write_wrap table #btn_input { text-align: center; }
	#notice_write_wrap table .notice_write_tr .notice_write_input { margin: 0 auto; border: 1px solid gray; border-right: none; }
	#notice_write_wrap table .notice_write_tr .notice_write_input #title_input { margin: 0 auto; width: 97%; height: 35px; outline: none; border: 1px solid lightgray; margin-left: 10px; }
	#notice_write_wrap table #btn_input #write_go { width: 110px; height: 50px; border: none; ;background: #00508F; color: white; font-size: 15px; margin-top: 20px; cursor: pointer; }
	#notice_write_wrap table #btn_input #write_reset { width: 110px; height: 50px; border: none; ;background: #00508F; color: white; font-size: 15px; margin-top: 20px; cursor: pointer; }
	#notice_write_wrap table #btn_input #write_list { width: 110px; height: 50px; border: none; ;background: #3E3E3E; color: white; font-size: 15px; margin-top: 20px; margin-left: 556px; cursor: pointer; }
	strong { color: #6D3767;  }
	textarea { width: 97%; outline: none; border: 1px solid lightgray; margin: 10px;  }
	#board_write_td { text-align: left; }
	#notice_write_wrap table .board_write_tr #content { height: 250px; }
	strong { color: #6D3767;  }
</style>
</head>
<body>
<div id="notice_write_wrap">
	<h1>공지사항</h1>
	<div id="infomenu_div">
		<a href="#">홈&nbsp;》&nbsp;</a>
		<a href="#">고객안내&nbsp;》&nbsp;</a>
		<a href="#"><strong>공지사항</strong></a>
	</div>
	<div id="notice_write_btn">
		<input id="info" type="button" value="공지사항">
		<input id="qna" type="button" value="Q & A">
		<input id="lost" type="button" value="유실물 안내">
	</div>
	<!--============================-->
	<form action="noticeWrite" method="post">
		<table>
			<tr class="notice_write_tr">
				<th class="input_headline">작성자<strong>*</strong></th>
				<td class="notice_write_input" id="board_write_td">&nbsp;&nbsp;${id }</td>
			</tr>
			<tr class="notice_write_tr">
				<th class="input_headline">제목<strong>*</strong></th>
				<td class="notice_write_input"><input id="title_input" type="text" name="nt_title"></td>
			</tr>
			<tr class="notice_write_tr">
				<th class="input_headline">글 내용<strong>*</strong></th>
				<td class="notice_write_input"><textarea rows="10" cols="54" name="nt_content" id="content"></textarea></td>
			</tr>
			<tr class="notice_write_tr">
				<td colspan="2" id="btn_input">
					<input class="main_btn" id="write_go" type="submit" value="글쓰기">
					<input class="main_btn" id="write_reset" type="reset" value="다시작성">
					<input class="main_btn" id="write_list" type="button"  onclick="location.href='noticeListPage'" value="목록보기">
				</td>
			</tr>
			</table>
		</form>
    </div>
</body>
</html>