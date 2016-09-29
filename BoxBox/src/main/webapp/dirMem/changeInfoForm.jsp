<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/join.css">
<script src="http://code.jquery.com/jquery-1.12.4.min.js"
	integrity="sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ="
	crossorigin="anonymous"></script>
<script src="http://code.jquery.com/ui/1.12.0/jquery-ui.js"
	integrity="sha256-0YPKAwZP7Mp3ALMRVB2i8GXeEndvCq3eSl/WsAl1Ryk="
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.0/jquery-ui.js"></script>
<script src="<%=request.getContextPath()%>/js/js.js"></script>
<html>
<head>
<head>
<body>
	<div class="login">
		<form:form method="post">
			<h1>회원 정보 변경</h1>
			<form:input path="name" name="name" id="name"
				value="${authInfo.name }" placeholder="이름" autofocus="autofocus"
				required="required" />
			<form:errors path="name" style="color: white; font-size:13px; " />
			<form:password path="currentPassword" name="currentPpassword"
				id="currentPassword" placeholder="현재 비밀번호" style="margin-top:5px;" />
			<form:errors path="currentPassword"
				style="color: white; font-size:13px; " />
			<form:password path="newPassword" name="password" id="password"
				placeholder="새 비밀번호" style="margin-top:5px;" />
			<form:errors path="newPassword"
				style="color: white; font-size:13px; " />
			<input class="btn btn-primary btn-block btn-large" type="submit"
				value="<spring:message code="change.btn" /> " style="margin-top:5px;"/>
		</form:form>
	</div>
</body>
</html>