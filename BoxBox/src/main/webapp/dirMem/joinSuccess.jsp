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
		$('#boxCell').css('height', contents);
		// 		var email = document.getElementById('emailConfirm').value;
		// 		if (email != "") {
		// 			alert(email + '이 이미 존재합니다.');
		// 		}
	}
</script>
<title>Welcome</title>
</head>
<body>
	<%@include file="/include/header.jsp"%>
	<div id="box">
		<div id="boxTable">
			<div id="boxCell">
				<span style="font-size: 17px;font-weight: bold;">
				${memberName }님 DSbook에 오신 것을 환영합니다.
				</span>
				<div id="line"></div>
				<div id="sNotice">
					회원님의 계정이 만들어졌습니다.
					이제 친구들과 쉽게 공유하고 연락할 수 있습니다.<br> 
					사용자 이름 또는 휴대폰 전화번호를 사용하여 로그인할 수 있습니다.<br>
					DSbook에 로그인하여 활동 시작하기.<br>
					<form:form action="<%=request.getContextPath() %>">
						<p style="text-align: right">
						<input type="submit" value="로그인 페이지 가기">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
					</form:form>
				</div><br><br>
			</div>
		</div>
	</div>
	<%@include file="/include/footer.jsp"%>
</body>
</html>