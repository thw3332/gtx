<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
    #notice_view_wrap { margin: 0 auto; width: 900px;}
    #notice_view_wrap h1{ text-align:center; margin-bottom: 50px; }
  	#notice_view_wrap #infomenu_div { margin: 0 auto; text-align:right; border-bottom: 2px solid gray; width: 900px; height: 30px; }
  	#notice_view_wrap #infomenu_div a{ text-decoration: none; color: black; }
  	#notice_view_wrap #infomenu_div a:nth-last-of-type(1){font-weight: bold;}
  	#notice_view_wrap #notice_view_btn input { width: 295px; height: 55px; color:#3E3E3E; outline: none; vertical-align: middle; margin: 5px 0; border: 1px solid lightgray; background-color: #F4F4F4; font-size: 20px;}
    /*======================================================================*/
    #notice_view_wrap table { margin: 0 auto; width: 900px; height: 350px; border-collapse:  collapse;  margin-top: 5px; border-top: 2px solid #6D3767; }
	#notice_view_wrap table .notice_view_tr .view_input_headline { margin: 0 auto; border: 1px solid gray; border-left:none; text-align: center; background: #F4F4F4; font-size: 17px; width: 100px; height: 50px;}
	#notice_view_wrap table .notice_view_tr .view_input { border: 1px solid gray; border-right: none; text-align: center;}
	#notice_view_wrap table .notice_view_tr #btn_next #view_update { width: 110px; height: 50px; border: none; ;background: #00508F; color: white; font-size: 15px; margin-top: 20px; cursor: pointer; }
	#notice_view_wrap table .notice_view_tr #btn_next #view_delete { width: 110px; height: 50px; border: none; ;background: #00508F; color: white; font-size: 15px; margin-top: 20px; cursor: pointer; }
	#notice_view_wrap table .notice_view_tr #btn_next #view_list { width: 110px; height: 50px; border: none; ;background: #3E3E3E; color: white; font-size: 15px; margin-top: 20px; margin-left: 555px; cursor: pointer; }
	#notice_view_wrap table .notice_view_tr #content { height: 250px; }
	strong { color: #6D3767;  }
</style>
</head>
<body>

<div id="notice_view_wrap">
	<h1>공지사항</h1>
	<div id="infomenu_div">
		<a href="#">홈&nbsp;》&nbsp;</a>
		<a href="#">고객안내&nbsp;》&nbsp;</a>
		<a href="#"><strong>공지사항</strong></a>
	</div>
	<div id="notice_view_btn">
		<input id="info" type="button" value="공지사항">
		<input id="qna" type="button" value="Q & A">
		<input id="lost" type="button" value="유실물 안내">
	</div>
	<!--===========================================-->
    <table>
        <tr class="notice_view_tr">
            <th class="view_input_headline">번호<strong>*</strong></th>
            <td class="view_input">${ndto.nt_num }</td>
            <th class="view_input_headline">작성자<strong>*</strong></th>
            <td class="view_input">${ndto.id }</td>
            <th class="view_input_headline">작성일<strong>*</strong></th>
            <td class="view_input">${ndto.nt_date }</td>
        </tr>
        <tr class="notice_view_tr">
            <th class="view_input_headline">제목<strong>*</strong></th>
            <td class="view_input" colspan="5">${ndto.nt_title }</td>
        </tr>	
        <tr class="notice_view_tr">
            <th class="view_input_headline">글 내용<strong>*</strong></th>
            <td class="view_input" id="content" colspan="5">${ndto.nt_content }</td>
        </tr>
        <tr class="notice_view_tr">
            <th colspan="6" id="btn_next">
                <input class="left_btn" id="view_update" type="button"  value="수정" onclick="location.href='noticeUpPage?nt_num=${ndto.nt_num}&id=${ndto.id}'">
                <input class="right_btn" id="view_delete" type="button"  value="삭제" onclick="location.href='noticeDelete?nt_num=${ndto.nt_num}'">
                <input type="button" id="view_list" value="목록보기" onclick="location.href='noticeListPage'">
            </th>
        </tr>	
    </table>
</div>
</body>
</html>