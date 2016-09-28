<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<head>


<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><spring:message code="change.pwd.title" /></title>

</head>
<body>


	<p>
		<spring:message code="change.pwd.done" />
	</p>
	<p>
		<a href="<c:url value='/login'/>"> [<spring:message code="go.main" />]
		</a>

	</p>

</body>
</html>