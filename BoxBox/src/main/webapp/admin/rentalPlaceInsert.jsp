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
<div class="rentalPlaceInsert">
	<h2>관리소 추가</h2>
	<form method="post" action="">
		<span id="address">관리소 위치 &nbsp;:&nbsp;</span>
		<select class="cmbRental">
			<optgroup label="지역">
				<option value=""></option>
			</optgroup>
		</select>
		<select class="cmbRental">
			<optgroup label="구">
				<option value=""></option>
			</optgroup>
		</select>
		<select class="cmbRental">
			<optgroup label="동">
				<option value=""></option>
			</optgroup>
		</select>
		<select class="cmbRental">
			<optgroup label="도로명">
				<option value=""></option>
			</optgroup>
		</select>
		<br>
		<input type="text" id="place" name="place" placeholder="관리소 이름을 입력하세요." autofocus
			required="required" />
		<br><br>		
		<input type="submit" class="btn btn-primary btn-block btn-large" value="관리소 추가" /><br><br>
		<input type="button" class="btn btn-primary btn-block btn-large" value="이전 페이지로 돌아가기"
			onClick="location.href='rentalPlaceDisplay.jsp'">
	</form>
</div>
</body>
</html>

