<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
body { overflow-y: scroll; background: white; }
* { margin: 0; padding: 0; }
#section_div{height:100%; margin:60px auto; } 
</style>
</head>
<body>
	<c:if test="${empty section}"> <!-- section == null -->
 		<c:set var = "section" value="Section.jsp"/>
	</c:if>
	<jsp:include page="Header.jsp"></jsp:include>
	<div id="section_div"><jsp:include page="${section }"></jsp:include></div>
	<jsp:include page="Footer.jsp"></jsp:include>
</body>
</html>