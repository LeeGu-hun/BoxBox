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
	<form:form method="post">
		<h1>회원 정보 변경</h1>
		<h2>이름</h2>
		<form:password path="name" name="name" id="name" values="${authInfo.name }" />
		<form:errors path="name"/>
		<h2>
			<spring:message code="currentPassword" />
		</h2>
		<form:password path="currentPassword" name="password" id="password" />
		<form:errors path="currentPassword" />
		<h2>
			<spring:message code="newPassword" />
		</h2>
		<form:password path="newPassword" name="password" id="password" />
		<form:errors path="newPassword" />
		<input type="submit" value="<spring:message code="change.btn" />">
	</form:form>
</body>
</html>