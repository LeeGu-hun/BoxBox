<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>  
<link rel = "stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/rentalPlaceInsert.css" />
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>BoxBox</title>
</head>
<body>
<div id="header">
	<c:if test="${ authInfo.type==1}">
		<%@include file="/admin/headerAdmin.jsp"%>
	</c:if>
	<c:if test="${authInfo.type==2 || authInfo.type!=1}">
		<%@include file="/include/header.jsp"%>
	</c:if>
</div>
<div class="rentalPlaceInsert">
	<h2>관리소 추가</h2>
	<form method="post" action="placeInsert">
		<span id="address">관리소 위치 &nbsp;:&nbsp;</span>
		<select class="cmbRental">
			<optgroup label="지역">
			<c:forEach var="place" items="${requestScope.place}">
			<option value="<c:out value="${place.postId}"/>">
				<c:out value="${place.city}" />
			</option>
		</c:forEach>
			</optgroup>
		</select>
		<select class="cmbRental">
			<optgroup label="구">
						<c:forEach var="place" items="${requestScope.place}">
			<option value="<c:out value="${place.postId}"/>">
				<c:out value="${place.gu}" />
			</option>
		</c:forEach>
			</optgroup>
		</select>
		<select class="cmbRental">
			<optgroup label="동">
						<c:forEach var="place" items="${requestScope.place}">
			<option value="<c:out value="${place.postId}"/>">
				<c:out value="${place.dong}" />
			</option>
		</c:forEach>
			</optgroup>
		</select>
		<select class="cmbRental">
			<optgroup label="도로명">
						<c:forEach var="place" items="${requestScope.place}">
			<option value="<c:out value="${place.postId}"/>">
				<c:out value="${place.street}" />
			</option>
		</c:forEach>
			</optgroup>
		</select>
		<br>
		<input type="text" id="place" name="place" placeholder="관리소 이름을 입력하세요." autofocus
			required="required" />
		<br><br>		
		<input type="submit" class="btn btn-primary btn-block btn-large" value="등  록" /><br><br>
	</form>
</div>
</body>
</html>

