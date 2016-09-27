<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<head>

<body>

	<div id="box" style="margin-top:100px;">
		<div id="boxTable">
			<div id="boxCell">

				<form:form class="login" id="loginForm"  method="post">
					<h1 class="loginTitle">My SNS</h1>
					<h2 class="loginTitle" style="margin-top:10px;"><spring:message code="currentPassword" /></h1>
					<form:password path="currentPassword" class="loginInput" name="password" id="password" />
					<form:errors path="currentPassword" />
					<h2 class="loginTitle" style="margin-bottom:10px;"><spring:message code="newPassword" /></h2>
					<form:password path="newPassword" class="loginInput" name="password" id="password" />
					<form:errors path="newPassword" />
					<input type="submit" value="<spring:message code="change.btn" />" class="loginButton">
				</form:form>
			</div>
		</div>
	</div>

</body>
</html>