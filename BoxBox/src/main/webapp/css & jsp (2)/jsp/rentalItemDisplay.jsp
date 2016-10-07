<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>  
<link rel = "stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/rentalItemDisplay.css" />
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>BoxBox</title>
</head>
<div class="rentalItemDisplay">
	<h2>렌탈물품 관리 페이지</h2>
	<select class="cmbRental">
		<optgroup label="지역">
			<option value=""></option>
		</optgroup>
	</select>&nbsp;
	<select class="cmbRental">
		<optgroup label="대여관리소">
			<option value=""></option>
		</optgroup>
	</select>&nbsp;
	<select class="cmbRental">
		<optgroup label="대여물품 카테고리">
			<option value=""></option>
		</optgroup>
	</select>&nbsp;
	<select class="cmbRental">	
		<optgroup label="대여물품 종류">
			<option value=""></option>
		</optgroup>
	</select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<input type="button" id="btnItemDisplay" class="btnDisplay btnDisplay-primary btnDisplay-block btnDisplay-large"
		value="물품검색" onclick="'">
	<hr>
	<table class="rentalDisplay">
		<tr id="head">
			<td id="col1">지역</td>			
			<td id="col3">대여관리소</td>
			<td id="col2">대여번호</td>
			<td id="col4">카테고리</td>
			<td id="col5">종류</td>
			<td id="col6">설명</td>
			<td id="col7">사진</td>			
			<td id="col8">삭제</td>
		</tr>
		<tr id="row">
			<td id="col1">.</td>
			<td id="col3">.</td>
			<td id="col2">.</td>
			<td id="col4">.</td>
			<td id="col5">.</td>
			<td id="col6">.</td>
			<td id="col7">.</td>
			<td id="col8">
				<input type="button" id="updateRental" class="btn btn-primary btn-block btn-large"
					value="변경" onClick="location.href='rentalItemUpdate.jsp'">
				<input type="button" id="deleteRental" class="btn btn-primary btn-block btn-large"
					value="삭제" onClick="">
			</td>
		</tr>
	</table>
	<hr>
	<input type="button" id="insertRental" class="btnDisplay btnDisplay-primary btnDisplay-block btnDisplay-large"
		value="렌탈물품 추가하기" onclick="location.href='rentalItemInsert.jsp'">
</div>
</body>
</html>
