<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-1.12.4.min.js"
	integrity="sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ="
	crossorigin="anonymous"></script>
<script src="http://code.jquery.com/ui/1.12.0/jquery-ui.js"
	integrity="sha256-0YPKAwZP7Mp3ALMRVB2i8GXeEndvCq3eSl/WsAl1Ryk="
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.0/jquery-ui.js"></script>
<script src="<%=request.getContextPath()%>/js/js.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/header.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/login.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/join.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/contents.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/footer.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/myList.css">

<style>
body {
	background-image:
		url("<%=request.getContextPath()%>/images/background.jpg");
	background-size: 100%;
}
</style>
<script>
	window.onload = function() {
		var contents = $(document).height()- ($('#header').height() + $('#footer').height())- $('#footer').height();
		$('#contents').css('height', contents);
		// 		var email = document.getElementById('emailConfirm').value;
		// 		if (email != "") {
		// 			alert(email + '이 이미 존재합니다.');
		// 		}
	}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>시현'sns</title>

</head>
<body>
	<%@include file="/include/header.jsp"%>
	<c:if test="${empty authInfo }">
		<%@include file="/dirMem/join.jsp"%>
	</c:if>
	<c:if test="${!empty authInfo }">
		<%@include file="/dirBoard/myList.jsp"%>
	</c:if>
	<%@include file="/include/footer.jsp"%>
</body>
</html>





