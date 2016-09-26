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
		$('#box').css('height', contents);
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
	<div id="box" style="margin-top:100px;">
		<div id="boxTable">
			<div id="boxCell">
				<form:form commandName="loginCommand" id="loginFrm" class="login">
				
	
						<b class="loginTitle" style="font-size: 15px;color:red;"><form:errors /></b>
						<h2 class="loginTitle" style="margin-top: 10px;">이메일</h2>
							<form:input path="email" class="loginInput" name="email" id="email" />
							<form:errors path="email" />
							<h2 class="loginTitle" style="margin-bottom: 10px;">비밀번호</h2>
							<form:password path="password" class="loginInput" name="password" id="password" />
							<form:errors path="password" />
							<p style="margin-bottom: 20px;">
								<label>E-mail 기억 : <form:checkbox path="rememberEmail" />
									<form:errors path="rememberEmail" />
								</label>
							</p>
							<input type="submit" value="로 그 인" class="loginButton">

				</form:form>
			</div>
		</div>
	</div>
	<%@include file="/include/footer.jsp"%>
</body>
</html>