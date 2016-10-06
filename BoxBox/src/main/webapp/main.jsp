<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>BoxBox</title>
</head>
<body>
	<c:if test="${ empty authInfo}">
		<%@include file="/dirMem/join.jsp"%>
	</c:if>
	<c:if test="${ authInfo.type==1}">
		<%@include file="/admin/adminMain.jsp"%>
	</c:if>
	<c:if test="${authInfo.type==2}">
		<%@include file="/boxUser/userMain.jsp"%>
	</c:if>
</body>
</html>
