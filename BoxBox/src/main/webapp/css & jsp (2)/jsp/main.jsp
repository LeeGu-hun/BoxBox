<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>  
<link rel = "stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/main.css" />
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>BoxBox</title>
</head>
<div class="main">
	<h3>BoxBox와 함께 전국에서 렌탈을 쉽고 빠르게!.</h3>
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
	<input type="button" class="btn btn-primary btn-block btn-large"
		value="대여가능 물품 검색" onclick="'">
	<br><br>
	<hr>
	<h2>대여가능 물품 리스트</h2>	
	<table class="rentalDisplay">
		<tr id="head">
			<td id="col1">지역</td>
			<td id="col2">대여관리소</td>
			<td id="col3">카테고리</td>
			<td id="col4">종류</td>
			<td id="col5">설명</td>
			<td id="col6">사진</td>
		</tr>
		<tr id="row">
			<td id="col1">.</td>
			<td id="col2">.</td>
			<td id="col3">.</td>
			<td id="col4">.</td>
			<td id="col5">.</td>
			<td id="col6">.</td>
		</tr>		
	</table>
	<!-- 로그인페이지 가기 --> 
	<!-- <h3>보관함을 예약하고 싶으시다면 로그인하세요.</h3>
	<input type="button" class="btn btn-primary btn-block btn-large"
		value="로그인 페이지 가기" onclick="'"> -->
</div>
</body>
</html>
