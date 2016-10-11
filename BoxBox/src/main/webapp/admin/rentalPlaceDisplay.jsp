<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>  
<link rel = "stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/rentalPlaceDisplay.css" />
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>BoxBox</title>
</head>
<div class="rentalPlaceDisplay">
	<h2>관리소 관리 페이지</h2>
	<select class="cmbRental">
		<optgroup label="지역">
			<option value=""></option>
		</optgroup>
	</select>&nbsp;
	<select class="cmbRental">
		<optgroup label="구">
			<option value=""></option>
		</optgroup>	
	</select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<input type="button" id="btnPlaceDisplay" class="btnDisplay btnDisplay-primary btnDisplay-block btnDisplay-large"
		value="관리소검색" onclick="'">
	<hr>
	<table class="rentalDisplay">
		<tr id="head">
			<td id="colId">관리소번호</td>
			<td id="col1">지역</td>			
			<td id="col2">대여관리소</td>	
			<td id="col3">주소</td>					
			<td id="col4">삭제</td>
		</tr>
		<tr id="row">
			<td id="colId">.</td>
			<td id="col1">.</td>
			<td id="col2">.</td>
			<td id="col3">.</td>
			<td id="col4">
				<input type="button" id="updatePlace" class="btn btn-primary btn-block btn-large"
					value="변경" onClick="location.href='rentalPlaceUpdate.jsp'">
				<input type="button" id="deletePlace" class="btn btn-primary btn-block btn-large"
					value="삭제" onClick="">
			</td>
		</tr>
	</table>
	<hr>
	<input type="button" id="insertPlace" class="btnDisplay btnDisplay-primary btnDisplay-block btnDisplay-large"
		value="관리소 추가하기" onclick="location.href='rentalPlaceInsert.jsp'">
</div>
</body>
</html>
