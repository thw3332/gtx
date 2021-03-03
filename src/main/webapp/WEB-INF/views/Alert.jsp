<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${null ne msg}">
		<script type="text/javascript">
			alert("${msg}");
			location.href = "joinForm";
		</script>
	</c:if>
	
	<c:if test="${null ne selectchoice}">
		<script type="text/javascript">
			alert("${selectchoice}");
			history.back();
		</script>
	</c:if>
	<c:if test="${null ne notlogin}">
		<script type="text/javascript">
			alert("${notlogin}");
			history.back();
		</script>
	</c:if>
	<c:if test="${null ne find}">
		<script type="text/javascript">
			alert("${find}");
			history.back();
		</script>
	</c:if>
	
	<c:if test="${null ne loginmsg}">
		<script type="text/javascript">
			alert("${loginmsg}");
			history.back();
		</script>
	</c:if>
	
</body>
</html>