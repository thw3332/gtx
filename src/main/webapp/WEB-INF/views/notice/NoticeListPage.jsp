<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<style>
	#boardlistwrap { margin: 0 auto; width: 1280px; text-align:center; }
	#boardlistwrap h1 { text-align:center; margin-bottom: 50px; }
	#boardlistwrap #boardmenu { margin: 0 auto; text-align:right;   border-bottom: 2px solid gray; width: 900px; height: 30px; }
	#boardlistwrap #boardmenu a{ text-decoration: none; color: black; }
	#boardlistwrap #board_submenu_btn input { width: 295px; height: 55px; color:#3E3E3E; outline: none; vertical-align: middle; margin: 5px 0; border: 1px solid lightgray; background-color: #F4F4F4; font-size: 20px;}
	#boardlistwrap #board_submenu_btn input:hover{cursor: pointer; }
	#boardlistwrap table { margin: 0 auto; border-collapse:collapse; text-align:center; width: 900px;}
	#boardlistwrap table #mainbutton { text-align: right;}
	#boardlistwrap table #mainbutton #boardbutton { width:100px; height:45px; border:none; color: white; background: #00508F; font-size: 15px; margin-top: 30px; }
	#boardlistwrap table #boardlist { border-top: 2px solid black; border-bottom: 2px solid #D4D3D3; }
	#boardlistwrap table #boardlist td {height: 50px; font-size: 20px;}
	#boardlistwrap table #boardlist td:nth-child(1) { width: 100px;  }
	#boardlistwrap table #boardlist td:nth-child(2) { width: 600px; }
	#boardlistwrap table #boardlist td:nth-child(3), #boardlist td:nth-child(4) { width: 100px;  }
	#boardlistwrap table tr { width: 100px; }
	#boardlistwrap table tr td #title_btn { text-decoration: none; color:#3E3E3E;}
	#boardlistwrap table #board_info{border-bottom: 1px solid #D4D3D3;}
	#boardlistwrap table #board_info td {height: 45px; color: gray;}
	#boardlistwrap .pagbox{display: inline-block; line-height: 30px; width: 30px; height: 30px; border: 1px solid gray;}
	#boardlistwrap .pagbox:hover {background: #00508F; color:white;}
	#boardlistwrap .pagbox:hover b{color:white;}
	#boardlistwrap .pagbox .pag{text-decoration: none; color: black;}
	#boardlistwrap .pagboxon { width: 30px; height: 30px; border: 1px solid gray; display: inline-block; text-align: center; line-height: 30px; background: #00508F; }
	#boardlistwrap .pagboxon a { color: white;}
	#boardlistwrap .pagboxon .pagon:hover {color: white; }
	#boardlistwrap .pagboxoff:hover{background: #00508F; }
	#boardlistwrap .pagboxoff:hover a{color:white;}
	#boardlistwrap .pagboxoff { width: 30px; height: 30px; border: 1px solid gray; display: inline-block; text-align: center; line-height: 30px; }
	#boardlistwrap .pagboxon .pagon, #boardlistwrap .pagboxoff .pagoff{  color: black;  text-decoration: none;}
	#boardlistwrap #search { margin-left: 520px; }
	#boardlistwrap #search #search_input { width: 200px; height: 30px; margin: 5px; display: inline-block; outline: none;}
	#boardlistwrap #search #search_btn{display: inline-block; width: 100px; height: 35px; }
	strong { color: #6D3767;  }
</style>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="boardlistwrap">
	<h1>공지사항</h1>
	<div id="boardmenu">
		<a href="#">홈&nbsp;》&nbsp;</a>
		<a href="#">고객안내&nbsp;》&nbsp;</a>
		<a href="#"><strong>공지사항</strong></a>
	</div>
	<form action="noticeListPage">
		<div id="search">
			SEARCH<input id="search_input" type="text" name="search">
			<input type="submit" value="검색" id="search_btn">
		</div>
	</form>
	<table>
		<tr id="boardlist">
			<td>번호</td>
			<td>제목</td>
			<td>작성일</td>
		</tr> 
		<c:set var="number" value="${number }" />
		<c:forEach var="ndto" items="${ndto }" >
		<tr id="board_info">
			<td>${number }</td>
			<td>
				<a id="title_btn" href="NoticeView?nt_num=${ndto.nt_num }">${ndto.nt_title }</a>
			</td>
			
				<c:set var="now" value="<%= new java.util.Date() %>"/>
				<fmt:formatDate var= "currDate" pattern="yyyy-MM-dd" value="${now}"/>
				<fmt:parseDate var="currdate" value="${currDate}" pattern="yyyy-MM-dd" />
				<fmt:formatDate var= "curr_Date" pattern="HH:mm" value="${currdate}"/>
				<fmt:parseDate var="write_date_format" value="${ndto.nt_date}" pattern="yyyy-MM-dd" />
				<fmt:formatDate var= "dbDate" pattern="yyyy-MM-dd" value="${write_date_format}"/>
				<c:choose>
					<c:when test="${dbDate eq currDate}">
						<td>${curr_Date}</td>
					</c:when>
					<c:otherwise>
						<td>${dbDate}</td>
					</c:otherwise>
				</c:choose> 
			
		</tr>
			<c:set var="number" value="${number-1}" />
			</c:forEach>
			<tr>	
			<td id="mainbutton" colspan="5">
				<button id="boardbutton" onclick="location.href='NoticeWriteForm'">등록</button>
			</td>
		</tr>
		</table>
		<!-- [이전] 링크를 걸지 파악 -->
		<c:if test="${startPage > 3 }" >
			<div class="pagbox">
				<a class="pag" href="noticeListPage?pageNum=${startPage-3 }"><b>《</b></a>
			</div>	
		</c:if>
		<!-- 숫자 페이징 [1] [2] [3 --> 
		<c:forEach var="i" begin="${startPage }" end="${endPage }">
			<c:choose>
			  <c:when test="${i==CurrentPage }">
				<div class="pagboxon">
					<a class="pagon" href="noticeListPage?pageNum=${i }">${i }</a>
				</div>
			  </c:when>
			  <c:otherwise>
				<div class="pagboxoff">
					<a class="pagoff" href="noticeListPage?pageNum=${i }">${i }</a>
				</div>
			  </c:otherwise>
			</c:choose>	
		</c:forEach>​
		<!-- [다음]링크를 걸지 파악 -->
		<c:if test="${pageCount > endPage }" >
		  &nbsp;<div class="pagbox">
			<a class="pag" href="noticeListPage?pageNum=${startPage+3 }"><b>》 </b></a>
		  </div>	
		</c:if>	​
	</div>
</body>
</html>